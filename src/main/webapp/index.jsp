<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="./main/header.jsp"/>
    <main>
        <section>
            <!-- MEN 카테고리 섹션 -->
            <article class="slide-container back1">
                <div id="men_link"></div>
                <h1 id="men">MEN</h1>
                <div class="slide-box fade slide1">
                    <img src="${pageContext.request.contextPath}/image/men/korie-cull-day4vrQl9ic-unsplash.jpg" alt="men.01">
                </div>
                <div class="slide-box fade slide1">
                    <img src="${pageContext.request.contextPath}/image/men/kundan-bana-69XpPMCQ5OU-unsplash.jpg" alt="men.02">
                </div>
                <div class="slide-box fade slide1">
                    <img src="${pageContext.request.contextPath}/image/men/mateusz-syta-xU-QhJ5K5mg-unsplash.jpg" alt="men.03">
                </div>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</p>
            </article>

            <!-- WOMEN 카테고리 섹션 -->
            <article class="slide-container back2">
                <div id="women_link"></div>
                <h1 id="women">WOMEN</h1>
                <div class="slide-box fade slide2">
                    <img src="${pageContext.request.contextPath}/image/women/alex-shaw-GtkWU292vLQ-unsplash.jpg" alt="women.01">
                </div>
                <div class="slide-box fade slide2">
                    <img src="${pageContext.request.contextPath}/image/women/bewakoof-com-official-mtOMSpOWxRI-unsplash.jpg" alt="women.02">
                </div>
                <div class="slide-box fade slide2">
                    <img src="${pageContext.request.contextPath}/image/women/corey-saldana-tKMBnca9ZEI-unsplash.jpg" alt="women.03">
                </div>
                <div class="slide-box fade slide2">
                    <img src="${pageContext.request.contextPath}/image/women/ilya-shishikhin-XJK3sSudLQg-unsplash.jpg" alt="women.04">
                </div>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</p>
            </article>

            <!-- KIDS 카테고리 섹션 -->
            <article class="slide-container back3">
                <div id="kids_link"></div>
                <h1 id="kids">KIDS</h1>
                <div class="slide-box fade slide3">
                    <img src="${pageContext.request.contextPath}/image/kids/boy-932116_1920.jpg" alt="kids.01">
                </div>
                <div class="slide-box fade slide3">
                    <img src="${pageContext.request.contextPath}/image/kids/camera-4921646_1920.jpg" alt="kids.02">
                </div>
                <div class="slide-box fade slide3">
                    <img src="${pageContext.request.contextPath}/image/kids/child-8228075_1920.jpg" alt="kids.03">
                </div>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</p>
            </article>

            <!-- SPORTS 카테고리 섹션 -->
            <article class="slide-container back4">
                <div id="sports_link"></div>
                <h1 id="sports" style="color:white;">SPORTS</h1>
                <div class="slide-box fade slide4">
                    <img src="${pageContext.request.contextPath}/image/sports/jc-gellidon-Q-tMKmr-1xI-unsplash.jpg" alt="sports.01">
                </div>
                <div class="slide-box fade slide4">
                    <img src="${pageContext.request.contextPath}/image/sports/sneaker-775699_1920.jpg" alt="sports.02">
                </div>
                <div class="slide-box fade slide4">
                    <img src="${pageContext.request.contextPath}/image/sports/shoes-1422650_1920.jpg" alt="sports.03">
                </div>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</p>
            </article>
        </section>
    </main>
    
    <footer>
        <p>아디다스코리아(유) | OOOOO OOO OOO OOO OOOO, OOOO OOO OO OOO (00000) | 대표자: OOO | 사업자 등록번호: 012-34-56789 | 통신판매업신고: 2000-서울서초-00000 | 개인정보관리책임자: OOO | 호스팅서비스사업자: 아디다스코리아(유) | 고객센터: 0000-1234 | 이메일: email1234@email1234.email.co.kr</p>
    </footer>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}';
	var slideIndex = [1, 1, 1, 1];
	var slideClasses = ["slide1", "slide2", "slide3", "slide4"];
	
	function showSlides() {
	    for (let j = 0; j < slideClasses.length; j++) {
	        var slides = document.getElementsByClassName(slideClasses[j]);
	        if (slides.length > 0) {
	            for (let i = 0; i < slides.length; i++) {
	                slides[i].style.display = "none";  
	            }
	            if (slideIndex[j] > slides.length) {slideIndex[j] = 1}    
	            slides[slideIndex[j] - 1].style.display = "block";  
	            slideIndex[j]++;
	        }
	    }
	    setTimeout(showSlides, 5000);
	}

	document.addEventListener("DOMContentLoaded", function() {
	    showSlides();
	});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/user.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/user_login.js"></script>
</body>
</html>
