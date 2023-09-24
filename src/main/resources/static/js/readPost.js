//alert("js test 22");
let commentContent = document.getElementById("commentContent");
showCommentList();

// 공통 fetch 함수
async function fetchData(url, method = 'GET', body = null) {
    const headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    };

    // GET 또는 HEAD 메서드일 경우 body를 제거
    const config = method === 'GET' || method === 'HEAD' ? { method, headers } : { method, headers, body: JSON.stringify(body) };
    const response = await fetch(url, config);

    if (!response.ok) {
        throw new Error(`Fetch failed: ${response.status}`);
    }

    return await response.json();
}

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
                postNum: postNum,
                id: memberId,
                content: commentContent.value,
            })
        });

        if (response.ok) {
            const text = await response.text();  // 먼저 텍스트로 응답을 받습니다.
            try {
                const data = JSON.parse(text);  // 그 다음 JSON으로 파싱을 시도합니다.
                console.log(data);
                await updateCommentCount(postNum);  // 이 함수는 기존에 정의되어 있다고 가정합니다.
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
                postNum : postNum
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
    if( (memberId == commentDTO.id) || (memberGrade == 3) ) {
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
            await updateCommentCount(postNum);
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

// 추천 기능
let isRecommended = false;

function updateRecommendButtonText(isRecommended, recommendCount) {
    console.log("updateRecommendButtonText - isRecommended:", isRecommended, "recommendCount:", recommendCount);  // 로그 추가
    const recommendButton = document.querySelector('.recommend-div button');
    if (recommendCount !== undefined) {  // 추천 수가 undefined가 아닌 경우에만 텍스트를 업데이트합니다.
        recommendButton.textContent = isRecommended ? "추천취소(M) : " + recommendCount : "추천(M) : " + recommendCount;
    }
}

async function addRecommend(postNum) {
    if (!isLoggedIn) {
        alert("추천 기능을 사용하려면 로그인이 필요합니다.");
        return;
    }

    // 현재 사용자가 이미 추천했는지 확인
    const checkData = await fetchData("/freeBoard/checkRecommendation?postNum=" + postNum, "GET");
    if (checkData && checkData.checkRecommend !== undefined) {
        isRecommended = checkData.checkRecommend;
    }
    console.log("Initial isRecommended:", isRecommended);  // 디버깅 로그

    let url = isRecommended ? "/freeBoard/cancelRecommendation" : "/freeBoard/addRecommendation";
    let method = isRecommended ? "DELETE" : "POST";

    const body = { postNum: postNum };
    await fetchData(url, method, body);  // 추천 상태 변경

    const recommendCount = await fetchRecommendCount(postNum);  // 추천수 업데이트
    console.log("Fetched recommendCount:", recommendCount);  // 디버깅 로그

    // 다시 한번 현재 사용자가 추천했는지 확인
    const updatedCheckData = await fetchData("/freeBoard/checkRecommendation?postNum=" + postNum, "GET");
    if (updatedCheckData && updatedCheckData.checkRecommend !== undefined) {
        isRecommended = updatedCheckData.checkRecommend;
    }
    console.log("Updated isRecommended:", isRecommended);  // 디버깅 로그

    updateRecommendButtonText(isRecommended, recommendCount);
}


async function fetchRecommendCount(postNum) {
    const data = await fetchData("/freeBoard/getRecommendCount?postNum=" + postNum, "GET");
    console.log("fetchRecommendCount 응답:", data);  // 응답 로깅
    if (data !== undefined && data !== null) {  // 조건 수정
        return data;
    } else {
        console.error("추천 수를 가져오는 데 실패했습니다:", data);
        return undefined;
    }
}

window.onload = async function() {
    if (isLoggedIn) {
        try {
            const data = await fetchData("/freeBoard/checkRecommendation?postNum=" + postNum, "GET");
            if (data) {
                isRecommended = data.checkRecommend;
                console.log("window.onload - isRecommended:", isRecommended);  // 로그 추가
                updateRecommendButtonText(isRecommended, recommendCount);
            }
        } catch (error) {
            console.error(error);
        }
    }
};