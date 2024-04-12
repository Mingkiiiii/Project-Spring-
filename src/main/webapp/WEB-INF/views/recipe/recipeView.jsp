<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>레시피</title>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/recipe.css">
<!-- 기타 메타 태그와 CSS 링크 추가 가능 -->
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<div id="wrap">
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
							<c:if test="${sessionScope.login != null}">
								<div class="writer-btn">
									<a href="<c:url value="recipeWrite" />">
										<button type="button" class="btn btn-primary">레시피 작성</button>
									</a>
								</div>
							</c:if>
							<div class="row">
								<c:forEach items="${recipeList}" var="recipe">
									<div class="col-md-6">
										<div class="box"
											onclick="window.location.href='<c:url value="/recipeDetail?recipeNo=${recipe.recipeNo}" />'">
											<div class="info-box">
												<h4>${recipe.recipeName}</h4>

												<div class="recipe-grade">
													<ul>
														<!-- 별점 출력 예시 -->
														
														<li class="fill-star"><i class="fas fa-star"></i></li>
														<li class="fill-star"><i class="fas fa-star"></i></li>
														<li class="fill-star"><i class="fas fa-star"></i></li>
														<li class="fill-star"><i class="fas fa-star"></i></li>
														<li class="empty-star"><i class="far fa-star"></i></li>
													</ul>
												</div>

												<div class="box-bottom">
													<div class="scrap-count">
														<p>스크랩 : ${recipe.scrapCount}</p>
													</div>

													<div class="writer-name">
														<p>작성자 : ${recipe.userName}</p>
													</div>
												</div>
											</div>

											<div class="info-image image">
												<img
													src="${pageContext.request.contextPath}${recipe.recipeImage}"
													alt="레시피 이미지">
											</div>
										</div>
									</div>
								</c:forEach>
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
