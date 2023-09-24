<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>초보자마당</title>
<style>

.boardList {
    width: 100%;
    border-collapse: collapse;
    overflow: hidden;
}

.boardList th {
    text-align: center;
    border-bottom: 1px solid white;
}
.boardList tr:last-child {
    border: none;
}
.boardList th,
.boardList td {
    padding: 2px;
}
.boardList tr th {
    padding: 5px;
}
.post-heading {
    border-bottom: 2px solid white;
}
.writer, .date {
    text-align: center;
}
.views, .post-num, .recommend {
    text-align: right;
}

</style>

</head>
<body>
<%@include file="../include/header.jspf" %>
    <div class="section-inner">
        <div class="container">
            <%@include file="../include/sidebar.jspf" %>
            <div class="col-lg-9">
                <div class="post-heading mb">
                    초보자마당
                </div>
                <div class="row">
                    <div id="comments" class="col-xs-12">
                        <div id="comments-list" class="gap">
                            <div class="media">
                                 <table class="boardList">
                                        <tr>
                                            <th style="width: 10%;">번 호</th>
                                            <th style="width: 50%;">제 &nbsp 목</th>
                                            <th style="width: 10%;">작성자</th>
                                            <th style="width: 10%;">날 짜</th>
                                            <th style="width: 10%;">조 회</th>
                                            <th style="width: 10%;">추 천</th>
                                        </tr>
                                        <c:forEach var="notice" items="${selfNoticeList}">
                                            <tr class="notice-tr">
                                                <td class="post-num">${notice.postNum} &nbsp</td>
                                                <td><span>[공지]</span>
                                                <a class="noticeTitle" href="/freeBoard/readPost?postNum=${notice.postNum}">
                                                 ${notice.title}</a>
                                                <c:if test="${notice.commentCount > 0}">( ${notice.commentCount} )</c:if></td>
                                                <td class="writer">${notice.writer}</td>
                                                <td class="date"><fmt:formatDate pattern="yyyy.MM.dd" value="${notice.regDate}"/></td>
                                                <td class="views">${notice.views}</td>
                                                <td class="recommend">${notice.recommendCount}</td>
                                            </tr>
                                        </c:forEach>
                                        <c:forEach var="post" items="${postList}">
                                            <tr>
                                                <td class="post-num">${post.postNum} &nbsp</td>
                                                <td><a class="postTitle" href="/freeBoard/readPost?postNum=${post.postNum}">${post.title}</a>
                                                <c:if test="${post.commentCount > 0}">( ${post.commentCount} )</c:if></td>
                                                <td class="writer">${post.writer}</td>
                                                <td class="date"><fmt:formatDate pattern="yyyy.MM.dd" value="${post.regDate}"/></td>
                                                <td class="views">${post.views}</td>
                                                <td class="recommend">${post.recommendCount}</td>
                                            </tr>
                                        </c:forEach>
                                 </table>
                                 <c:if test="${empty postList}"><tr><td>관련 글이 없습니다...</td></tr></c:if>
                            </div>
                            <div class="post-navigation">
                                <%@include file="../include/paging.jspf" %>
                            </div>
                            <div class="form-group">
                                <%@include file="../include/searchForm.jspf" %>
                            </div>
                            <c:if test="${member.grade >= 1}">
                                <a href="/freeBoard/writePost" class="pull-right btn btn-theme" accesskey="i">글쓰기(I)</a>
                            </c:if>
                        </div><!--/#comments-list-->
                    </div><!--/#comments-->
                </div>
            </div>
        </div>
    </div>
<%@include file="../include/footer.jspf" %>

</body>
</html>