<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>adidas</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
    <header>
        <a href="#" id="banner"><img src="${pageContext.request.contextPath}/image/pngegg.png" alt="adidas.logo"></a>
        <div id="member">
            <button type="button" onclick="location.href='signup.html'">Signup</button>
            <button type="button" onclick="location.href='login.html'">Login</button>
        </div>
    </header>
    
    <nav id="main_menu">
        <ul>
            <li><a href="#men_link">MEN</a></li>
            <li><a href="#women_link">WOMEN</a></li>
            <li><a href="#kids_link">KIDS</a></li>
            <li><a href="#sports_link">SPORTS</a></li>
        </ul>
    </nav>
    
    <main>
        <section>
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
            </article>
            
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
            </article>
            
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
            </article>
            
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
            </article>
        </section>
    </main>
    
    <footer>
        <p>아디다스코리아(유) | OOOOO OOO OOO OOO OOOO, OOOO OOO OO OOO (00000) | 대표자: OOO | 사업자 등록번호: 012-34-56789 | 통신판매업신고: 2000-서울서초-00000 | 개인정보관리책임자: OOO | 호스팅서비스사업자: 아디다스코리아(유) | 고객센터: 0000-1234 | 이메일: email1234@email1234.email.co.kr</p>
    </footer>
    
<script type="text/javascript">
var slideIndex1 = 0;
var slideIndex2 = 0;
var slideIndex3 = 0;
var slideIndex4 = 0;
showSlides();

function showSlides() {
    var slide1 = document.getElementsByClassName("slide1");
    var slide2 = document.getElementsByClassName("slide2");
    var slide3 = document.getElementsByClassName("slide3");
    var slide4 = document.getElementsByClassName("slide4");
   
    for (let i=0; i<slide1.length; i++) {
        slide1[i].style.display = "none";
    }
    slideIndex1++;
    for (let i=0; i<slide2.length; i++) {
        slide2[i].style.display = "none";
    }
    slideIndex2++;
    for (let i=0; i<slide3.length; i++) {
        slide3[i].style.display = "none";
    }
    slideIndex3++;
    for (let i=0; i<slide4.length; i++) {
        slide4[i].style.display = "none";
    }
    slideIndex4++;
    
    if (slideIndex1 > slide1.length) { slideIndex1 = 1 }
    slide1[slideIndex1 - 1].style.display = "block";
    
    if (slideIndex2 > slide2.length) { slideIndex2 = 1 }
    slide2[slideIndex2 - 1].style.display = "block";
    
    if (slideIndex3 > slide3.length) { slideIndex3 = 1 }
    slide3[slideIndex3 - 1].style.display = "block";
    
    if (slideIndex4 > slide4.length) { slideIndex4 = 1 }
    slide4[slideIndex4 - 1].style.display = "block";
 
    setTimeout(showSlides, 5000);
}
</script>
</body>
</html>
