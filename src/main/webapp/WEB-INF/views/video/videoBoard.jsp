<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>동영상 게시판</title>
<style>
body {
    height: 100%;
}
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
.section-wrapper {
    min-height: 850px;
}

.side-banner {
    margin-top: 15px;
}
.post-heading {
    border-bottom: 2px solid white;
}
.writer, .date {
    text-align: center;
}
.views, .post-num {
    text-align: right;
}

</style>

</head>
<body>
<%@include file="../include/header.jspf" %>
<section class="white section-wrapper">
    <div class="section-inner">
        <div class="container" style="width: 1600px;">
            <div class="row">
                <%@include file="../include/sidebar.jspf" %>
                <div class="col-lg-7">
                    <div class="post-heading mb">
                        동영상 게시판
                    </div>
                    <div class="row">
                        <div id="comments" class="col-xs-12">
                            <div id="comments-list" class="gap">
                                <div class="media">
                                     <table class="boardList">
                                            <tr>
                                                <th style="width: 10%;">번 호</th>
                                                <th style="width: 50%;">제 &nbsp 목</th>
                                                <th style="width: 15%;">작성자</th>
                                                <th style="width: 10%;">날 짜</th>
                                                <th style="width: 10%;">조 회</th>
                                            </tr>

                                            <c:forEach var="notice" items="${fullNoticeList}">
                                                <tr class="notice-tr">
                                                    <td class="post-num">${notice.postNum} &nbsp</td>
                                                    <td><span>[전체공지]</span>
                                                    <a class="noticeTitle" href="/fullNotice/readPost?postNum=${notice.postNum}">
                                                     ${notice.title}</a>
                                                    <c:if test="${notice.commentCount > 0}">( ${notice.commentCount} )</c:if></td>
                                                    <td class="writer">${notice.writer}</td>
                                                    <td class="date"><fmt:formatDate pattern="yyyy.MM.dd" value="${notice.regDate}"/></td>
                                                    <td class="views">${notice.views}</td>
                                                </tr>
                                            </c:forEach>
                                            <c:forEach var="notice" items="${selfNoticeList}">
                                                <tr class="notice-tr">
                                                    <td class="post-num">${notice.postNum} &nbsp</td>
                                                    <td><span>[공지사항]</span>
                                                    <a class="noticeTitle" href="/video/readPost?postNum=${notice.postNum}">
                                                     ${notice.title}</a>
                                                    <c:if test="${notice.commentCount > 0}">( ${notice.commentCount} )</c:if></td>
                                                    <td class="writer">${notice.writer}</td>
                                                    <td class="date"><fmt:formatDate pattern="yyyy.MM.dd" value="${notice.regDate}"/></td>
                                                    <td class="views">${notice.views}</td>
                                                </tr>
                                            </c:forEach>
                                            <c:forEach var="post" items="${postList}">
                                                <tr>
                                                    <td class="post-num">${post.postNum} &nbsp</td>
                                                    <td><a class="postTitle" href="/video/readPost?postNum=${post.postNum}">${post.title}</a>
                                                    <c:if test="${post.commentCount > 0}">( ${post.commentCount} )</c:if></td>
                                                    <td class="writer">${post.writer}</td>
                                                    <td class="date"><fmt:formatDate pattern="yyyy.MM.dd" value="${post.regDate}"/></td>
                                                    <td class="views">${post.views}</td>
                                                </tr>
                                            </c:forEach>
                                     </table>
                                     <c:if test="${empty postList}">
                                         <h3>검색 결과가 없습니다</h3>
                                     </c:if>
                                </div>
                                <div class="post-navigation">
                                    <c:if test="${page.prevPageSetPoint >= 1}">
                                        <a class="pull-left btn btn-theme"
                                        href="/video/list?recentPage=${page.prevPageSetPoint}&searchType=${page.searchType}&keyword=${page.keyword}">
                                        이전</a>
                                    </c:if>
                                    <c:forEach var="countPage" begin="${page.pageBeginPoint}" end="${page.pageEndPoint}">
                                        <a class="pull-center btn btn-theme"
                                        href="/video/list?recentPage=${countPage}&searchType=${page.searchType}&keyword=${page.keyword}">
                                        ${countPage}</a>
                                    </c:forEach>
                                    <c:if test="${page.nextPageSetPoint <= page.totalPage}">
                                        <a class="pull-right btn btn-theme"
                                        href="/video/list?recentPage=${page.nextPageSetPoint}&searchType=${page.searchType}&keyword=${page.keyword}">
                                        다음</a>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <form action="/video/list">
                                        검색 >>
                                        <input type="hidden" name="searchType" value="titleAndContent">
                                        <input name="keyword" value=${page.keyword}>
                                        <button type="submit" style="visibility:hidden">검색</button>
                                        <c:if test="${page.keyword != ''}">
                                        <button type="button" class="pull btn btn-theme cancel-btn" onclick="location.href='/video/list'" accesskey="c">검색취소(C)</button>
                                        </c:if>
                                    </form>
                                </div>
                                <c:if test="${member.grade == 3}">
                                    <a href="/video/writePost" class="pull-right btn btn-theme" accesskey="i">글쓰기(I)</a>
                                </c:if>
                            </div><!--/#comments-list-->
                        </div><!--/#comments-->
                    </div>
                </div>
                <div class="col-lg-3">
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
    </div>
</section>
<%@include file="../include/footer.jspf" %>

</body>
</html>
