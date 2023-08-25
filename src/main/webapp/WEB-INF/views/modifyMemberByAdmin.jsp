<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원 정보 수정</title>
<style>
body {
    height: 100%;
    margin: 0;
    padding: 0;
}
.container {
    width: 33%;
    margin: auto;
    padding: 20px;
}
.my-page {
    width: 1600px;
    margin: auto;
}
label, input {
    margin-bottom: 10px;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jspf" %>
<div class="container">
    <%@include file="./include/sidebar.jspf" %>
    <form action="/submitModifyMemberByAdmin" method="post">
        ID> <input type="text" id="id" name="id" value="${member.id}" readonly title="해당 항목은 수정할 수 없습니다"><br>
        닉네임> <input type="text" id="nickName" name="nickName" value="${member.nickName}"><br>
        실명> <input type="text" id="realName" name="realName" value="${member.realName}"><br>
        이메일> <input type="text" id="email" name="email" value="${member.email}" readonly title="해당 항목은 수정할 수 없습니다"><br>
        연락처> <input type="text" id="phone" name="phone" value="${member.phone}"><br>
        회원 등급> <input type="text" id="grade" name="grade" value="${member.grade}"><br>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='/adminPage'">취소</button>
    </form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>

</body>
</html>
