<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
    <title>한국헌법학회 샘플</title>
    <style>
        .boardList {
            border-collapse: collapse;
            overflow: hidden;
            margin: 10px 0 10px 0;
            width: 100%;
        }
    </style>
    <%@include file="./include/header.jspf" %>
</head>
<body>
    <div class="col-lg-12">
        <div id="carouselExampleIndicators" class="carousel slide main-slide">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="/image/slide1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="/image/slide2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="/image/slide3.jpg" class="d-block w-100" alt="...">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
        <div class="accordion" id="accordionExample">
          <div class="accordion-item">
            <h2 class="accordion-header">
              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                Accordion Item #1
              </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
              <div class="accordion-body">
                <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                Accordion Item #2
              </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                Accordion Item #3
              </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
              <div class="accordion-body">
                <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
    </div>
    <div class="section-inner">
        <div class="container">
            <div class="col-sm-3">
                <fieldset class="terran-field">
                    <legend style="color:#75f94c;"> 테란 네트워크 </legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/boards/tVsZBoard/readPost?postNum=3" style="color:yellow;">21. 테저전 정석 빌드</a></td></tr>
                        <tr><td><a href="/boards/tVsZBoard/readPost?postNum=2">22. 선엔베 업테란 운영</a></td></tr>
                        <tr><td><a href="/boards/tVsZBoard/readPost?postNum=6">23. 저그전 심시티 모음</a></td></tr>
                        <tr><td><a href="/boards/tVsZBoard/readPost?postNum=9">24. 초보추천! 5팩 골리앗</a></td></tr>
                        <tr><td><a href="/boards/tVsPBoard/readPost?postNum=11" style="color:yellow;">25. 테프전 정석 빌드</a></td></tr>
                        <tr><td><a href="/boards/tVsPBoard/readPost?postNum=10">26. 쉽고 강한 2팩 러쉬</a></td></tr>
                        <tr><td><a href="/boards/tVsPBoard/readPost?postNum=7">27. 공1업 5팩 타이밍</a></td></tr>
                        <tr><td><a href="/boards/tVsPBoard/readPost?postNum=9">28. 업테란 운영 빌드</a></td></tr>
                        <tr><td><a href="/boards/tVsTBoard/readPost?postNum=2" style="color:yellow;">29. 테테전 정석 빌드</a></td></tr>
                        <tr><td><a href="/boards/tVsTBoard/readPost?postNum=4">30. 원팩원스타 전략</a></td></tr>
                        <tr><td><a href="/boards/tVsTBoard/readPost?postNum=5">31. 바둑같은 후반 운영</a></td></tr>
                        <tr><td><a href="/boards/tVsTBoard/readPost?postNum=3">32. 그냥 빨리 끝내기</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="zerg-field">
                    <legend style="color:#75f94c;">저그 네트워크</legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/boards/zVsTBoard/readPost?postNum=3" style="color:yellow;">33. 저테전 정석 빌드</a></td></tr>
                        <tr><td><a href="/boards/zVsTBoard/readPost?postNum=6">34. 기본소양!! 뮤짤 공략</a></td></tr>
                        <tr><td><a href="/boards/zVsTBoard/readPost?postNum=8">35. 걍 밀어!! 5럴커 뚫기</a></td></tr>
                        <tr><td><a href="/boards/zVsTBoard/readPost?postNum=13">36. 쉬운 운영. 미친 저그</a></td></tr>
                        <tr><td><a href="/boards/zVsPBoard/readPost?postNum=3" style="color:yellow;">37. 저프전 정석 빌드</a></td></tr>
                        <tr><td><a href="/boards/zVsPBoard/readPost?postNum=2">38. 개꿀~!! 973 빌드</a></td></tr>
                        <tr><td><a href="/boards/zVsPBoard/readPost?postNum=4">39. 필독~투게이트 대처법</a></td></tr>
                        <tr><td><a href="/boards/zVsPBoard/readPost?postNum=9">40. 8겟뽕 대처하기</a></td></tr>
                        <tr><td><a href="/boards/zVsZBoard/readPost?postNum=6" style="color:yellow;">41. 저저전 정석 빌드</a></td></tr>
                        <tr><td><a href="/boards/zVsZBoard/readPost?postNum=3">42. 뮤짤로 스커지 잡기</a></td></tr>
                        <tr><td><a href="/boards/zVsZBoard/readPost?postNum=4">43. 4드론 대신할 날먹</a></td></tr>
                        <tr><td><a href="/boards/zVsZBoard/readPost?postNum=2">44. 저저전 빌드 상성</a></td></tr>
                    </table>
                </fieldset>
            </div>
            <div class="col-sm-3">
                <fieldset class="protoss-field">
                    <legend style="color:#75f94c;">프로토스 네트워크</legend>
                    <table class="boardList" style="width: 100%;">
                        <tr><td><a href="/boards/pVsTBoard/readPost?postNum=2" style="color:yellow;">45. 프테전 정석 빌드</a></td></tr>
                        <tr><td><a href="/boards/pVsTBoard/readPost?postNum=3">46. 대각 생넥 캐리어</a></td></tr>
                        <tr><td><a href="/boards/pVsTBoard/readPost?postNum=4">47. 걸리버 전진로보 전략</a></td></tr>
                        <tr><td><a href="/boards/pVsTBoard/readPost?postNum=11">48. 5팩 타이밍 대처</a></td></tr>
                        <tr><td><a href="/boards/pVsZBoard/readPost?postNum=5" style="color:yellow;">49. 프저전 정석 빌드</a></td></tr>
                        <tr><td><a href="/boards/pVsZBoard/readPost?postNum=15">50. 최신래더맵 심시티</a></td></tr>
                        <tr><td><a href="/boards/pVsZBoard/readPost?postNum=3">51. 개같은 973 대처하기</a></td></tr>
                        <tr><td><a href="/boards/pVsZBoard/readPost?postNum=14">52. 초장기전 운영법</a></td></tr>
                        <tr><td><a href="/boards/pVsPBoard/readPost?postNum=2" style="color:yellow;">53. 프프전 정석 빌드</a></td></tr>
                        <tr><td><a href="/boards/pVsPBoard/readPost?postNum=4">54. 프프전 빌드 상성</a></td></tr>
                        <tr><td><a href="/boards/pVsPBoard/readPost?postNum=5">55. 암기!! 투게이트 대처</a></td></tr>
                        <tr><td><a href="/boards/pVsPBoard/readPost?postNum=6">56. 날먹~3게이트 드라군</a></td></tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
    <%@include file="./include/footer.jspf" %>
</body>
</html>