<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>글쓰기 - ${koreanTitle}</title>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@include file="../include/header.jspf" %>
<div class="section-inner">
    <div class="container">
        <%@include file="../include/sidebar.jspf" %>
        <div class="col-sm-9">
            <%@include file="../include/writePostContent.jspf" %>
        </div>
    </div>
</div>
<%@include file="../include/footer.jspf" %>
</body>
</html>