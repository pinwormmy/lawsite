<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>${post.title} - 자유게시판</title>

<style>
body {
    height: 100%;
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
.col-xs-12 p {
    padding: 15px;
}
.col-lg-7 {
    padding: 15px;
}
.basic-button {
    color: white;
    background-color: Turquoise;
    font-size: 14px;
    padding: 6px 12px;
    border: none;
    border-radius: 10px;
    font-weight: 300;
    margin: 5px;
}
.basic-button-white {
    color: Turquoise;
    background-color: white;
    border: 1px solid Turquoise;
    font-size: 14px;
    padding: 6px 12px;
    border-radius: 10px;
    font-weight: 300;
    margin: 5px;
}
.row {
    margin-top: 15px;
}
.side-banner {
    margin-top: 15px;
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
                        <a class="pull btn btn-theme cancel-btn" href="/freeBoard/deletePost?postNum=${post.postNum}" accesskey="t">삭 제(T)</a>
                        <a class="pull btn btn-theme cancel-btn" href="/freeBoard/modifyPost?postNum=${post.postNum}" accesskey="o">️수 정(O)</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

//alert("js test 21");
let commentContent = document.getElementById("commentContent");
showCommentList();

function addComment() {
    if(commentContent.value == "") {
        alert("댓글 내용을 작성해주세요~", commentContent.value);
        return false;
    }
    fetch("/freeBoard/addComment", {
        method: 'POST',
        headers: {"Content-Type" : "application/json"},
        body: JSON.stringify({
            postNum : ${post.postNum},
            id : "${member.id}",
            content : commentContent.value,
        })
    })
    .then((data) => {
        console.log(data);
        updateCommentCount(${post.postNum});
        showCommentList();
    });
    commentContent.value = "";
}

function showCommentList(commentPage) {
    pageSettingAndLoadComment(commentPage);
}

function pageSettingAndLoadComment(commentPage) {
    fetch("/freeBoard/commentPageSetting", {
            method: 'POST',
            headers: {"Content-Type" : "application/json"},
            body: JSON.stringify({
                recentPage : commentPage,
                postNum : ${post.postNum}
            })
        })
    .then((response) => response.json())
    .then((data) => {
        console.log(data);
        loadCommentFetch(data);
        let commentPageDivTag = document.getElementById("comments-page");
        commentPageDivTag.innerHTML = "";
        let commentPageHtml = "";

        if(data.prevPageSetPoint >= 1) {
            commentPageHtml +="<a href='javascript:pageSettingAndLoadComment(" + data.prevPageSetPoint + ")'>◁</a>";
        }
        if(data.totalPage > 1) {
            for(let i=data.pageBeginPoint; i<=data.pageEndPoint; i++) {
                if(i == data.recentPage) {
                    commentPageHtml += " " + i + " ";
                }else {
                    commentPageHtml += "<a href='javascript:pageSettingAndLoadComment(" + i + ")'>" + i + " </a>";
                }
            }
        }
        if(data.nextPageSetPoint <= data.totalPage) {
            commentPageHtml +="<a href='javascript:pageSettingAndLoadComment(" + data.nextPageSetPoint + ")'>▷</a>";
        }
        commentPageDivTag.innerHTML += commentPageHtml;
    });
}

function loadCommentFetch(pageDTO) {
    console.log("댓글불러오기 펫치 시작전");
    fetch("/freeBoard/showCommentList", {
        method: "POST",
        headers: {"Content-Type" : "application/json"},
        body: JSON.stringify(pageDTO),
    })
    .then((response) => response.json())
    .then((data) => showCommentWithHtml(data));
}

function showCommentWithHtml(CommentDTOList) {
    let commentDivTag = document.getElementById("comments-list");
    commentDivTag.innerHTML = "";
    let commentListHtml = "";
    commentDivTag.innerHTML += commentHtmlWithString(commentListHtml, CommentDTOList);
    console.log("댓글 코맨트 소스 작업  반영 확인");
}

function commentHtmlWithString(commentListHtml, CommentDTOList) {
    console.log("댓글 코맨트 소스 반복문 준비 확인");
    for(let comment of CommentDTOList) {
        commentListHtml += "<div class='media'><div class='media-body'><div style='margin: 0; padding: 10px;'><div class='media-heading'>";
        commentListHtml += comment.memberDTO.nickName + " &nbsp; <small>";
        commentListHtml = displayDeleteButton(commentListHtml, comment);
        commentListHtml += comment.regDate + "</small></div><p style='margin: 0; padding: 0;'>" + comment.content + "</p></div></div></div>";
    }
    return commentListHtml;
}

function displayDeleteButton(commentListHtml, commentDTO) {
    if( ("${member.id}" == commentDTO.id) || ("${member.grade}" == 3) ) {
        commentListHtml += "<button class='pull btn btn-theme cancel-btn' onclick='deleteComment(";
        commentListHtml += commentDTO.commentNum + ");'>댓글삭제(-) </button>";
    }
    return commentListHtml;
}

function deleteComment(commentNum) {
    fetch("/freeBoard/deleteComment?commentNum=" + commentNum, {method:"DELETE"})
    .then(data => {
        updateCommentCount(${post.postNum});
        showCommentList();
    })
    .catch(error => alert("댓글 삭제 오류"));
}

function updateCommentCount(postNum) {
    fetch("/freeBoard/updateCommentCount?postNum=" + postNum, {method:"PUT"})
        .then(data => console.log("댓글 업데이트"))
        .catch(error => alert("댓글수 갱신 오류"));
}

let isRecommended = false; // 추천 상태를 저장하는 변수

function addRecommend(postNum) {
    isRecommended = !isRecommended; // 추천 상태 토글

    let url = isRecommended ? "/freeBoard/addRecommendation" : "/freeBoard/cancelRecommendation";
    let method = isRecommended ? "POST" : "DELETE";

    fetch(url, {
        method: method,
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            postNum: postNum
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'OK') {
            // 추천 성공 또는 취소 성공
            const recommendButton = document.querySelector('.recommend-div button');
            recommendButton.textContent = isRecommended ? "추천취소(C) : ${data.newRecommendCount}" : `추천(M) : ${data.newRecommendCount}`;
        } else {
            // 추천 실패 또는 취소 실패
            alert("추천 또는 취소에 실패했습니다.");
        }
    })
    .catch(error => {
        console.error("Error:", error);
    });
}


</script>

<%@include file="../include/footer.jspf" %>
</body>
</html>