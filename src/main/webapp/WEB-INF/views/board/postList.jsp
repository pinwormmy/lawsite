<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>${koreanTitle}</title>
    <link rel="stylesheet" type="text/css" href="/css/postList.css">
    <%@include file="../include/header.jspf" %>
</head>
<body>
    <div class="section-inner">
        <div class="container">
            <%@include file="../include/latestPosts.jspf" %>
            <%@include file="../include/sidebar.jspf" %>
            <div class="col-sm-9">
                <%@include file="../include/postListContent.jspf" %>
            </div>
        </div>
    </div>
    <%@include file="../include/footer.jspf" %>
</body>
</html>
