<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>MYRECIPE</title>
    <jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recipe.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
<div id="wrap">
    <div id="contents">
        <!-- 메인 배너 -->
        <div id="main-banner">
            <div class="container">
                <div class="banner-image">
                    <ul>
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/assets/img/banner/banner_1.jpg" alt="배너 1">
                        </li>
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/assets/img/banner/banner_2.jpg" alt="배너 2">
                        </li>
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/assets/img/banner/banner_3.jpg" alt="배너 3">
                        </li>
                    </ul>
                    <div class="banner-arrow">
                        <button class="prev-btn"><i class="fas fa-chevron-left"></i></button>
                        <button class="next-btn"><i class="fas fa-chevron-right"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <div id="section">
            <section id="my-recipe">
                <div class="section-title">
                    <h2>나의 레시피</h2>
                    <p>My Recipe</p>
                </div>
                <div class="section-list">
                    <div class="container">
                        <div class="row">
                            <c:if test="${not empty scrapList}">
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
                                                        <p>스크랩 : ${scrap.scrapCount}</p>
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
                            </c:if>
                            <c:if test="${empty scrapList}">
                                <p>스크랩한 레시피가 없습니다.</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
    $(document).ready(function() {
        $('.banner-image > ul').slick({
            autoplay: true,
            arrows: false,
        });

        $('.banner-arrow .prev-btn').on('click', function(e) {
            $('.banner-image > ul').slick('slickPrev');
        })

        $('.banner-arrow .next-btn').on('click', function(e) {
            $('.banner-image > ul').slick('slickNext');
        })
    });
</script>

</body>
</html>
