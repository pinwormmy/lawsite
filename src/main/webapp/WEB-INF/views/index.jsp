<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
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
    </style>
    <%@include file="./include/header.jspf" %>
</head>
<body>
    <div class="section-inner">
        <div class="container">
            <!-- 구현중... <%@include file="./include/latestPosts.jspf" %> -->
            <%@include file="./include/sidebar.jspf" %>
            <div class="col-sm-3">
                <fieldset class="terran-field">
                    <legend><a href="/boards/"> [테란 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/boards/tVsZBoard/readPost?postNum=3">22. 저그전 정석! 투배럭 아카</a></td></tr>
                        <tr><td><a href="/boards/tVsZBoard/readPost?postNum=2">23. 선엔베 업테란 운영</a></td></tr>
                        <tr><td><a href="/boards/tVsZBoard/readPost?postNum=6">24. 저그전 심시티 모음</a></td></tr>
                        <tr><td><a href="/boards/tVsZBoard/readPost?postNum=4">25. 개사기 8배럭 완막</a></td></tr>
                        <tr><td><a href="/boards/tVsZBoard/readPost?postNum=8">26. 레이트메카닉 왜 안 씀?</a></td></tr>
                        <tr><td><a href="/boards/tVsPBoard/readPost?postNum=5">27. 토스전엔 배럭 더블!</a></td></tr>
                        <tr><td><a href="/boards/tVsPBoard/readPost?postNum=3">28. 타이밍 찌르기 정리</a></td></tr>
                        <tr><td><a href="/boards/tVsPBoard/readPost?postNum=4">29. 안티 캐리어 빌드</a></td></tr>
                        <tr><td><a href="/boards/tVsPBoard/readPost?postNum=7">30. 공1업 5팩 타이밍 러쉬</a></td></tr>
                        <tr><td><a href="/boards/tVsTBoard/readPost?postNum=3">31. 테테전 싫은 사람 추천ㅋㅋ</a></td></tr>
                        <tr><td><a href="/boards/tVsTBoard/readPost?postNum=2">32. 테테전 정석. 3팩 벌처</a></td></tr>
                        <tr><td><a href="/boards/tVsTBoard/readPost?postNum=4">33. 원팩원스타 전략</a></td></tr>
                        <tr><td><a href="/boards/tVsTBoard/readPost?postNum=5">34. 테테 후반 운영법</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="zerg-field">
                    <legend><a href="/boards/"> [저그 네트워크]</a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/boards/zVsTBoard/readPost?postNum=3">35. 테란전 기본 흐름</a></td></tr>
                        <tr><td><a href="/boards/zVsTBoard/readPost?postNum=6">36. 필독! 뮤탈짤짤이 공략</a></td></tr>
                        <tr><td><a href="/boards/zVsTBoard/readPost?postNum=7">37. 추천날빌~ 뮤탈 링올인</a></td></tr>
                        <tr><td><a href="/boards/zVsTBoard/readPost?postNum=8">38. 그냥 밀어!! 5럴커 뚫기</a></td></tr>
                        <tr><td><a href="/boards/zVsTBoard/readPost?postNum=9">39. 111 대처를 아세요?</a></td></tr>
                        <tr><td><a href="/boards/zVsPBoard/readPost?postNum=3">40. 토스전 정석. 5해처리 운영</a></td></tr>
                        <tr><td><a href="/boards/zVsPBoard/readPost?postNum=2">41. 토스 울어요ㅜㅜ 973 빌드</a></td></tr>
                        <tr><td><a href="/boards/zVsPBoard/readPost?postNum=4">42. 하이브 운영에 대해..</a></td></tr>
                        <tr><td><a href="/boards/zVsPBoard/readPost?postNum=5">43. 요즘 대세! 5뮤탈 운영법</a></td></tr>
                        <tr><td><a href="/boards/zVsZBoard/readPost?postNum=2">44. 저저전 빌드 상성 정리</a></td></tr>
                        <tr><td><a href="/boards/zVsZBoard/readPost?postNum=3">45. 뮤짤로 스커지 잡기</a></td></tr>
                        <tr><td><a href="/boards/zVsZBoard/readPost?postNum=4">46. 4드론 대신 쓸 날먹빌드</a></td></tr>
                        <tr><td><a href="/boards/zVsZBoard/readPost?postNum=5">47. 빌드상성 극복해보자!</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="protoss-field">
                    <legend><a href="/boards/"> [프로토스 네트워크] </a></legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/boards/pVsTBoard/readPost?postNum=2">48. 테란전 기본. 23넥 아비터</a></td></tr>
                        <tr><td><a href="/boards/pVsTBoard/readPost?postNum=3">49. 개사기..대각 생넥 캐리어</a></td></tr>
                        <tr><td><a href="/boards/pVsTBoard/readPost?postNum=4">50. 뚝베기를!! 전진로보 전략</a></td></tr>
                        <tr><td><a href="/boards/pVsTBoard/readPost?postNum=5">51. 최신 테란전 운영</a></td></tr>
                        <tr><td><a href="/boards/pVsZBoard/readPost?postNum=7">52. 저그전의 기초. 투게이트</a></td></tr>
                        <tr><td><a href="/boards/pVsZBoard/readPost?postNum=8">53. 믿고 쓰자! 8겟뽕</a></td></tr>
                        <tr><td><a href="/boards/pVsZBoard/readPost?postNum=3">54. 개같은 973 대처하기</a></td></tr>
                        <tr><td><a href="/boards/pVsZBoard/readPost?postNum=4">55. 커공발 운영법</a></td></tr>
                        <tr><td><a href="/boards/pVsZBoard/readPost?postNum=2">56. 강력한 초반운영. 선게이트</a></td></tr>
                        <tr><td><a href="/boards/pVsPBoard/readPost?postNum=2">57. 프프전 정석. 기어 리버</a></td></tr>
                        <tr><td><a href="/boards/pVsPBoard/readPost?postNum=4">58. 프프전 빌드 상성 정리</a></td></tr>
                        <tr><td><a href="/boards/pVsPBoard/readPost?postNum=5">59. 2게이트 대처법</a></td></tr>
                        <tr><td><a href="/boards/pVsPBoard/readPost?postNum=6">60. 쉽고 강한 3게이트 드라군</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <%@include file="./include/coupangAd.jspf" %>
        </div>
    </div>
    <%@include file="./include/footer.jspf" %>
</body>
</html>
