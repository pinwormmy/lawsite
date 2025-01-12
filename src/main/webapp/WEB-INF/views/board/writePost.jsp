<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>글쓰기 - ${koreanTitle}</title>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<%@include file="../include/header.jspf" %>
</head>
<body>
    <div class="section-inner">
        <div class="row">
            <div class="col-lg-2">
                    <%@include file="../include/sidebar.jspf" %>
            </div>
            <div class="col-lg-10">
                <%@include file="../include/writePostContent.jspf" %>
            </div>
        </div>
    </div>
<%@include file="../include/footer.jspf" %>
</body>
</html>