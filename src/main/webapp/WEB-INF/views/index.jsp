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
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
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
        </div>
    </div>
    <div class="section-inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="mainmenu">
                        <a href="/boards/historyBoard">
                            <img src="/image/aboutus_btn.jpg" width="180px">학회소개
                       </a>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="mainmenu">
                        <a href="/boards/noticeBoard">
                            <img src="/image/news_btn.jpg" width="180px">학회소식
                       </a>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="mainmenu">
                        <a href="/boards/researchBoard">
                            <img src="/image/research_btn.jpg" width="180px">헌법학연구
                       </a>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="mainmenu">
                        <a href="/boards/downloadBoard">
                            <img src="/image/download_btn.jpg" width="180px">학회자료실
                       </a>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="mainmenu">
                        <a href="/boards/freeBoard">
                            <img src="/image/freeboard_btn.jpg" width="180px">자유게시판
                       </a>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="mainmenu">
                        <a href="/boards/downloadBoard">
                            <img src="/image/membership_btn.jpg" width="180px">학회가입
                       </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="./include/footer.jspf" %>
</body>
</html>