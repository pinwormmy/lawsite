<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>글쓰기 - 자유게시판</title>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@include file="../include/header.jspf" %>
<div class="section-inner">
    <div class="container">
        <%@include file="../include/sidebar.jspf" %>
        <div class="col-md-9">
            <div class="col-xs-12 mb wow fadeInUp">
                <form action="/freeBoard/submitPost" method="post">
                    <input type="hidden" name="writer" value="${member.id}">
                    제목> <input type="text" name="title" size="60" required>
                    <c:if test="${member.grade == 3}">
                        <span style="vertical-align: middle;">공지></span>
                        <input style="vertical-align: middle;" type="checkbox" name="notice" value="1">
                    </c:if>
                    <br>
                    <textarea name="content" id="content"></textarea><br>
                    <script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
                        CKEDITOR.replace('content', {filebrowserUploadUrl:'/imageUpload'});
                    </script>
                    <button class="pull-left btn btn-theme" accesskey="s">게시하기(S)</button>
                    <button type="button" class="pull-left btn btn-theme" onclick="location.href='/freeBoard/list'" accesskey="c">취소(C)</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jspf" %>

</body>
</html>