<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC1Hub - 스타크래프트1 전문 커뮤니티</title>
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

</style>
</head>
<body>

<!-- 모바일 환경 최적화 작업하기 -->

<%@include file="./include/header.jspf" %>
    <div class="section-inner">
        <div class="container">
            <%@include file="./include/sidebar.jspf" %>
            <div class="col-lg-3">
                <fieldset>
                    <legend><a href="/"> [테란 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/terranBoard/list">20. 테란 게시판</a></td></tr>
                        <tr><td><a href="">21. 테란 종족특성</a></td></tr>
                        <tr><td><a href="/tVsZBoard/list">22. 대저그전 게시판(테저전)</a></td></tr>
                        <tr><td><a href="">23. 불꽃러쉬 타이밍</a></td></tr>
                        <tr><td><a href="">24. 바이오닉 컨트롤법</a></td></tr>
                        <tr><td><a href="">25. 레이트 메카닉 운영법</a></td></tr>
                        <tr><td><a href="">26. 다크스웜 이후 운영법</a></td></tr>
                        <tr><td><a href="/tVsPBoard/list">27. 대토스전 게시판(테프전)</a></td></tr>
                        <tr><td><a href="">28. 타이밍 찌르기 정리</a></td></tr>
                        <tr><td><a href="">29. 업테란 운영법</a></td></tr>
                        <tr><td><a href="">30. 안티 캐리어 빌드</a></td></tr>
                        <tr><td><a href="/tVsTBoard/list">31. 대테란전 게시판(테테전)</a></td></tr>
                        <tr><td><a href="">32. 탱크 자리잡기 운영</a></td></tr>
                        <tr><td><a href="">33. 그래도 빨리 끝내려면?</a></td></tr>
                        <tr><td><a href="">34. 배틀크루저 운영법</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-lg-3">
                <fieldset>
                    <legend><a href="/"> [저그 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/zergBoard/list">40. 저그 게시판</a></td></tr>
                        <tr><td><a href="">41. 저그 종족특성</a></td></tr>
                        <tr><td><a href="/zVsTBoard/list">42. 대테란전 게시판(저테전)</a></td></tr>
                        <tr><td><a href="">43. 뮤탈 컨트롤 공략</a></td></tr>
                        <tr><td><a href="">44. 불꽃러쉬 대응법</a></td></tr>
                        <tr><td><a href="">45. 하이브 타이밍</a></td></tr>
                        <tr><td><a href="">46. 디파일러 운영법</a></td></tr>
                        <tr><td><a href="/zVsPBoard/list">47. 대토스전 게시판(저프전)</a></td></tr>
                        <tr><td><a href="">48. 973빌드 사용법</a></td></tr>
                        <tr><td><a href="">49. 선게이트 대응법</a></td></tr>
                        <tr><td><a href="">50. 스톰 이후 대응 운영</a></td></tr>
                        <tr><td><a href="/zVsZBoard/list">51. 대저그전 게시판(저저전)</a></td></tr>
                        <tr><td><a href="">52. 저글링 컨트롤 공략</a></td></tr>
                        <tr><td><a href="">53. 뮤탈스커지 컨트롤 심화</a></td></tr>
                        <tr><td><a href="">54. 동족전 빌드상성 정리</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-lg-3">
                <fieldset>
                    <legend><a href="/"> [프로토스 네트워크] </a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/protossBoard/list">60. 프로토스 게시판</a></td></tr>
                        <tr><td><a href="">61. 프로토스 종족특성</a></td></tr>
                        <tr><td><a href="/pVsTBoard/list">62. 대테란전 게시판(프테전)</a></td></tr>
                        <tr><td><a href="">63. 속업셔틀 뚫기 타이밍</a></td></tr>
                        <tr><td><a href="">64. 업테란 파악 후 운영법</a></td></tr>
                        <tr><td><a href="">65. 캐리어 가는 경우</a></td></tr>
                        <tr><td><a href="/pVsZBoard/list">66. 대저그전 게시판(프저전)</a></td></tr>
                        <tr><td><a href="">67. 선게이트 운영법</a></td></tr>
                        <tr><td><a href="">68. 973 찌르기 대응법</a></td></tr>
                        <tr><td><a href="">69. 투스타 운영법</a></td></tr>
                        <tr><td><a href="">70. 커공발 운영법</a></td></tr>
                        <tr><td><a href="/pVsPBoard/list">71. 대토스전 게시판(프프전)</a></td></tr>
                        <tr><td><a href="">72. 기어리버 운영법</a></td></tr>
                        <tr><td><a href="">73. 옵3게이트 운영법</a></td></tr>
                        <tr><td><a href="">74. 4게이트 찌르기</a></td></tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</section>
<%@include file="./include/footer.jspf" %>
</body>
</html>
