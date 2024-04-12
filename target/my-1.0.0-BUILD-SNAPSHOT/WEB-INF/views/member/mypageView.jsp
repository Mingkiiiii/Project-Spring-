<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user/mypage.css">

</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<div id="wrap">
		<!-- 상단 영역 -->

		<!-- 컨텐츠 중간 영역 -->
		<div id="contents">
			<div id="my-page">
				<div class="section-title">
					<h2>마이페이지</h2>
					<p>My Page</p>
				</div>
				<div class="user-image">
					<div class="user-icon image">
						<c:if test="${sessionScope.login.userImage == null }">
							<img src="<c:url value="/assets/img/non.png" />" id="userImage"
								class="rounded-circle img-thumbnail shadow-sm" width="200px"
								style="cursor: pointer;">
						</c:if>
						<c:if test="${sessionScope.login.userImage != null }">
							<img src="<c:url value="${sessionScope.login.userImage}" />"
								id="userImage" class="rounded-circle img-thumbnail shadow-sm"
								width="200px" style="cursor: pointer;">
						</c:if>
						<form id="profileForm" entype="multipart/form-data">
							<input type="file" name="uploadImage" id="uploadImage"
								accept="image/*" style="display: none;">
						</form>
						<input type="hidden" name="userImage" id="userImage" value="">
						<input type="file" name="user_image_file" id="user_image_file"
							onChange="userImageUpload();" style="display: none;">
					</div>
				</div>
				<div class="mypage-form">
					<form method="post" action="<c:url value="updateDo" /> ">

						<div class="user-info">
							<div class="form-group">
								<label for="user_id">아이디</label> <input type="text"
									name="userId" id="userId" class="form-control"
									value="${sessionScope.login.userId}" disabled> <input
									type="hidden" value="${sessionScope.login.userId}"
									name="userId">
							</div>

							<div class="form-group">
								<label for="email">이메일</label> <input type="email"
									name="userEmail" id="userEmail" class="form-control"
									value="${sessionScope.login.userEmail}" disabled> <input
									type="hidden" value="${sessionScope.login.userEmail}"
									name="userEmail">


								<div class="form-group">
									<label for="user_name">이름</label> <input type="text"
										name="userName" id="userName" class="form-control"
										value="${sessionScope.login.userName}">
								</div>

							</div>
						</div>

						<div class="form-btn">
							<button type="submit">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#userImage").click(function(){
				$("#uploadImage").click();
			});
			$("#uploadImage").on("change", function(){
				let file = $(this)[0].files[0];
				if(file){
					let fileType = file['type'];
					let valTypes = ['image/gif', 'image/jpeg', 'image/png', 'image/jpg'];
					if(!valTypes.includes(fileType)){
						alert("유효한 이미지 타입이 아닙니다!!");
						$(this).val('') //파일 초기화
					
				}else{
					let formData = new FormData($('#profileForm')[0]);
					console.log(formData);
					$.ajax({
						url : "<c:url value='/files/upload' />"
						,type : "POST"
						,data:formData
						,dataType:'json'
						// jquery가 데이터를 처리(직렬화) 할지 여부를 지정
						// 파일을 전송할때는 false
						,processData:false
						,contentType:false
						,success:function(res){
							console.log(res);
							if(res.message == 'success'){
								$("#userImage").attr('src', '${pageContext.request.contextPath}' + res.imgPath);	
							}
							
						},error:function(e){
							console.log(e);
						}
					});
					
				}
				}
			});
		});
	</script>
</body>
</html>