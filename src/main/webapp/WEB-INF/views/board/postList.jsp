<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>${koreanTitle}</title>
<link rel="stylesheet" type="text/css" href="/css/postList.css">
</head>
<body>
<%@include file="../include/header.jspf" %>
    <div class="section-inner">
        <div class="container">
            <%@include file="../include/sidebar.jspf" %>
            <div class="col-sm-9">
                <%@include file="../include/postListContent.jspf" %>
            </div>
            <%@include file="../include/coupangAd.jspf" %>
        </div>
    </div>
<%@include file="../include/footer.jspf" %>
</body>
</html>