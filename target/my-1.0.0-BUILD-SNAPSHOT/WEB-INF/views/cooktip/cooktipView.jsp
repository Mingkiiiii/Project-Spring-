<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 요리팁</title>
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cooktip/cooktip.css">
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

  <div id="wrap">
    <!-- 상단 영역 -->

    <!-- 컨텐츠 중간 영역 -->
    <div id="contents">
      <!-- 컨텐츠 섹션 영역 -->
      <div id="section">
        <section id="my-recipe">
          <div class="section-title">
            <h2>나의 요리팁</h2>
            <p>My Cooktip</p>
          </div>

          <div class="section-list">
            <div class="container">
              <div class="cooktip-write-btn">
                <a href="<c:url value="cooktipWriteView" />">
		   			<button type="button" class="btn btn-primary">작성</button>
		  		</a>
              </div>

              <table class="table table-striped table-hover cooktip-table">
                <colgroup>
                  <col style="width:10%;" />
                  <col style="width:50%;" />
                  <col style="width:20%;" />
                  <col style="width:20%;" />
                </colgroup>

                <thead>
                  <tr>
                    <tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
                  </tr>
                </thead>

                <tbody>
                  <!-- 게시글 출력 -->
					<c:forEach items="${cooktipList }" var="cooktip">
						<tr>
							<td>${cooktip.cooktipNo}</td>
							<td>
							<a href="<c:url value="/cooktipDetailView?cooktipNo=${cooktip.cooktipNo}" />">${cooktip.cooktipTitle}</a>
							</td>
							<td>${cooktip.userName}</td>
							<td>${cooktip.cooktipDate}</td>
						</tr>
					</c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </section>
      </div>
    </div>

    <!-- 하단 영역 -->
  </div>
  <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>

</html>