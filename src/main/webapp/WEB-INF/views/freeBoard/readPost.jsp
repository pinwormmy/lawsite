<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>${post.title} - 자유게시판</title>

<style>

.post-title {
    padding: 0.5rem 0.75rem;
    font-size: 20px;
    font-weight: 400;
    border-color: #bbb;
}
.info-row {
    padding: 0.35rem 0.75rem 0.3rem;
    border-bottom: 1px solid;
    border-color: #bbb;
    font-size: 18px;
    font-weight: 300;
    overflow: hidden;
}
.btn-theme {
    margin: 10px 0;
    float: right;
}
.recommend-div {
    text-align: center;
}

</style>


</head>
<body>
<%@include file="../include/header.jspf" %>
<div class="section-inner">
    <div class="container">
        <%@include file="../include/sidebar.jspf" %>
        <div class="col-lg-9">
            <div class="title-row">
                <div class="post-title">${post.title}</div>
            </div>
            <div class="info-row">
                <span>작성자 : ${post.writer} </span> &nbsp;
                <span>날 짜 : <fmt:formatDate value="${post.regDate}" pattern="yyyy-MM-dd HH:mm"/> </span> &nbsp;
                <span>조 회 : ${post.views} </span> &nbsp;
            </div>
            <div class="row">
                <div class="col-xs-12 mb fadeInUp">
                    ${post.content}
                    <div class="recommend-div">
                        <button onclick="addRecommend(${post.postNum})" accesskey="m">추천(M) : ${post.recommendCount}</button>
                    </div>
                    <hr>
                </div>

                <div id="comments" class="col-xs-12">
                    <div class="mb">
                        [댓 글]
                    </div>
                    <div id="comments-list" class="gap"></div>
                    <div id="comments-page" class="gap"></div>
                    <c:if test="${member != null}">
                        <div id="comment-form" class="gap">
                            <div class="form-group">
                                <div class="col-sm-6">
                                    작성자 : ${member.nickName}
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <textarea rows="1" class="form-control" name="commentContent" id="commentContent" placeholder="댓글을 작성합니다"></textarea>
                                </div>
                                <div class="col-sm-12">
                                    <button type="button" class="pull btn btn-theme cancel-btn" style="margin-left: 15px;" onclick="addComment();" accesskey="c">댓글작성(C)</button>
                                </div>
                            </div>
                        </div><!--/#comment-form-->
                    </c:if>
                </div><!--/#comments-->
                <div class="post-navigation col-xs-12"">
                    <hr>
                    <a class="pull btn btn-theme cancel-btn" href="/freeBoard/list" accesskey="l">목 록(L)</a>
                    <c:if test="${member.id == post.writer || member.grade == 3}">
                        <a class="pull btn btn-theme cancel-btn" href="/freeBoard/deletePost?postNum=${post.postNum}">삭 제(-)</a>
                        <a class="pull btn btn-theme cancel-btn" href="/freeBoard/modifyPost?postNum=${post.postNum}" accesskey="o">️수 정(O)</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    const postNum = ${post.postNum};
    const recommendCount = ${post.recommendCount};
    const memberId = "${member.id != null ? member.id : ''}";
    const memberGrade = ${member.grade != null ? member.grade : 0};

    let isLoggedIn = <c:choose>
        <c:when test="${not empty member}">true</c:when>
        <c:otherwise>false</c:otherwise>
    </c:choose>;

</script>

<script src="/js/readPost.js"></script>

<%@include file="../include/footer.jspf" %>
</body>
</html>


</script>

<%@include file="../include/footer.jspf" %>
</body>
</html>