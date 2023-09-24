<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>글수정 - 초보자마당</title>

<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@include file="../include/header.jspf" %>
<div class="section-inner">
    <div class="container">
        <%@include file="../include/sidebar.jspf" %>
        <div class="col-md-9">
            <div class="col-xs-12 mb wow fadeInUp">
                <form action="/freeBoard/submitModifyPost" method="post">
                    <input type="hidden" name="writer" value="${post.writer}">
                    <input type="hidden" name="postNum" value="${post.postNum}">
                    제목> <input type="text" name="title" size="55" value="${post.title}" required>
                    <c:if test="${member.grade == 3}">
                        <span style="vertical-align: middle;">공지></span>
                        <input type="checkbox" name="notice" id="noticeChecked" value="1" onclick="checkboxForNotice();" style="vertical-align: middle;"
                        <c:if test="${post.notice == 1}">checked</c:if> /><br>
                    </c:if>
                    <input type="hidden" name="notice" id="noticeUnchecked" value="0" />
                    <textarea name="content" id="content">${post.content}</textarea><br>

                    <script type="text/javascript">
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

<script>
let noticeChecked = document.getElementById("noticeChecked");
let noticeUnchecked = document.getElementById("noticeUnchecked");

function checkboxForNotice() {
    if(noticeChecked.checked) { noticeUnchecked.disabled = true; }
    else { noticeUnchecked.disabled = false; }
}
</script>

</body>
</html>