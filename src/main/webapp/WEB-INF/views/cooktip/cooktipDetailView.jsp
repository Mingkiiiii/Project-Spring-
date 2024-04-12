<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/recipe/recipe-view.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment/comment.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/etc/board.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/smarteditor2-2.8.2.3/css/smart_editor2_out.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<div id="wrap">
		<!-- 상단 영역 -->


		<!-- 컨텐츠 중간 영역 -->
		<div id="contents">
			<!-- 컨텐츠 섹션 영역 -->
			<div id="section">
				<div class="section-list">
					<div class="container">
						<div class="recipe-view">
							<div class="recipe-top">
								<h4 class="recipe-name">${cooktip.cooktipTitle}</h4>
								<p class="write-date">${cooktip.cooktipDate }</p>
							</div>
							<div class="recipe-content">
								<div class="recipe-text se2_outputarea">
									${cooktip.cooktipContent }</div>
							</div>
							<div class="board-control-btn">
								<c:if test="${sessionScope.login.userId == cooktip.userId}">
									<form action="<c:url value="/cooktipEditView" />" method="post">
										<input type="hidden" name="cooktipNo"
											value="${cooktip.cooktipNo}">
										<button type="submit" class="modify-btn">수정</button>
									</form>
									<form action="<c:url value="cooktipDel" />" method="post"
										id="delForm">
										<input type="hidden" name="cooktipNo"
											value="${cooktip.cooktipNo}">
										<button type="button" class="remove-btn" onclick="fn_check()">삭제</button>
									</form>

								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 하단 영역 -->
			<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

		</div>
	</div>
	<script>
function fn_check(){
	if(confirm("정말 삭제 하시겠습니까?")){
		document.getElementById("delForm").submit();
	}
}		
</script>
</body>

</html>