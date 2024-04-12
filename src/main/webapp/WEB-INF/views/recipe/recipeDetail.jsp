<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe Detail</title>
<jsp:include page="/WEB-INF/inc/script.jsp"></jsp:include>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/recipe/recipe-view.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment/comment.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/etc/board.css">
</head>
<body>
	<div id="wrap">
		<!-- 상단 영역 -->
		<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

		<!-- 컨텐츠 중간 영역 -->
		<div id="contents">
			<!-- 컨텐츠 섹션 영역 -->
			<div id="section">
				<div class="section-list">
					<div class="container">
						<div class="recipe-view">
							<div class="recipe-top">
								<h4 class="recipe-name">${recipe.recipeName}</h4>
								<p class="write-date">${recipe.writeDate}</p>
							</div>

							<div class="recipe-content">
								<div class="recipe-youtube">
									<div id="player"></div>
								</div>

								<div class="recipe-text se2_outputarea">
									${recipe.recipeText}</div>
							</div>



							<div class="recipe-grade">
								<ul id="starRating">
									<li class="fill-star"><i class="fas fa-star"></i></li>
									<li class="fill-star"><i class="fas fa-star"></i></li>
									<li class="fill-star"><i class="fas fa-star"></i></li>
									<li class="fill-star"><i class="fas fa-star"></i></li>
									<li class="empty-star"><i class="far fa-star"></i></li>
								</ul>
							</div>
							<div class="board-control-btn">
								<c:if test="${sessionScope.login.userId == recipe.userId}">
									<form action="<c:url value="/recipeEdit" />" method="post">
										<input type="hidden" name="recipeNo"
											value="${recipe.recipeNo}">
										<button type="submit" class="modify-btn">수정</button>
									</form>
									<form action="<c:url value="recipeDel" />" method="post"
										id="delForm">
										<input type="hidden" name="recipeNo"
											value="${recipe.recipeNo}">
										<button type="button" class="remove-btn" onclick="fn_check()">삭제</button>
									</form>

								</c:if>





								<c:choose>
									<c:when test="${recipe.scrapYn eq 'N'}">
										<!-- 스크랩되어 있지 않은 경우 -->
										<form action="<c:url value='insertScrap' />" method="post"
											id="scrapForm">
											<input type="hidden" name="recipeNo"
												value="${recipe.recipeNo}">
											<button type="submit" class="scrap-btn">스크랩</button>
										</form>
									</c:when>
									<c:when test="${recipe.scrapYn eq 'Y'}">
										<!-- 스크랩되어 있는 경우 -->
										<form action="<c:url value='scrapDel' />" method="post"
											id="scrapDelForm">
											<input type="hidden" name="recipeNo"
												value="${recipe.recipeNo}"> <input type="hidden"
												name="userId" value="${sessionScope.login.userId}">
											<button type="submit" class="scrap-btn">스크랩 취소</button>
										</form>
									</c:when>
								</c:choose>










							</div>

							<form id="commentForm" action="" method="post">
								<div class="recipe-comment" id="commentBody">
									<h5 class="comment-title">댓글</h5>
									<div class="comment-write-form">
										<input type="hidden" name="recipeNo"
											value="${recipe.recipeNo}">
										<textarea name="commentText" id="commentInput"
											class="form-control" rows="3" placeholder="댓글을 작성해주세요."></textarea>
										<input type="hidden" name="userId" value="">
										<div class="comment-write-btn">
											<button type="button"
												onclick="fn_comment('${sessionScope.login.userId}', '${recipe.recipeNo}')">작성</button>
										</div>
									</div>
								</div>
							</form>
						</div>

						<div class="recipe-comment">
							<div class="comment-list" id="commentList">
								<c:forEach var="comment" items="${commentList}">
									<div class="comment-item" id="commentItem-${comment.commentNo}">
										<div class="comment-top">
											<div class="comment-writer-name">
												<div class="writer-image image">
													<img
														src="${pageContext.request.contextPath}${comment.userImage}"
														alt="${comment.userName}">
												</div>
												<h4>${comment.userName}</h4>
											</div>
											<div class="comment-write-date">
												<c:if test="${sessionScope.login.userId == comment.userId}">
													<div class="comment-remove"
														onclick="fn_deleteComment('${sessionScope.login.userId}', '${recipe.recipeNo}', '${comment.commentNo}')">X</div>
												</c:if>
												<p>${comment.commentDate}</p>
											</div>
										</div>
										<div class="comment-text">
											<p>${comment.commentText}</p>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

	<script>
		// YouTube API 불러오는 부분
		var tag = document.createElement('script');
		tag.src = "https://www.youtube.com/iframe_api";
		var firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

		// 플레이어 변수 설정x
		var player;

		function onYouTubeIframeAPIReady() {
			player = new YT.Player('player', {
				videoId : '${recipe.recipeYoutube}',
				events : {
					'onReady' : onPlayerReady,
					'onStateChange' : onPlayerStateChange
				}
			});
		}

		function onPlayerReady(event) {
			event.target.playVideo(); // 자동 재생
		}

		var done = false;

		function onPlayerStateChange(event) {
			if (event.data == YT.PlayerState.PLAYING && !done) {
				done = true;
			}
		}

		function fn_check() {
			if (confirm("정말 삭제 하시겠습니까?")) {
				document.getElementById("delForm").submit();
			}
		}

		// 댓글 등록
		function fn_comment(p_id, p_no) {
			if (p_id == '') {
				alert("댓글은 로그인 이후에 가능합니다.");
				return;
			}
			let msg = $("#commentInput").val();
			if (msg == '') {
				alert("댓글 내용을 입력해주세요.");
				return;
			}
			let json_data = {
				recipeNo : p_no,
				userId : p_id,
				commentText : msg
			};
			$
					.ajax({
						url : '<c:url value="/writeCommentDo" />',
						type : 'POST',
						contentType : 'application/json',
						dataType : 'json',
						data : JSON.stringify(json_data),
						success : function(res) {
							console.log(res);
							let str = "";
							str += "<div class='comment-item' id='commentItem-" + res.commentNo + "'>";
							str += "<div class='comment-top'>";
							str += "<div class='comment-writer-name'>";
							str += "<div class='writer-image image'>";
							str += "<img src='${pageContext.request.contextPath}" + res.userImage + "' alt='" + res.userName + "'>";
							str += "</div>";
							str += "<h4>" + res.userName + "</h4>";
							str += "</div>";
							str += "<div class='comment-write-date'>";
							str += "<div class='comment-remove' onclick=\"fn_deleteComment('${sessionScope.login.userId}', '${recipe.recipeNo}', '"
									+ res.commentNo + "')\">X";
							str += "</div>";
							str += "<p>" + res.commentDate + "</p>";
							str += "</div>";
							str += "</div>";
							str += "<div class='comment-text'>";
							str += "<p>" + res.commentText + "</p>";
							str += "</div>";
							str += "</div>";

							$("#commentList").prepend(str);
							$("#commentInput").val(''); // 입력창 초기화
						},
						error : function(e) {
							console.log(e);
						}
					});
		}

		// 댓글 삭제 함수
		function fn_deleteComment(p_id, p_no, p_cno) {
			let json_data = {
				recipeNo : p_no,
				commentNo : p_cno,
				userId : p_id
			};
			if (confirm("정말 삭제하시겠습니까?")) {
				// 서버로 댓글 삭제 요청을 보냅니다.
				$.ajax({
					url : '<c:url value="/commentDel" />',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(json_data),
					success : function(response) {
						// 삭제 성공 시 해당 댓글을 화면에서 제거합니다.
						$('#commentItem-' + p_cno).remove();
						alert("댓글이 삭제되었습니다.");
					},
					error : function(xhr, status, error) {
						console.error(error);
						alert("댓글 삭제 중 오류가 발생했습니다.");
					}
				});
			}
		}
		
		
		document.addEventListener('DOMContentLoaded', function () {
	        const stars = document.querySelectorAll('#starRating li');

	        stars.forEach((star, index) => {
	            star.addEventListener('click', function () {
	                // 클릭된 별의 인덱스
	                const clickedIndex = index;

	                // 모든 별 초기화 (비워진 별로 설정)
	                stars.forEach((star, idx) => {
	                    if (idx <= clickedIndex) {
	                        star.classList.remove('empty-star');
	                        star.classList.add('fill-star');
	                    } else {
	                        star.classList.remove('fill-star');
	                        star.classList.add('empty-star');
	                    }
	                });
	            });
	        });
	    });
	</script>
</body>
</html>
