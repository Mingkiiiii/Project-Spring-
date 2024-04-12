<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크랩</title>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/recipe.css">
</head>
<body>
 <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
 
  <div id="wrap">
        <div id="contents">
            <div id="section">
                <section id="my-recipe">
                    <div class="section-title">
                        <h2>나의 레시피</h2>
                        <p>My Recipe</p>
                    </div>
                    <div class="section-list">
                        <div class="container">
                        
                        <div class="row">
                                <c:forEach items="${scrapList}" var="scrap">
                                    <div class="col-md-6">
										<div class="box" onclick="window.location.href='<c:url value="/recipeDetail?recipeNo=${scrap.recipeNo}" />'">
                                            <div class="info-box">
                                                <h4>${scrap.recipeName}</h4>

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
                                                        <p>스크랩 : ${scrap.scrapCount	 }</p>
                                                    </div>

                                                    <div class="writer-name">
                                                        <p>작성자 : ${scrap.userName}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="info-image image">
                                                <img src="${pageContext.request.contextPath}${scrap.recipeImage}" alt="레시피 이미지">
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
        </div>
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>                 
</body>
</html>