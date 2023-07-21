<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>로그인</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- 공지사항 페이지의 스타일을 참고하여 추가/수정합니다. -->
    <style>
    body {
        height: 100%;
        font-family: 'Noto Sans KR', sans-serif;
        font-size: 16px;
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
    /* 이하 로그인 페이지의 기존 스타일입니다. */
    html {
        height: 100%;
    }
    /* ... (로그인 페이지의 기존 스타일 유지) ... */
    </style>
</head>
<body>

<%@include file="./include/header.jspf" %>

<section class="white section-wrapper">
    <div class="section-inner">
        <div class="container" style="width: 1600px;">
            <div class="row">
                <%@include file="./include/sidebar.jspf" %>

                <!-- 로그인 폼 시작 -->
                <div class="col-lg-7">
                    <div class="post-heading mb">
                        <h3>로그인</h3>
                    </div>
                    <div class="loginMenu">
                        <div class="signUpMenu">
                            <div class="loginTitle">
                            </div>
                            <form action="/submitLogin" method="post">
                                <div class="inputId">
                                    <input type="text" name="id" id="id" placeholder="아이디">
                                </div>
                                <div>
                                    <input type="password" name="pw" id="pw" placeholder="4~16 자리 영문+숫자 조합">
                                </div>
                                <button id="loginButton">로그인하기</button><br>
                                <button type="button" class="homeButton" onclick="location.href='/'">처음으로</button>
                            </form>
                            <div class="subMenu">
                                <div id="right-menu">
                                    <a href="/findCredentials">ID/PW 찾기</a> | <a id="signUp" href="/signUp">회원가입</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 로그인 폼 끝 -->

                <!-- 오른쪽 배너 시작 -->
                <div class="col-lg-3">
                    <div class="side-banner">
                        추가 기능 구현필요
                    </div>
                </div>
                <!-- 오른쪽 배너 끝 -->
            </div>
        </div>
    </div>
</section>

<%@include file="./include/footer.jspf" %>

<script>
    <c:if test="${not empty message}">
        alert("${message}");
        history.back();
    </c:if>
</script>
</body>
</html>
