<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>레시피 추천 챗봇</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.12/typed.min.js"></script>
    <jsp:include page="/WEB-INF/inc/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recipe.css">
    <style>
        /* 폼 스타일 */
        #uploadForm {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 10px;
            margin-left: 1200px;
        }
        label {
            margin-bottom: 10px;
            font-weight: bold;
        }
        #img {
            margin-bottom: 10px;
        }
        input[type="file"] {
            margin-bottom: 10px;
        }
        button {
            background-color: #03070f;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        /* 채팅 박스 스타일 */
        #chatbox {
            width: calc(80% - 80px);
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 10px;
            height: 600px;
            overflow-y: auto;
            margin: 0 auto;
            margin-bottom: 20px;
        }
        /* 대화 입력 영역 스타일 */
        #user_input_wrapper {
            width: calc(80% - 80px);
            margin-bottom: 30px;
            margin-top: 10px;
            height: 40px;
            position: relative;
            display: flex;
            margin: 0 auto; /* 가로 중앙 정렬 */
        }

        #user_input {
            width: calc(100% - 100px);
            height: 40px;
            margin-right: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: none;
            margin-bottom: 30px;
            font-size: 16px; /* 글꼴 크기 조정 */
        }

        #sendMessageButton {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            position: absolute;
            right: 0;
            bottom: 0;
        }

        #sendMessageButton:hover {
            background-color: #0056b3;
        }

        /* 사용자 채팅 스타일 */
        .user-chat {
            float: right;
            clear: both; /* float 뒤에 오는 요소에 영향을 주지 않도록 clear 설정 */
            margin-bottom: 10px; /* 채팅 간격 조정 */
            border-radius: 20px;
            background-color: #000000;
            color: white;
            padding: 10px 20px;
            font-size: 18px;
        }

        .user-chat .chat-msg {
            text-align: right;
            color: white;
        }

        /* 챗봇 채팅 스타일 */
        .gpt-chat {
            float: left;
            clear: both; /* float 뒤에 오는 요소에 영향을 주지 않도록 clear 설정 */
            margin-bottom: 10px; /* 채팅 간격 조정 */
            border-radius: 20px;
            background-color: white;
            color: black;
            padding: 10px 20px;
            font-size: 18px;
        }

        .gpt-chat .chat-msgs {
            text-align: left;
            color: black;
        }
        .margin {
            margin-top: 20px;
        }

        .wrap-loading{
        	position: fixed;
        	left: 0;
        	top:0;
        	bottom:0;
        	background: rgba(0,0,0,0.2);
        	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');
        }
        .wrap-loading div {
            position: fixed;
            top: 50%;
            left: 50%;
            margin-left: -21px;
            margin-top: -21px;
        }
        .display-none{
        	display:none;
        }
        #combinedButton {
        font-size: 20px;
    }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
<div id="section">
    <section id="my-recipe">
        <div class="section-title">
            <h2>레시피 추천 챗봇</h2>
            <p>Recipe Recommendation Chatbot</p>
        </div>
    </section>
</div>

<form id="uploadForm" enctype="multipart/form-data">
    <label for="uploadImageButton"></label>
    <br>
    <img id="img" width="200px">
    <br>
    <input type="file" onchange="fn_preview(this)" id="uploadImageButton" name="image" accept="image/*" required>
</form>

<div id="chatbox">
    <!-- 대화 내용이 여기에 동적으로 추가될 것입니다. -->
</div>

<div id="user_input_wrapper">
    <label for="user_input"></label>
    <textarea id="user_input" name="user_input" placeholder="대화를 시작하세요."></textarea>
    <button type="button" id="combinedButton">↑</button>
</div>
<div id="margin"></div>

<!-- Loading spinner -->
<div class="wrap-loading display-none">
    <div><img src="${pageContext.request.contextPath}/resources/assets/img/loading2.gif" /></div>
</div>

<script>
    $(document).ready(function(){
        // Typed.js 인스턴스를 저장할 변수
        var typedInstances = {};

        $("#combinedButton").click(function(){
            sendUserInput();
        });

        $("#user_input").keydown(function(event){
            if(event.keyCode == 13) { // 엔터 키 입력 시
                event.preventDefault(); // 기본 엔터 동작 제거
                sendUserInput();
            }
        });

        function sendUserInput() {
            // 사용자 입력 값 확인
            var userInput = $("#user_input").val();

            // 사용자가 입력한 값이 없는 경우에만 실행
            if (!userInput) {
                // 이미지 정보 가져오기
                var formData = new FormData();
                formData.append("image", $("#uploadImageButton")[0].files[0]);

                // 이미지가 있는지 확인
                if ($("#uploadImageButton")[0].files.length > 0) {
                    // 이미지를 전송하는 Ajax 요청
                    $.ajax({
                        url: "http://192.168.0.34:5000",
                        type: "POST",
                        data: formData,
                        contentType: false,
                        processData: false,
                        beforeSend: function() {
                            // Show loading spinner before sending Ajax request
                            $(".wrap-loading").removeClass('display-none');
                        },
                        success: function(response) {
                            var chatbox = $("#chatbox");
                            var imageUrl = $("#img").attr("src");
                            chatbox.append("<div class='user-chat'><span class='chat-msg'>사용자: <br><img src='" + imageUrl + "' style='max-width: 200px; max-height: 200px;' /></span></div>");
                            chatbox.append("<div class='gpt-chat'><span class='chat-msgs'>레시피봇: <br><span class='typed-message'></span></span></div>");
                            $("#img").hide(); // 이미지 숨기기

                            // Typed.js를 사용하여 GPT가 보낸 메시지에 타이핑 효과 적용
                            typedInstances[chatbox.children().length - 1] = new Typed(chatbox.children().last().find('.typed-message').get(0), {
                                strings: [response.response],
                                typeSpeed: 10,
                                showCursor: false,
                                onComplete: function(self) {
                                    // 타이핑 완료 후 스크롤을 아래로 이동하여 새로운 채팅이 보이도록 함
                                    chatbox.scrollTop(chatbox.prop("scrollHeight"));
                                }
                            });
                        },
                        error: function(xhr, status, error) {
                            console.error("Error:", error);
                        },
                        complete: function() {
                            // Hide loading spinner after Ajax request is completed
                            $(".wrap-loading").addClass('display-none');
                        }
                    });
                }
            } else {
                var chatbox = $("#chatbox");
                // 사용자의 채팅에 .user-chat 클래스 추가
                chatbox.append("<div class='user-chat'><span class='chat-msg'>사용자:<br> <span class='typed-message'></span></span></div>");

                // Typed.js를 사용하여 사용자가 입력한 메시지에 타이핑 효과 적용
                typedInstances[chatbox.children().length - 1] = new Typed(chatbox.children().last().find('.typed-message').get(0), {
                    strings: [userInput],
                    typeSpeed: 20,
                    showCursor: false,
                    onComplete: function(self) {
                        // 타이핑 완료 후 스크롤을 아래로 이동하여 새로운 채팅이 보이도록 함
                        chatbox.scrollTop(chatbox.prop("scrollHeight"));
                        // 사용자 입력 메시지 전송
                        sendUserInputAjax(userInput);

                    },onStringTyped: function(index, self) {
                        // 타이핑이 진행되는 동안에도 텍스트의 색상을 흰색으로 유지
                        self.el.style.color = "white";
                    }
                });
            }
        }

        function sendUserInputAjax(userInput) {
            // 사용자 입력 처리
            var child = document.getElementById("chatbox").lastChild.textContent;
            if(child.length > 1){
                child = child.split(":")[1].trim()
            }

            // 대화 메시지를 전송하는 Ajax 요청
            $.ajax({
                url: "http://192.168.0.34:5000",
                type: "POST",
                data: JSON.stringify({ user_input: userInput,
                    previous_content:child}),
                contentType: "application/json",
                beforeSend: function() {
                    // Show loading spinner before sending Ajax request
                    $(".wrap-loading").removeClass('display-none');
                },
                success: function(response) {
                    var chatbox = $("#chatbox");
                    chatbox.append("<div class='gpt-chat'><span class='chat-msgs'>레시피봇: <br><span class='typed-message'></span></span></div>");

                    // Typed.js를 사용하여 GPT가 보낸 메시지에 타이핑 효과 적용
                    typedInstances[chatbox.children().length - 1] = new Typed(chatbox.children().last().find('.typed-message').get(0), {
                        strings: [response.response],
                        typeSpeed: 20,
                        showCursor: false,
                        onComplete: function(self) {
                            // 타이핑 완료 후 스크롤을 아래로 이동하여 새로운 채팅이 보이도록 함
                            chatbox.scrollTop(chatbox.prop("scrollHeight"));
                        }
                    });

                    document.getElementById("user_input").value = '';
                },
                error: function(xhr, status, error) {
                    console.error("Error:", error);
                },complete: function() {
                    // Hide loading spinner after Ajax request is completed
                    $(".wrap-loading").addClass('display-none');
                }
            });
        }


    });
    function fn_preview(input){
        let file = input.files[0];
        let reader = new FileReader();
        reader.onload = function(e){
            $("#img").attr('src',e.target.result);
        };
        reader.readAsDataURL(file);
        $("#img").show(); // 이미지 보이기
    }

</script>

</body>
</html>
