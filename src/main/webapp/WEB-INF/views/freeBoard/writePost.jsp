<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>글쓰기 - 자유게시판</title>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<style>
body {
    height: 100%;
}
.boardList {
    width: 100%;
    background-color: #fff;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
    border-radius: 5px;
    overflow: hidden;
}
.boardList caption {
    font-size: 20px;
    margin-bottom: 30px;
}
.boardList tr {
    border-bottom: 1px solid #eee;
}
.boardList tr:last-child {
    border: none;
}
.boardList tr:nth-child(odd) {
    background-color: #ddd;
}
.boardList th,
.boardList td {
    padding: 12px;
    text-align: center;
}
.boardList tr th {
    background-color: #CCFF33;
    color: #fff;
}
.boardList tr th:first-child {
    border-radius: 5px 0 0 0;
}
.boardList tr th:last-child {
    border-radius: 0 5px 0 0;
}
.postTitle {
    color: black;
}
.leftbar-ul {
    border-top: solid 1px ivory;
    list-style-type: none;
}
.leftbar-ul li {
    border-bottom: solid 1px ivory;
}
.leftbar-ul li a{
    color : white;
    font-size: 16px;
    font-weight: 500px;
}
.section-wrapper {
    min-height: 850px;
}
.align-middle {
    vertical-align: middle;
}

</style>
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
                    <span class="align-middle"> 공지> </span>
                    <input class="align-middle" type="checkbox" name="notice" value="1"><br>
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