<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>${post.title} - ${koreanTitle}</title>
<link rel="stylesheet" type="text/css" href="/css/readPost.css">
<%@include file="../include/header.jspf" %>
</head>
<body>
<div class="section-inner">
    <div class="container">
        <%@include file="../include/latestPosts.jspf" %>
        <%@include file="../include/sidebar.jspf" %>
        <div class="col-sm-9">
            <%@include file="../include/readPostContent.jspf" %>
        </div>
    </div>
</div>
<%@include file="../include/readPostScript.jspf" %>
<script src="/js/readPost.js"></script>
<%@include file="../include/footer.jspf" %>
</body>
</html>
