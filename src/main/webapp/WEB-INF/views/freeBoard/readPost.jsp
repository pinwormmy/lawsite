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

// 자바스크립트 코드 정리 및 외부파일로 뺄 예정
//alert("js test 21");
let commentContent = document.getElementById("commentContent");
showCommentList();

async function addComment() {
    try {
        const commentContent = document.getElementById("commentContent"); // commentContent를 어디서 가져오는지 명시적으로 추가했습니다.
        if (commentContent.value === "") {
            alert("댓글 내용을 작성해주세요~");
            return false;
        }
        const response = await fetch("/freeBoard/addComment", {
            method: 'POST',
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                postNum: ${post.postNum},  // 이 부분은 서버에서 어떻게 처리하는지에 따라 다를 수 있습니다.
                id: "${member.id}",  // 이 부분은 서버에서 어떻게 처리하는지에 따라 다를 수 있습니다.
                content: commentContent.value,
            })
        });

        if (response.ok) {
            const text = await response.text();  // 먼저 텍스트로 응답을 받습니다.
            try {
                const data = JSON.parse(text);  // 그 다음 JSON으로 파싱을 시도합니다.
                console.log(data);
                await updateCommentCount(${post.postNum});  // 이 함수는 기존에 정의되어 있다고 가정합니다.
                await showCommentList();  // 이 함수는 기존에 정의되어 있다고 가정합니다.
                commentContent.value = "";
            } catch (e) {
                console.error("JSON 파싱 오류:", e);
                console.log("서버에서 받은 응답:", text);
            }
        } else {
            console.error("댓글 추가 실패");
        }
    } catch (error) {
        console.error("댓글 추가 중 오류 발생:", error);
    }
}


// 댓글 목록 표시
async function showCommentList(commentPage) {
    await pageSettingAndLoadComment(commentPage);
}

// 페이지 설정 및 댓글 로드
async function pageSettingAndLoadComment(commentPage) {
    try {
        const response = await fetch("/freeBoard/commentPageSetting", {
            method: 'POST',
            headers: {"Content-Type" : "application/json"},
            body: JSON.stringify({
                recentPage : commentPage,
                postNum : ${post.postNum}
            })
        });

        if (response.ok) {
            const data = await response.json();
            console.log(data);
            await loadCommentFetch(data);

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
                    } else {
                        commentPageHtml += "<a href='javascript:pageSettingAndLoadComment(" + i + ")'>" + i + " </a>";
                    }
                }
            }
            if(data.nextPageSetPoint <= data.totalPage) {
                commentPageHtml +="<a href='javascript:pageSettingAndLoadComment(" + data.nextPageSetPoint + ")'>▷</a>";
            }
            commentPageDivTag.innerHTML += commentPageHtml;
        } else {
            console.error("페이지 설정 실패");
        }
    } catch (error) {
        console.error("페이지 설정 중 오류 발생:", error);
    }
}

// 댓글 불러오기
async function loadCommentFetch(pageDTO) {
    try {
        const response = await fetch("/freeBoard/showCommentList", {
            method: "POST",
            headers: {"Content-Type" : "application/json"},
            body: JSON.stringify(pageDTO),
        });

        if (response.ok) {
            const data = await response.json();
            showCommentWithHtml(data);
        } else {
            console.error("댓글 불러오기 실패");
        }
    } catch (error) {
        console.error("댓글 불러오기 중 오류 발생:", error);
    }
}

// 댓글 HTML로 표시
async function showCommentWithHtml(CommentDTOList) {
    let commentDivTag = document.getElementById("comments-list");
    commentDivTag.innerHTML = "";
    let commentListHtml = "";
    commentDivTag.innerHTML += await commentHtmlWithString(commentListHtml, CommentDTOList);
    console.log("댓글 코맨트 소스 작업  반영 확인");
}

// 댓글 HTML 문자열 생성
async function commentHtmlWithString(commentListHtml, CommentDTOList) {
    console.log("댓글 코맨트 소스 반복문 준비 확인");
    for(let comment of CommentDTOList) {
        commentListHtml += "<div class='media'><div class='media-body'><div style='margin: 0; padding: 10px;'><div class='media-heading'>";
        commentListHtml += comment.memberDTO.nickName + " &nbsp; <small>";
        commentListHtml = await displayDeleteButton(commentListHtml, comment);
        commentListHtml += comment.regDate + "</small></div><p style='margin: 0; padding: 0;'>" + comment.content + "</p></div></div></div>";
    }
    return commentListHtml;
}

// 댓글 삭제 버튼 표시
async function displayDeleteButton(commentListHtml, commentDTO) {
    if( ("${member.id}" == commentDTO.id) || ("${member.grade}" == 3) ) {
        commentListHtml += "<button class='pull btn btn-theme cancel-btn' onclick='deleteComment(";
        commentListHtml += commentDTO.commentNum + ");'>댓글삭제(-) </button>";
    }
    return commentListHtml;
}

// 댓글 삭제
async function deleteComment(commentNum) {
    try {
        const response = await fetch("/freeBoard/deleteComment?commentNum=" + commentNum, {method:"DELETE"});
        if (response.ok) {
            await updateCommentCount(${post.postNum});
            await showCommentList();
        } else {
            console.error("댓글 삭제 실패");
        }
    } catch (error) {
        alert("댓글 삭제 오류");
    }
}

// 댓글 수 업데이트
async function updateCommentCount(postNum) {
    try {
        const response = await fetch("/freeBoard/updateCommentCount?postNum=" + postNum, {method:"PUT"});
        if (response.ok) {
            console.log("댓글 업데이트");
        } else {
            console.error("댓글수 갱신 오류");
        }
    } catch (error) {
        alert("댓글수 갱신 오류");
    }
}


let isRecommended = false;

function updateRecommendButtonText(isRecommended, recommendCount) {
    const recommendButton = document.querySelector('.recommend-div button');
    recommendButton.textContent = isRecommended ? "추천취소(M) : " + recommendCount : "추천(M) : " + recommendCount;
}

function addRecommend(postNum) {
    if (!isLoggedIn) {
        alert("추천 기능을 사용하려면 로그인이 필요합니다.");
        return;
    }

    isRecommended = !isRecommended;

    let url = isRecommended ? "/freeBoard/addRecommendation" : "/freeBoard/cancelRecommendation";
    let method = isRecommended ? "POST" : "DELETE";

    fetch(url, {
        method: method,
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            postNum: postNum
        })
    })
    .then(response => {
        if (response.status === 200) {
            return response.json();
        } else {
            throw new Error("Failed to recommend");
        }
    })
    .then(data => {
        return fetchRecommendCount(postNum);
    })
    .then(recommendCount => {
        updateRecommendButtonText(isRecommended, recommendCount);
    })
    .catch(error => {
        alert("추천 또는 취소에 실패했습니다.");
    });
}

function fetchRecommendCount(postNum) {
    return fetch("/freeBoard/getRecommendCount?postNum=" + postNum)
        .then(response => {
            console.log("추천 수 조회 응답:", response);
            if (response.status === 200) {
                return response.json();
            } else {
                throw new Error("추천 수 조회 중 오류 발생");
            }
        })
        .catch(error => {
            console.error("Error:", error);
        });
}

let isLoggedIn = <c:choose>
    <c:when test="${not empty member}">true</c:when>
    <c:otherwise>false</c:otherwise>
</c:choose>;

window.onload = async function() {
    if (isLoggedIn) {
        try {
            let response = await fetch("/freeBoard/checkRecommendation?postNum=" + ${post.postNum});
            if (response.status === 200) {
                let data = await response.json();
                isRecommended = data.checkRecommend;
                updateRecommendButtonText(isRecommended, ${post.recommendCount});
            } else {
                throw new Error('로그인이 필요한 작업입니다.');
            }
        } catch (error) {
            console.error(error);
        }
    }
};

</script>

<%@include file="../include/footer.jspf" %>
</body>
</html>