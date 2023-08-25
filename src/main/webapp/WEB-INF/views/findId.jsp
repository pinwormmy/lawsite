<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원ID 찾기</title>
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
    <div class="section-inner">
        <div class="container">
            <div class="row">
                <%@include file="./include/sidebar.jspf" %>
                <div class="col-lg-9">
                   <div class="loginMenu">
                       <div class="findIdMenu">
                           <form action="/findId" method="post">
                               <div class="inputUserName">
                                   회원명> <input type="text" name="userName" id="userName">
                               </div>
                               <div class="inputIdEmail">
                                   이메일> <input type="text" name="email" id="idEmail">
                               </div>
                               <button id="findIdButton">아이디 찾기</button><br>
                           </form>
                       </div>
                   </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="./include/footer.jspf" %>

<script>
    <c:if test="${not empty message}">
        alert("${message}");
    </c:if>
</script>
</body>
</html>
