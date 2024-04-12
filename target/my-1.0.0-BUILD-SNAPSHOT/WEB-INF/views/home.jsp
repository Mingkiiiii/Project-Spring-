<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    </head>
    <body>
   		<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
   		
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
      </div>
        <!-- footer 영역 -->
        <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
        <!-- footer 영역 -->
        

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
