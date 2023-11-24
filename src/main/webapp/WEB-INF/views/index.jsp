<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC1Hub - 스타크래프트1 전문 커뮤니티</title>
<style>

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

</style>
</head>
<body>
<%@include file="./include/header.jspf" %>
    <div class="section-inner">
        <div class="container">
            <%@include file="./include/sidebar.jspf" %>
            <div class="col-lg-3">
                <fieldset>
                    <legend><a href="/"> [테란 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/terranBoard/list">30. 테란 게시판</a></td></tr>
                        <tr><td><a href="/terranBoard/readPost?postNum=2">31. 테란 종족특성</a></td></tr>
                        <tr><td><a href="/tVsZBoard/list">32. 대저그전 게시판(테저전)</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=2">33. 선엔베 업테란 운영</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=3">34. 투배럭 아카데미 운영</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=4">35. 개사기 8배럭 완막</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=5">36. 111 전략</a></td></tr>
                        <tr><td><a href="/tVsPBoard/list">37. 대토스전 게시판(테프전)</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=2">38. 업테란 운영법</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=3">39. 타이밍 찌르기 정리</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=4">40. 안티 캐리어 빌드</a></td></tr>
                        <tr><td><a href="/tVsTBoard/list">41. 대테란전 게시판(테테전)</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=2">42. 기본 정석 운영은?</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=3">43. 그래도 빨리 끝내려면?</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=4">44. 원팩원스타 전략</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-lg-3">
                <fieldset>
                    <legend><a href="/"> [저그 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/zergBoard/list">50. 저그 게시판</a></td></tr>
                        <tr><td><a href="/zergBoard/readPost?postNum=2">51. 저그 종족특성</a></td></tr>
                        <tr><td><a href="/zVsTBoard/list">52. 대테란전 게시판(저테전)</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=3">53. 투해처리 뮤탈 후 하이브</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=4">54. 4드론...</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=5">55. 초반 빌드 분기 정리</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=6">56. 뮤탈짤짤이 공략</a></td></tr>
                        <tr><td><a href="/zVsPBoard/list">57. 대토스전 게시판(저프전)</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=2">58. 973빌드 사용법</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=3">59. 5해처리 히드라 운영</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=4">60. 하이브 운영에 대해..</a></td></tr>
                        <tr><td><a href="/zVsZBoard/list">61. 대저그전 게시판(저저전)</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=2">62. 초반빌드 상성 정리</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=3">63. 뮤짤로 스커지 잡기</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=4">64. 4드론 대신 쓸 날먹빌드</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-lg-3">
                <fieldset>
                    <legend><a href="/"> [프로토스 네트워크] </a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/protossBoard/list">70. 프로토스 게시판</a></td></tr>
                        <tr><td><a href="/protossBoard/readPost?postNum=2">71. 프로토스 종족특성</a></td></tr>
                        <tr><td><a href="/pVsTBoard/list">72. 대테란전 게시판(프테전)</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=2">73. 안전한 23넥 아비터 운영</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=3">74. 극혐? 대각생넥캐리어!</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=4">75. 전진로보 전략</a></td></tr>
                        <tr><td><a href="/pVsZBoard/list">76. 대저그전 게시판(프저전)</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=2">77. 선게이트 운영법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=3">78. 973 찌르기 대응법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=5">79. 포지더블 운영법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=4">80. 커공발 운영법</a></td></tr>
                        <tr><td><a href="/pVsPBoard/list">81. 대토스전 게시판(프프전)</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=2">82. 기어리버 운영법</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=4">83. 빌드 상성 정리</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=5">84. 2게이트 대처법</a></td></tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</section>
<%@include file="./include/footer.jspf" %>
</body>
</html>
