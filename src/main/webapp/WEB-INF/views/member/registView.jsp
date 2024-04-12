<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/join.css">
<script>
function validateForm() {
    var userId = document.getElementById("userId").value;
    var userPw = document.getElementById("userPw").value;
    var userName = document.getElementById("userName").value;
    var userEmail = document.getElementById("userEmail").value;

    // 아이디가 6자 이상 12자 이하인지 확인
    if (userId.length < 6	 || userId.length > 12) {
        document.getElementById("userIdErrorMessage").innerText = "아이디는 4자 이상 12자 이하로 입력해주세요.";
        return false;
    } else {
        document.getElementById("userIdErrorMessage").innerText = ""; // 에러 메시지 초기화
    }

    // 비밀번호가 6자 이상 15자 이하인지 확인
    if (userPw.length < 6 || userPw.length > 15) {
        document.getElementById("userPwErrorMessage").innerText = "비밀번호는 6자 이상 15자 이하로 입력해주세요.";
        return false;
    } else {
        document.getElementById("userPwErrorMessage").innerText = ""; // 에러 메시지 초기화
    }

    // 나머지 필드가 비어있는지 확인
    if (userName == "" || userEmail == "") {
        document.getElementById("otherFieldsErrorMessage").innerText = "모든 필드를 입력해주세요.";
        return false;
    } else {
        document.getElementById("otherFieldsErrorMessage").innerText = ""; // 에러 메시지 초기화
    }

    return true;
}
//아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){

	var userId = $('.id_input').val();			// .id_input에 입력되는 값
	var data = {userId : userId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data
	}); // ajax 종료		

});// function 종료
</script>
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
          <form method="post" action="<c:url value="registDo" /> " onsubmit="return validateForm();">
            <div class="form-row">
              <div class="col-md-4">
                <label for="userId">아이디 <span class="required-star">*</span></label>
              </div>
              
              <div class="col-md">
                <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력해주세요" />
                
              <div id="userIdErrorMessage" style="color: red;"></div>
              </div>
              <span class="id_input_re_1">사용 가능한 아이디 입니다.</span>
              <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
              
            </div>

            <div class="form-row">
              <div class="col-md-4">
                <label for="userPw">비밀번호 <span class="required-star">*</span></label>
              </div>
              <div class="col-md">
                <input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호를 입력해주세요" />
                <div id="userPwErrorMessage" style="color: red;"></div>
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
