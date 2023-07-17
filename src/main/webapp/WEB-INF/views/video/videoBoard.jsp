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
                        <h3>동영상 게시판</h3>
                    </div>
                    <div class="row">
                        <div id="comments" class="col-xs-12">
                            <div id="comments-list" class="gap">
                                <div class="media">
                                     <table class="boardList">
                                            <tr>
                                                <th width="70%">제목</th>
                                                <th>작성자</th>
                                                <th>작성일자</th>
                                                <th>조회수</th>
                                            </tr>
                                            <c:forEach var="notice" items="${fullNoticeList}">
                                            <tr class="notice-tr">
                                                <td><h4><span>[전체공지]</span>
                                                <a class="noticeTitle" href="/fullNotice/readPost?postNum=${notice.postNum}">
                                                 ${notice.title}</a>
                                                <c:if test="${notice.commentCount > 0}">( ${notice.commentCount} )</c:if></h4></td>
                                                <td>${notice.writer}</td>
                                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${notice.regDate}"/></td>
                                                <td>${notice.views}</td>
                                            </tr>
                                            </c:forEach>
                                            <c:forEach var="notice" items="${selfNoticeList}">
                                            <tr class="notice-tr">
                                                <td><h4><span>[공지사항]</span>
                                                <a class="noticeTitle" href="javascript:checkMemberLevelBeforeRead(${notice.postNum});">
                                                 ${notice.title}</a>
                                                <c:if test="${notice.commentCount > 0}">( ${notice.commentCount} )</c:if></h4></td>
                                                <td>${notice.writer}</td>
                                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${notice.regDate}"/></td>
                                                <td>${notice.views}</td>
                                            </tr>
                                            </c:forEach>
                                            <c:forEach var="post" items="${postList}">
                                            <tr>
                                                <td><h4><a class="postTitle" href="javascript:checkMemberLevelBeforeRead(${post.postNum});">${post.title}</a>
                                                <c:if test="${post.commentCount > 0}">( ${post.commentCount} )</c:if></h4></td>
                                                <td>${post.writer}</td>
                                                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${post.regDate}"/></td>
                                                <td>${post.views}</td>
                                            </tr>
                                            </c:forEach>
                                     </table>
                                     <c:if test="${empty postList}"><tr><td>관련 글이 없습니다...</td></tr></c:if>
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
                                        <select name="searchType">
                                            <option value="titleAndContent" <c:if test="${page.searchType == 'titleAndContent'}">selected</c:if> >제목+내용</option>
                                            <option value="title" <c:if test="${page.searchType == 'title'}">selected</c:if> >제목</option>
                                            <option value="content" <c:if test="${page.searchType == 'content'}">selected</c:if> >내용</option>
                                        </select>
                                        <input name="keyword" value=${page.keyword}>
                                        <button class="pull btn btn-theme">검색</button>
                                        <c:if test="${page.keyword != ''}">
                                            <button type="button" class="pull btn btn-theme" onclick="location.href='video/list'">취소</button>
                                        </c:if>
                                    </form>
                                </div>
                                <c:if test="${member.grade == 3}">
                                    <a href="/video/writePost" class="pull-right btn btn-theme">글쓰기</a>
                                </c:if>
                            </div><!--/#comments-list-->
                        </div><!--/#comments-->
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="side-banner">
                        <img src="/img/right_banner_ex1.jpg" width="100%">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="../include/footer.jspf" %>

<script>
    function checkMemberLevelBeforeRead(postNum) {
        if(${member == null || member.grade < 2}) {
            alert("해당 글 열람은 관리자 승인이 필요합니다.");
            return false;
        }
        location.href = "/video/readPost?postNum=" + postNum;
    }
</script>

</body>
</html>