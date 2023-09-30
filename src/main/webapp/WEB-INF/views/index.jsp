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
<%@include file="./include/header.jspf" %>
    <div class="section-inner">
        <div class="container">
                <%@include file="./include/sidebar.jspf" %>
                <div class="col-lg-3">
                    <fieldset>
                        <legend><a href="/"> [테란 네트워크]</a></legend>
                        <table class="boardList" style="width: 100%;">
                            <tr><td><a href="/terranBoard/list">11. 테란 게시판</a></td></tr>
                            <tr><td><a href="">12. 테란 종족특성</a></td></tr>
                            <tr><td><a href="">13. 대저그전 게시판(테저전)</a></td></tr>
                            <tr><td><a href="">14. 불꽃러쉬 타이밍</a></td></tr>
                            <tr><td><a href="">15. 바이오닉 컨트롤법</a></td></tr>
                            <tr><td><a href="">16. 레이트 메카닉 운영법</a></td></tr>
                            <tr><td><a href="">17. 다크스웜 이후 운영법</a></td></tr>
                            <tr><td><a href="">18. 대토스전 게시판(테프전)</a></td></tr>
                            <tr><td><a href="">19. 타이밍 찌르기 정리</a></td></tr>
                            <tr><td><a href="">20. 업테란 운영법</a></td></tr>
                            <tr><td><a href="">21. 안티 캐리어 빌드</a></td></tr>
                            <tr><td><a href="">22. 대테란전 게시판(테테전)</a></td></tr>
                            <tr><td><a href="">23. 탱크 자리잡기 운영</a></td></tr>
                            <tr><td><a href="">24. 그래도 빨리 끝내려면?</a></td></tr>
                            <tr><td><a href="">25. 배틀크루저 운영법</a></td></tr>
                        </table>
                    </fieldset>
                </div>
                <div class="col-lg-3">
                    <fieldset>
                        <legend><a href="/"> [저그 네트워크]</a></legend>
                        <table class="boardList" style="width: 100%;">
                            <tr><td><a href="">26. 저그 게시판</a></td></tr>
                            <tr><td><a href="">27. 저그 종족특성</a></td></tr>
                            <tr><td><a href="">28. 대테란전 게시판(저테전)</a></td></tr>
                            <tr><td><a href="">29. 뮤탈 컨트롤 공략</a></td></tr>
                            <tr><td><a href="">30. 불꽃러쉬 대응법</a></td></tr>
                            <tr><td><a href="">31. 하이브 타이밍</a></td></tr>
                            <tr><td><a href="">32. 디파일러 운영법</a></td></tr>
                            <tr><td><a href="">33. 대토스전 게시판(저프전)</a></td></tr>
                            <tr><td><a href="">34. 973빌드 사용법</a></td></tr>
                            <tr><td><a href="">35. 선게이트 대응법</a></td></tr>
                            <tr><td><a href="">36. 스톰 이후 대응 운영</a></td></tr>
                            <tr><td><a href="">37. 대저그전 게시판(저저전)</a></td></tr>
                            <tr><td><a href="">38. 저글링 컨트롤 공략</a></td></tr>
                            <tr><td><a href="">39. 뮤탈스커지 컨트롤 심화</a></td></tr>
                            <tr><td><a href="">40. 동족전 빌드상성 정리</a></td></tr>
                        </table>
                    </fieldset>
                </div>
                <div class="col-lg-3">
                    <fieldset>
                        <legend><a href="/"> [프로토스 네트워크] </a></legend>
                        <table class="boardList" style="width: 100%;">
                            <tr><td><a href="">41. 프로토스 게시판</a></td></tr>
                            <tr><td><a href="">42. 프로토스 종족특성</a></td></tr>
                            <tr><td><a href="">43. 대테란전 게시판(프테전)</a></td></tr>
                            <tr><td><a href="">44. 속업셔틀 뚫기 타이밍</a></td></tr>
                            <tr><td><a href="">45. 업테란 파악 후 운영법</a></td></tr>
                            <tr><td><a href="">46. 캐리어 가는 경우</a></td></tr>
                            <tr><td><a href="">47. 대저그전 게시판(프저전)</a></td></tr>
                            <tr><td><a href="">48. 선게이트 운영법</a></td></tr>
                            <tr><td><a href="">49. 973 찌르기 대응법</a></td></tr>
                            <tr><td><a href="">50. 투스타 운영법</a></td></tr>
                            <tr><td><a href="">51. 커공발 운영법</a></td></tr>
                            <tr><td><a href="">52. 대토스전 게시판(프프전)</a></td></tr>
                            <tr><td><a href="">53. 기어리버 운영법</a></td></tr>
                            <tr><td><a href="">54. 옵3게이트 운영법</a></td></tr>
                            <tr><td><a href="">55. 4게이트 찌르기</a></td></tr>
                        </table>
                    </fieldset>
                </div>
        </div>
    </div>
</section>
<%@include file="./include/footer.jspf" %>
</body>
</html>
