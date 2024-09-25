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
	<header>
		<a href="#" id="banner"><img src="${ pageContext.request.contextPath }/image/Adidas-logo.png" alt="adidas.logo"></a>
		<nav id="main_menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/product/productList.do?category=MEN">MEN</a></li>
				<li><a href="${pageContext.request.contextPath}/product/productList.do?category=WOMEN">WOMEN</a></li>
				<li><a href="${pageContext.request.contextPath}/product/productList.do?category=KIDS">KIDS</a></li>
				<li><a href="${pageContext.request.contextPath}/product/productList.do?category=SPORTS">SPORTS</a></li>
				<c:if test="${ sessionScope.userId == 'admin' }">
					<li><a href="${pageContext.request.contextPath }/manager/productListFrom.do">회원관리</a></li>
					<li><a href="${pageContext.request.contextPath }/manager/productListFrom.do">전체상품관리</a></li>
					<li><a href="${pageContext.request.contextPath }/manager/productListFrom.do">상품등록</a></li>
				</c:if>
			</ul>
		</nav>
		<div id="member">
			<c:if test="${ sessionScope.userId == null }">
				<button type="button" onclick="location.href='${ pageContext.request.contextPath }/user/writeForm.do'">Signup</button>
				<button type="button" onclick="location.href='${ pageContext.request.contextPath }/user/loginForm.do'">Login</button>
			</c:if>
			<c:if test="${ sessionScope.userId != null }">
				<button type="button" onclick="location.href='${ pageContext.request.contextPath }/user/writeForm.do'">My Page</button>
				<button type="button" onclick="location.href='${ pageContext.request.contextPath }/user/loginForm.do'">Logout</button>
			</c:if>
		</div>
	</header>
</body>
</html>