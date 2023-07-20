<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지사항</title>
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
    <div class="section-inner">
        <div class="container" style="width: 1600px;">
            <div class="row">
                <%@include file="../include/sidebar.jspf" %>
                <div class="col-lg-7">
                    <div class="row">
                        <div id="comments" class="col-xs-12">
                            <div class="post-heading mb">
                                <h3>공지사항</h3>
                            </div>
                            <div id="comments-list" class="gap">
                                <div class="media">
                                    전체 공지사항
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
                                     </table>
                                     <c:if test="${empty fullNoticeList}"><tr><td>현재 등록된 공지사항이 없습니다.</td></tr></c:if>
                                       <c:if test="${member.grade == 3}">
                                           <a href="/fullNotice/writePost" class="pull-right btn btn-theme">글쓰기</a>
                                       </c:if>
                                </div>
                                <div class="post-navigation">
                                    <c:if test="${page.prevPageSetPoint >= 1}">
                                        <a class="pull-left btn btn-theme"
                                        href="/fullNotice/list?recentPage=${page.prevPageSetPoint}&searchType=${page.searchType}&keyword=${page.keyword}">
                                        이전</a>
                                    </c:if>
                                    <c:forEach var="countPage" begin="${page.pageBeginPoint}" end="${page.pageEndPoint}">
                                        <a class="pull-center btn btn-theme"
                                        href="/fullNotice/list?recentPage=${countPage}&searchType=${page.searchType}&keyword=${page.keyword}">
                                        ${countPage}</a>
                                    </c:forEach>
                                    <c:if test="${page.nextPageSetPoint <= page.totalPage}">
                                        <a class="pull-right btn btn-theme"
                                        href="/fullNotice/list?recentPage=${page.nextPageSetPoint}&searchType=${page.searchType}&keyword=${page.keyword}">
                                        다음</a>
                                    </c:if>
                                </div>
                                <div class="media">
                                    회원게시판
                                     <table class="boardList">
                                            <tr>
                                                <th style="width: 10%;">번 호</th>
                                                <th style="width: 50%;">제 &nbsp 목</th>
                                                <th style="width: 15%;">작성자</th>
                                                <th style="width: 10%;">날 짜</th>
                                                <th style="width: 10%;">조 회</th>
                                            </tr>
                                            <c:forEach var="post" items="${boardList}">
                                            <tr>
                                                <td class="post-num">${post.postNum} &nbsp</td>
                                                <td><span>[공지]</span>
                                                <a class="postTitle" href="/board/readPost?postNum=${post.postNum}">
                                                 ${post.title}</a>
                                                <c:if test="${post.commentCount > 0}">( ${post.commentCount} )</c:if></td>
                                                <td class="writer">${post.writer}</td>
                                                <td class="date"><fmt:formatDate pattern="yyyy.MM.dd" value="${post.regDate}"/></td>
                                                <td class="views">${post.views}</td>
                                            </tr>
                                            </c:forEach>
                                     </table>
                                     <c:if test="${empty boardList}"><tr><td>현재 등록된 공지사항이 없습니다.</td></tr></c:if>
                                </div>
                                <div class="media">
                                    자유게시판
                                     <table class="boardList">
                                           <tr>
                                               <th style="width: 10%;">번 호</th>
                                               <th style="width: 50%;">제 &nbsp 목</th>
                                               <th style="width: 15%;">작성자</th>
                                               <th style="width: 10%;">날 짜</th>
                                               <th style="width: 10%;">조 회</th>
                                           </tr>
                                            <c:forEach var="post" items="${opencolumnList}">
                                            <tr>
                                                <td class="post-num">${post.postNum} &nbsp</td>
                                                <td><span>[공지]</span>
                                                <a class="postTitle" href="/openColumn/readPost?postNum=${post.postNum}">
                                                 ${post.title}</a>
                                                <c:if test="${post.commentCount > 0}">( ${post.commentCount} )</c:if></td>
                                                <td class="writer">${post.writer}</td>
                                                <td class="date"><fmt:formatDate pattern="yyyy.MM.dd" value="${post.regDate}"/></td>
                                                <td class="views">${post.views}</td>
                                            </tr>
                                            </c:forEach>
                                     </table>
                                     <c:if test="${empty opencolumnList}"><tr><td>현재 등록된 공지사항이 없습니다.</td></tr></c:if>
                                </div>
                                <div class="media">
                                    동영상 게시판
                                     <table class="boardList">
                                            <tr>
                                                <th style="width: 10%;">번 호</th>
                                                <th style="width: 50%;">제 &nbsp 목</th>
                                                <th style="width: 15%;">작성자</th>
                                                <th style="width: 10%;">날 짜</th>
                                                <th style="width: 10%;">조 회</th>
                                            </tr>
                                            <c:forEach var="post" items="${videoList}">
                                            <tr>
                                                <td class="post-num">${post.postNum} &nbsp</td>
                                                <td><span>[공지]</span>
                                                <a class="postTitle" href="/video/readPost?postNum=${post.postNum}">
                                                 ${post.title}</a>
                                                <c:if test="${post.commentCount > 0}">( ${post.commentCount} )</c:if></td>
                                                <td class="writer">${post.writer}</td>
                                                <td class="date"><fmt:formatDate pattern="yyyy.MM.dd" value="${post.regDate}"/></td>
                                                <td class="views">${post.views}</td>
                                            </tr>
                                            </c:forEach>
                                     </table>
                                     <c:if test="${empty videoList}"><tr><td>현재 등록된 공지사항이 없습니다.</td></tr></c:if>
                                </div>
                                <div class="media">
                                     <span><a href="/library/list">자료실</a></span>
                                     <table class="boardList">
                                            <tr>
                                                <th style="width: 10%;">번 호</th>
                                                <th style="width: 50%;">제 &nbsp 목</th>
                                                <th style="width: 15%;">작성자</th>
                                                <th style="width: 10%;">날 짜</th>
                                                <th style="width: 10%;">조 회</th>
                                            </tr>
                                            <c:forEach var="post" items="${libraryList}">
                                            <tr>
                                                <td class="post-num">${post.postNum} &nbsp</td>
                                                <td><span>[공지]</span>
                                                <a class="postTitle" href="/library/readPost?postNum=${post.postNum}">
                                                 ${post.title}</a>
                                                <c:if test="${post.commentCount > 0}">( ${post.commentCount} )</c:if></td>
                                                <td class="writer">${post.writer}</td>
                                                <td class="date"><fmt:formatDate pattern="yyyy.MM.dd" value="${post.regDate}"/></td>
                                                <td class="views">${post.views}</td>
                                            </tr>
                                            </c:forEach>
                                     </table>
                                     <c:if test="${empty libraryList}"><tr><td>현재 등록된 공지사항이 없습니다.</td></tr></c:if>
                                </div>
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
</body>
</html>