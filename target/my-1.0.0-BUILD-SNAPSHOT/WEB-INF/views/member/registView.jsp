<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/join.css">
</head>

<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
  <div id="wrap">
    <!-- 상단 영역 -->

    <!-- 컨텐츠 중간 영역 -->
    <div id="contents">
      <div id="login-page">
        <div class="sub-title">
          <h3>회원가입</h3>
        </div>

        <div class="login-form">
          <form method="post" action="<c:url value="registDo" /> ">
            <div class="form-row">
              <div class="col-md-4">
                <label for="userId">아이디 <span class="required-star">*</span></label>
              </div>
              <div class="col-md">
                <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력해주세요" />
              </div>
            </div>

            <div class="form-row">
              <div class="col-md-4">
                <label for="userPw">비밀번호 <span class="required-star">*</span></label>
              </div>
              <div class="col-md">
                <input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호를 입력해주세요" />
              </div>
            </div>

            <div class="form-row">
              <div class="col-md-4">
                <label for="userName">이름 <span class="required-star">*</span></label>
              </div>
              <div class="col-md">
                <input type="text" name="userName" id="userName" class="form-control" placeholder="이름을 입력해주세요" />
              </div>
            </div>

            <div class="form-row">
              <div class="col-md-4">
                <label for="userEmail">이메일 <span class="required-star">*</span></label>
              </div>
              <div class="col-md">
                <input type="email" name="userEmail" id="userEmail" class="form-control" placeholder="이메일을 입력해주세요" />
              </div>
            </div>

            <div class="form-btn">
              <div class="login-btn">
                <button id="submitButton" type="submit">회원가입</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- 하단 영역 -->
  </div>
  <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>