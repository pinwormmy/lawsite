<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>LawSite - 로그인</title>
<%@include file="./include/header.jspf" %>
</head>
<body>
<div class="section-inner">
    <div class="row">
        <div class="col-lg-2">
            <%@include file="./include/sidebar.jspf" %>
        </div>
        <div class="col-lg-10">
            <div class="loginMenu">
                <div class="signUpMenu">
                    <div class="loginTitle">
                    </div>
                    <form action="/submitLogin" method="post">
                        <div class="inputId">
                            <input type="text" name="id" id="id" placeholder="관리자ID입력">
                        </div>
                        <div>
                            <input type="password" name="pw" id="pw" placeholder="비밀번호 입력">
                        </div>
                        <button id="loginButton" class="btn btn-light">로그인</button><br>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="./include/footer.jspf" %>

<script>
    <c:if test="${not empty message}">
        alert("${message}");
        history.back();
    </c:if>
</script>
</body>
</html>
