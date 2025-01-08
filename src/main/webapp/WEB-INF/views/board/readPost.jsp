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
    <div class="row">
        <div class="col-lg-2 sidebar-full">
                <%@include file="../include/sidebar.jspf" %>
        </div>
        <div class="col-lg-10">
            <%@include file="../include/readPostContent.jspf" %>
        </div>
    </div>
</div>
<script src="/js/readPost.js"></script>
<%@include file="../include/footer.jspf" %>
</body>
</html>
