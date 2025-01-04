<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>LawSite - ID 찾기</title>
<%@include file="./include/header.jspf" %>
</head>
<body>
    <div class="section-inner">
        <div class="container">
            <div class="row">
                <%@include file="./include/latestPosts.jspf" %>
                <%@include file="./include/sidebar.jspf" %>
                <div class="col-lg-9">
                   <div class="loginMenu">
                       <div class="findIdMenu">
                           <p>아이디가 생각나지 않는다면 아래 주소로 메일 보내주세요:</p>
                           <a href="mailto:mealchelin@gmail.com">mealchelin@gmail.com</a>
                       </div>
                   </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="./include/footer.jspf" %>
</body>
</html>
