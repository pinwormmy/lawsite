<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SC1Hub - ID 찾기</title>
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
