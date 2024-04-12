<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<div id="header">
  <div class="container">
    <div class="hd-wrap">
      <div class="util-menu">
        <ul>
          <c:if test="${sessionScope.login == null}">
          <li><a href="<c:url value="/registView" />">회원가입</a></li>
          <li><a href="<c:url value="/loginView" />">로그인</a></li>
          </c:if>
          <c:if test="${sessionScope.login != null}">
          <li><a href="<c:url value="/mypageView" />">${sessionScope.login.userName} 님</a></li>
          <li><a href="<c:url value="/logoutDo" />">로그아웃</a></li>
          </c:if>
        </ul>
      </div>

      <div id="logo">
        <h1><a href="<c:url value="/" />">MYRECIPE</a></h1>
      </div>

      <div id="main-menu">
        <ul>
          <li><a href="<c:url value="/recipeView" />">레시피</a></li>
          <li><a href="<c:url value="/cooktipView" />">나의 요리팁</a></li>
          <li><a href="<c:url value="/recipeScrap" />">나의 레시피</a></li>
          <li><a href="<c:url value="/chat" />">레시피 추천</a></li>
          <li><a href="<c:url value="/mypageView" />">마이페이지</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
