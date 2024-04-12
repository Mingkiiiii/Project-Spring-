<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>레시피</title>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/recipe.css">
<!-- 기타 메타 태그와 CSS 링크 추가 가능 -->
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<div id="wrap">
		<!-- 상단 영역 -->
		<!-- 상단 헤더 부분은 서버 사이드 포함 코드로 생략 -->

		<!-- 컨텐츠 중간 영역 -->
		<div id="contents">
			<!-- 컨텐츠 섹션 영역 -->
			<div id="section">
				<section id="my-recipe">
					<div class="section-title">
						<h2>레시피</h2>
						<p>Recipe</p>
					</div>

					<div class="section-list">
						<div class="container">
							<!-- 레시피 작성 버튼은 로그인 상태에 따라 동적으로 표시되므로 예시로만 제공 -->
							<div class="writer-btn">
								<a href="<c:url value="recipeWrite" />">
		   			<button type="button" class="btn btn-primary">레시피 작성</button>
		  		</a>
							</div>
						  
							<div class="row">
								<div class="col-md-6">
									<div class="box"
										onClick="href=">
										<div class="info-box">
											<h4>레시피 이름</h4>

											<div class="recipe-grade">
												<ul>
													<!-- 별점 출력 예시 -->
													<li class="fill-star"><i class="fas fa-star"></i></li>
													<li class="empty-star"><i class="far fa-star"></i></li>
												</ul>
											</div>
										
											<div class="box-bottom">
												<div class="scrap-count">
													<p>스크랩 : 1</p>
												</div>

												<div class="writer-name">
													<p>작성자 : ${recipeList.userName }</p>
												</div>
											</div>
										</div>

										<div class="info-image image">
											<img src="/uploads/recipe/예시이미지.jpg" alt="레시피 이미지">
										</div>
									</div>
								</div>
							
								<!-- 레시피 데이터 반복 부분 끝 -->
							</div>
							
						</div>
					</div>
				</section>
			</div>
		</div>

		<!-- 하단 영역 -->
		<!-- 하단 푸터 부분은 서버 사이드 포함 코드로 생략 -->
	</div>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>


</body>
</html>
