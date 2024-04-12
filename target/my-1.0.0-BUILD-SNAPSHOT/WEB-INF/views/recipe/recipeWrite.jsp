<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/recipe/recipe-write.css">

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
            <h2>레시피 작성</h2>
            <p>Recipe Write</p>
          </div>

          <div class="recipe-write-form">
            <div class="container">
              <form action="<c:url value='/recipeWriteDo' />" method="post" enctype="multipart/form-data" onsubmit="return fn_check()">
                <div class="form-group">
                  <label for="recipeName">레시피 이름</label>
                  <input type="text" name="recipeName" id="recipeName" class="form-control" placeholder="레시피 이름을 입력해주세요." required>
                </div>

                <div class="form-group">
                  <label for="recipeYoutube">유튜브 영상</label>
                  <textarea name="recipeYoutube" id="recipeYoutube" class="form-control" placeholder='YOUTUBE 동영상 ID(ex: lKyOIDYn5Xo)'></textarea>
                </div>

                <div class="form-group">
                  <label for="recipeImage">레시피 썸네일</label>
                  <div class="recipeImage" style="display:none;">
                    <img src="<c:url value="${sessionScope.recipe.recipeImage}" />" alt="" id="recipeImage" style="width:200px;">
                  </div>

                  <div class="thumbnail-file">
                    <button type="button" class="thumbnail-btn" onClick="">파일 선택</button>
                    <input type="file" name="recipeImage" id="recipeImage" class="form-control" style="display:none;" onChange="" required>
                    <input type="hidden" name="recipeImage" id="recipeImage" value="" />
                  </div>
                </div>

                <div class="form-group">
                  <label for="recipeText">레시피 내용</label>
                  <textarea name="recipeText" id="recipeText" class="form-control" style="height:500px; width:100%;" placeholder=''></textarea>
                </div>

                <div class="form-btn">
                  <button type="submit" class="btn btn-primary">작성</button>
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
			,elPlaceHolder: "recipeText"
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
		oEditors.getById['recipeText'].exec("UPDATE_CONTENTS_FIELD", []);
		let content = document.getElementById('recipeText').value;
		if(content == '' || content == null || content == '&nbsp;'
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