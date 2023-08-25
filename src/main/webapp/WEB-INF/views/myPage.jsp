<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게임핀 - 마이 페이지</title>
<style>
body {
    height: 100%;
}
.my-page {
    width: 1600px;
    margin: auto;
}
.btn-turquoise {
    background-color: #40E0D0;
    color: #fff;
    border: none;
    margin: 10px;
}
.btn-turquoise:hover {
    background-color: #3CB7B8;
    color: #fff;
}
.leftbar-ul li a{
    color : white;
    font-size: 12px;
    font-weight: 500px;
}
.page-navigation {
    text-align: center;
}
.checkbox-list {
    padding: 10px;
}
.checkbox-list label {
    font-weight: 400;
}
.main-banner {
    font-size: 48px;
    margin: 10px;
    text-align: center;
}
</style>
</head>
<body>
<%@include file="./include/header.jspf" %>
<div class="section-inner">
    <div class="container">
        <%@include file="./include/sidebar.jspf" %>
        <div class="col-lg-9">
            <div class="media">
                <div class="media-body">
                    <div class="member-info" style="font-size: 20px; line-height: 50px;">
                        <span>ID : ${member.id}</span><br>
                        <span>실명 : ${member.realName}</span><br>
                        <span>별명 : ${member.nickName}</span><br>
                        <span>연락처 : ${member.phone}</span><br>
                        <span>이메일 : ${member.email}</span><br>
                        <hr>
                    </div>
                </div>
            </div>
            <div>
                <button onclick="location.href='/modifyMyInfo'">내 정보 수정</button>
            </div>
            <c:if test="${member.grade == 3}">
                <div>
                    <button onclick="location.href='/adminPage'">관리자 모드</button>
                </div>
            </c:if>
        </div>
    </div>
</div>
<%@include file="./include/footer.jspf" %>
<script>
    function comingSoon() {
        alert("업데이트 예정입니다.");
    }
</script>
</body>
</html>
