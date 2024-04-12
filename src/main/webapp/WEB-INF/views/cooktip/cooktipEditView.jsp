<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/recipe/recipe-write.css">
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
<script src="<c:url value="/resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" />" ></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<div id="contents">
		<!-- 컨텐츠 섹션 영역 -->
		<div id="section">
			<section id="my-recipe">
				<div class="section-title">
					<h2>레시피 추천</h2>
					<p></p>
				</div>

				<div class="recipe-write-form">
					<div class="container">
						<form action="<c:url value='/cooktipEditDo' />" method="post" enctype="multipart/form-data"
							onSubmit="return fn_check()">
							<div class="form-group">
								<label for="title">제목</label> <input type="text" name="cooktipTitle"
									id="cooktipTitle" class="form-control" placeholder="제목을 입력해주세요."
									required>
							</div>

							<div class="form-group">
								<label for="content">레시피 내용</label>
								<textarea type="text" name="cooktipContent" id="content"
									class="form-control" style="height: 500px; width: 100%;"
									placeholder=''></textarea>
							</div>
							<input type="hidden" name="cooktipNo" value="${cooktip.cooktipNo}"/>

							<div class="form-btn">
								<button type="submit">수정</button>
							</div>
						</form>
					</div>
				</div>
			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
<script type="text/javascript">
	var oEditors = [];
	$(document).ready(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef :oEditors
			,elPlaceHolder: "content"
			,sSkinURI : "<c:url value='/resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html' />"
			,htParams: {
				bUseToolbar : true // 툴바 사용여부
				,bUseVerticalResier : true // 입력창 크기 조절바 사용여부
				,bUseModeChanger : true //모드탭(html, text, editor)
				,bSkipXssFilter : true // xss공격 무시여부
				,fOnBeforeUnload : function(){
					alert("전송!");
				}
			},
			fCreator : 'createSEditor2'
		});
	});
	
	
	function fn_check(){
		oEditors.getById['content'].exec("UPDATE_CONTENTS_FIELD", []);
		let contents = document.getElementById('content').value;
		if(contents == '' || contents == null || contents == '&nbsp;'
			|| content == '<p>&nbsp;</p>'){
			alert("내용을 입력하세요!!");
			return false;
		}else{
			if(confirm("전송할까요?")){
				alert("전송하였습니다.");
			}else{
				return false;
			}
		}
	}
</script>
</html>
