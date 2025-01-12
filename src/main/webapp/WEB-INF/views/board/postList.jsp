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
        <div class="row">
            <div class="col-lg-2">
                    <%@include file="../include/sidebar.jspf" %>
            </div>
            <div class="col-lg-10">
                <%@include file="../include/postListContent.jspf" %>
            </div>
        </div>
    </div>
    <%@include file="../include/footer.jspf" %>
</body>
</html>
