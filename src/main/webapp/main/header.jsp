<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/header.css"/>
</head>
<body>

	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
    		<div class="modal-content">
    		</div>
    	</div>
   	</div>
   	
	<header>
		<a href="#" id="banner"><img class="banner_img" src="${ pageContext.request.contextPath }/image/Adidas-logo.png" alt="adidas.logo"></a>
		<nav id="main_menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/product/productList.do?category=MEN">MEN</a></li>
				<li><a href="${pageContext.request.contextPath}/product/productList.do?category=WOMEN">WOMEN</a></li>
				<li><a href="${pageContext.request.contextPath}/product/productList.do?category=KIDS">KIDS</a></li>
				<li><a href="${pageContext.request.contextPath}/product/productList.do?category=SPORTS">SPORTS</a></li>
				<c:if test="${ sessionScope.userId == 'admin' }">
				<li></li>
				<li></li>
				<li></li>
					<li><a href="${pageContext.request.contextPath }/manager/productWriteForm.do">ADD</a></li>
					<li><a href="${pageContext.request.contextPath }/manager/productListForm.do">LIST</a></li>
					<li><a href="${pageContext.request.contextPath }/manager/userListForm.do">USERS</a></li>
				</c:if>
			</ul>
		</nav>
		<div id="member">
		<form id="searchForm" method="get">
			<div id="searchBox">
				<input type="search" name="search" id="search" />
			</div>
			<div id="search_imgbox">
				<label for="search"><img src="${pageContext.request.contextPath }/image/search_icon.png"></label>
			</div>
		</form>
			<c:if test="${ sessionScope.userId == null }">
				<button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="openSignupModal()">Signup</button>
				<button type="button" onclick="location.href='${ pageContext.request.contextPath }/user/loginForm.do'">Login</button>
			</c:if>
			<c:if test="${ sessionScope.userId != null }">
				<button type="button" onclick="location.href='${ pageContext.request.contextPath }/user/myPage.do'">My Page</button>
				<button type="button" id="logoutBtn">Logout</button>
			</c:if>
		</div>
	</header>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<script type="text/javascript">
    function openSignupModal() {
        // 모달 콘텐츠 로딩
        fetch(contextPath + "/user/writeForm.do")
            .then(response => response.text())
            .then(html => {
                document.querySelector('.modal-content').innerHTML = html;
            });
    }

    document.addEventListener('DOMContentLoaded', function () {
        var modal = document.getElementById('exampleModal');
        modal.addEventListener('show.bs.modal', function (event) {
            document.getElementById('main_menu').style.paddingRight = '15px';
        });

        modal.addEventListener('hidden.bs.modal', function (event) {
            document.getElementById('main_menu').style.paddingRight = '0';
            window.location.reload(); // 페이지 새로고침
        });

        // 모달 열기 이벤트 바인딩
        document.querySelectorAll('[data-bs-toggle="modal"]').forEach(button => {
            button.onclick = openSignupModal;
        });
    });
	</script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script> 
		var contextPath = '${ pageContext.request.contextPath }';
	</script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/search.js"></script>
</body>
</html>