<%@ page import="com.jjang051.jsp03.util.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-09
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

//    String cookieValue = "on";
//    Cookie cookies[] = request.getCookies();
//    for(int i=0;i< cookies.length;i++){
//        Cookie cookie = cookies[i];
//        if(cookie.getName().equals("oneDayCookie")) {
//            cookieValue= cookie.getValue();
//        }
//    }
    String cookieValue = CookieManager.readCookie(request, "oneDayCookie");
    //쿠키값이 설정되면 off
    System.out.println(cookieValue);
%>
<html>
<head>
    <title>Title</title>
    <style>
        #popup {
            padding:10px; background-color: #fff; border: 1px solid #ccc;
            box-shadow: 5px 5px 10px rgba(0,0,0,0.1);
            width:300px;
            position:fixed;
            left:100px;
            top:100px;
        }
        #popup h2 {
            font-size: 18px;
            margin: 0 0 10px 0;
        }
        #popup .content {
            min-height: 150px;
            background-color: #ccc;
            margin-bottom: 10px;
        }
    </style>
    <script src="js/jquery-3.7.1.min.js"></script>
</head>
<body>
    <h1>오늘 하루 이창을 열지 않기</h1>
    <button class="btn-live">팝업살리기</button>
    <% if(!cookieValue.equals("off")) { %>
        <aside id="popup">
            <h2>POPUP</h2>
            <div class="content">
                여기에 내용이 들어갑니다. <br>
            </div>
            <div class="btn-box">
                <label>
                    <input type="checkbox" id="today-check" value="one">
                    <span>오늘 하루 이 창을 열지 않기</span>
                </label>
                <button class="btn-close">닫기</button>
            </div>
        </aside>
    <% } %>
    <script>
        //아이디 저장하기...
        $(".btn-live").on("click",function(){
            /*$.ajax({
                url: "popup-live.jsp",
                method: "GET",
                data: {
                    popupLive: "on"
                }
            })*/
            location.href="popup-live.jsp";
        })
        $("#popup .btn-close").on("click",function(){
            //$("#popup").hide();
            const isChecked = $("#today-check").is(":checked");
            console.log(isChecked);
            //console.log($("#today-check").val());
            //location.href="popup-make.jsp?today=one";
            $("#popup").fadeOut();
            if(isChecked) {
                $.ajax({
                    url: "popup-make.jsp",
                    method: "GET",
                    data: {
                        today: "one"
                    }
                })
            }
            //location.href="cookie-read.jsp?aaa=10";
        })
    </script>
</body>
</html>
