<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>패스워드 찾기</title>
<style>
    body {
        height: 100%;
    }
    .boardList {
        width: 100%;
        border-collapse: collapse;
        overflow: hidden;
    }
    .boardList th {
        text-align: center;
        border-bottom: 1px solid white;
    }
    .boardList tr:last-child {
        border: none;
    }
    .boardList th,
    .boardList td {
        padding: 2px;
    }
    .boardList tr th {
        padding: 5px;
    }
    .section-wrapper {
        min-height: 850px;
    }
    .side-banner {
        margin-top: 15px;
    }
    .post-heading {
        border-bottom: 2px solid white;
    }
    .writer, .date {
        text-align: center;
    }
    .views, .post-num {
        text-align: right;
    }
    html {
        height: 100%;
    }
    #id, #pw {
        height: 50px;
        border: none;
        margin: 2px;
        outline: none;
        padding-left: 10px;
        background-color: transparent;
    }
    #loginButton {
        height: 50px;
        border: 2px solid #ffffff;
        margin: 2px;
        color: white;
        background-color: transparent;
        cursor: pointer;
    }

</style>
</head>
<body>

<%@include file="./include/header.jspf" %>

<section class="white section-wrapper">
    <div class="section-inner">
        <div class="container" style="width: 1600px;">
            <div class="row">
                <%@include file="./include/sidebar.jspf" %>
                <div class="col-lg-7">
                   <div class="post-heading mb">
                       <h3>패스워드 찾기</h3>
                   </div>
                   <div class="loginMenu">
                       <div class="findPwMenu">
                           <form action="/findPassword" method="post">
                               <div class="inputUserName">
                                   회원ID >> <input type="text" name="userId" id="userId">
                               </div>
                               <div class="inputIdEmail">
                                   이메일 >> <input type="text" name="email" id="pwEmail">
                               </div>
                               <button id="findPwButton">패스워드 찾기</button><br>
                           </form>
                       </div>
                   </div>
                </div>
                <div class="col-lg-3">
                    <div class="side-banner">
                        추가 기능 구현필요
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<%@include file="./include/footer.jspf" %>

<script>
    <c:if test="${not empty message}">
        alert("${message}");
    </c:if>
</script>
</body>
</html>
