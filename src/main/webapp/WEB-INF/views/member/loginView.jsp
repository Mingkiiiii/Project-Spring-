<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user/login.css">
</head>

<body>
	<div id="wrap">
		<!-- 상단 영역 -->
		<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
		<!-- 컨텐츠 중간 영역 -->
		<div id="contents">
			<div id="login-page">
				<div class="sub-title">
					<h3>로그인</h3>
				</div>

				<form class="login-form" method="post"
					action="<c:url value="/loginDo" /> ">
					<div class="form-row">
						<div class="col-md-4">
							<label for="userId">아이디 <span class="required-star">*</span></label>
						</div>
						<div class="col-md">
							<input type="text" name="userId" id="userId" class="form-control"
								placeholder="아이디를 입력해주세요" />
						</div>
					</div>

					<div class="form-row">
						<div class="col-md-4">
							<label for="userPw">비밀번호 <span class="required-star">*</span></label>


						</div>
						<div class="col-md">
							<input type="password" name="userPw" id="userPw"
								class="form-control" placeholder="비밀번호를 입력해주세요" />
						</div>
					</div>
				<div class="hd-wrap" style="margin-left: 420px;">
    <div class="util-menu">
        <ul>
            <li style="margin-right: 10px;"><a href="<c:url value="/idFind" />" style="color: black;">아이디 찾기</a></li>
            <li><a href="<c:url value="/" />" style="color: black;">비밀번호 찾기</a></li>
        </ul>
    </div>
</div>



					<div class="form-btn">
						<div class="login-btn">
							<button type="submit" id="submitButton">로그인</button>
							<input type="hidden" name="fromUrl" value="${fromURL}">
						</div>

						<div class="join-btn">
							<button type="button" id="submitButton2"
								onclick="location.href='<c:url value='/registView' />'">회원가입</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 하단 영역 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	</div>

</body>

</html>
