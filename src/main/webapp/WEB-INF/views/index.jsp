<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게임핀 - 게임정보 사이트</title>
<style>

body {
    height: 100%;
}
.boardList {
    border-collapse: collapse;
    overflow: hidden;
    margin: 10px 0 10px 0;
    width: 100%;
}
.boardList th,
.boardList td {
    padding: 5px;
    max-width: 100%;
}
.leftbar-ul li a{
    color : white;
    font-size: 12px;
    font-weight: 500px;
}
.page-navigation {
    text-align: center;
}
.checkbox-list {
    padding: 10px;
}
.checkbox-list label {
    font-weight: 400;
}
.main-banner {
    font-size: 48px;
    margin: 10px;
    text-align: center;
}

</style>
</head>
<body>
<%@include file="./include/header.jspf" %>
    <div class="section-inner">
        <div class="container" style="width: 1600px;">
            <div class="main-banner">
                게임핀
            </div>
                <%@include file="./include/sidebar.jspf" %>
                <div class="col-lg-8">
                    <fieldset>
                        <legend><a href="/openColumn/list">자유게시판</a></legend>
                        <table class="boardList" style="width: 100%;">
                            <c:forEach var="post" items="${opencolumnList}">
                            <tr>
                                <td>
                                <a class="post-title" href="/openColumn/readPost?postNum=${post.postNum}">${post.title}</a>
                                <c:if test="${post.commentCount > 0}">(${post.commentCount})</c:if></td>
                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${post.regDate}"/></td>
                            </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${empty opencolumnList}"><tr><td>현재 등록된 글이 없습니다.</td></tr></c:if>
                    </fieldset>
                    <fieldset>
                        <legend><a href="/video/list">동영상 게시판</a></legend>
                        <table class="boardList" >
                            <c:forEach var="post" items="${videoList}">
                            <tr>
                                <td>
                                <a class="post-title" href="/video/readPost?postNum=${post.postNum}">${post.title}</a>
                                <c:if test="${post.commentCount > 0}">(${post.commentCount})</c:if></td>
                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${post.regDate}"/></td>
                            </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${empty videoList}"><tr><td>현재 등록된 글이 없습니다.</td></tr></c:if>
                    </fieldset>
                </div>
                <div class="col-lg-2">
                    <fieldset>
                        <legend><a href="/library/list">자료실</a></legend>
                        <table class="boardList" style="width: 100%;">
                            <c:forEach var="post" items="${libraryList}">
                            <tr>
                                <td>
                                <a class="post-title" href="/library/readPost?postNum=${post.postNum}">${post.title}</a>
                                <c:if test="${post.commentCount > 0}">( ${post.commentCount} )</c:if>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${empty libraryList}"><tr><td>현재 등록된 글이 없습니다.</td></tr></c:if>
                    </fieldset>
                </div>

        </div>
    </div>
</section>
<%@include file="./include/footer.jspf" %>
</body>
</html>
