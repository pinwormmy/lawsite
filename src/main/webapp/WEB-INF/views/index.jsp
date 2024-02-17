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
.terran-field {
    background-image: url('/image/marine1.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
}
.zerg-field {
    background-image: url('/image/hydralisk_center1.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
}
.protoss-field {
    background-image: url('/image/zeratull1.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
}
.ad-banners {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    margin-top: 20px;
}
</style>
</head>
<body>
<%@include file="./include/header.jspf" %>
    <div class="section-inner">
        <div class="container">
            <%@include file="./include/sidebar.jspf" %>
            <div class="col-sm-3">
                <fieldset class="terran-field">
                    <legend><a href="/"> [테란 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/terranBoard/readPost?postNum=2">22. 테란 종족특성</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=2">23. 선엔베 업테란 운영</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=3">24. 투배럭 아카데미 운영</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=4">25. 개사기 8배럭 완막</a></td></tr>
                        <tr><td><a href="/tVsZBoard/readPost?postNum=5">26. 111 전략</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=9">27. 업테란 운영법</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=3">28. 타이밍 찌르기 정리</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=4">29. 안티 캐리어 빌드</a></td></tr>
                        <tr><td><a href="/tVsPBoard/readPost?postNum=5">30. 정석. 배럭더블 운영</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=2">31. 기본 정석 운영은?</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=3">32. 그래도 빨리 끝내려면?</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=4">33. 원팩원스타 전략</a></td></tr>
                        <tr><td><a href="/tVsTBoard/readPost?postNum=5">34. 후반 운영법</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="zerg-field">
                    <legend><a href="/"> [저그 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/zergBoard/readPost?postNum=2">35. 저그 종족특성</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=3">36. 투해처리 뮤탈 후 하이브</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=4">37. 4드론...</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=5">38. 초반 빌드 분기 정리</a></td></tr>
                        <tr><td><a href="/zVsTBoard/readPost?postNum=6">39. 뮤탈짤짤이 공략</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=2">40. 973빌드 사용법</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=3">41. 5해처리 히드라 운영</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=4">42. 하이브 운영에 대해..</a></td></tr>
                        <tr><td><a href="/zVsPBoard/readPost?postNum=5">43. 5뮤탈 운영법</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=2">44. 초반빌드 상성 정리</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=3">45. 뮤짤로 스커지 잡기</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=4">46. 4드론 대신 쓸 날먹빌드</a></td></tr>
                        <tr><td><a href="/zVsZBoard/readPost?postNum=5">47. 빌드상성 극복하기</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="protoss-field">
                    <legend><a href="/"> [프로토스 네트워크] </a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/protossBoard/readPost?postNum=2">48. 프로토스 종족특성</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=2">49. 안전한 23넥 아비터 운영</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=3">50. 극혐? 대각생넥캐리어!</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=4">51. 전진로보 전략</a></td></tr>
                        <tr><td><a href="/pVsTBoard/readPost?postNum=5">52. 최신 운영법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=2">53. 선게이트 운영법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=3">54. 973 찌르기 대응법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=5">55. 포지더블 운영법</a></td></tr>
                        <tr><td><a href="/pVsZBoard/readPost?postNum=4">56. 커공발 운영법</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=2">57. 기어리버 운영법</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=4">58. 빌드 상성 정리</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=5">59. 2게이트 대처법</a></td></tr>
                        <tr><td><a href="/pVsPBoard/readPost?postNum=6">60. 3게이트 드라군</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-12 ad-banners">
                <a href="https://link.coupang.com/a/bqROzj" target="_blank" referrerpolicy="unsafe-url">
                <img src="https://image11.coupangcdn.com/image/affiliate/banner/9b1da9677d1b2c47789967b75f6639de@2x.jpg"
                alt="스타크래프트 오버로드 봉제인형" width="120" height="240"></a>
                <a href="https://link.coupang.com/a/bqRWZe" target="_blank" referrerpolicy="unsafe-url"><img src="https://image11.coupangcdn.com/image/affiliate/banner/8abca2f20c326e3de646d261d75ba384@2x.jpg" alt="스타크래프트 저그 호환 블록 장난감 스타 저글링 럴커 뮤탈 히드라 드론 레고 피규어, 세트" width="120" height="240"></a>
                <a href="https://link.coupang.com/a/bqR0AZ" target="_blank" referrerpolicy="unsafe-url"><img src="https://img4a.coupangcdn.com/image/affiliate/banner/d79efa85758312f24b59f6b4af46a3ee@2x.jpg" alt="레오폴드 FC900RBT PD 그레이 블루 한글 (저소음적축)" width="120" height="240"></a>
                <a href="https://link.coupang.com/a/bqROzj" target="_blank" referrerpolicy="unsafe-url">
                <img src="https://image11.coupangcdn.com/image/affiliate/banner/9b1da9677d1b2c47789967b75f6639de@2x.jpg"
                alt="스타크래프트 오버로드 봉제인형" width="120" height="240"></a>
                <a href="https://link.coupang.com/a/bqROzj" target="_blank" referrerpolicy="unsafe-url">
                <img src="https://image11.coupangcdn.com/image/affiliate/banner/9b1da9677d1b2c47789967b75f6639de@2x.jpg"
                alt="스타크래프트 오버로드 봉제인형" width="120" height="240"></a>
                <a href="https://link.coupang.com/a/bqROzj" target="_blank" referrerpolicy="unsafe-url">
                <img src="https://image11.coupangcdn.com/image/affiliate/banner/9b1da9677d1b2c47789967b75f6639de@2x.jpg"
                alt="스타크래프트 오버로드 봉제인형" width="120" height="240"></a>
                <a href="https://link.coupang.com/a/bqROzj" target="_blank" referrerpolicy="unsafe-url">
                <img src="https://image11.coupangcdn.com/image/affiliate/banner/9b1da9677d1b2c47789967b75f6639de@2x.jpg"
                alt="스타크래프트 오버로드 봉제인형" width="120" height="240"></a>
                <a href="https://link.coupang.com/a/bqROzj" target="_blank" referrerpolicy="unsafe-url">
                <img src="https://image11.coupangcdn.com/image/affiliate/banner/9b1da9677d1b2c47789967b75f6639de@2x.jpg"
                alt="스타크래프트 오버로드 봉제인형" width="120" height="240"></a>
            </div>
        </div>
    </div>
</section>
<%@include file="./include/footer.jspf" %>
</body>
</html>
