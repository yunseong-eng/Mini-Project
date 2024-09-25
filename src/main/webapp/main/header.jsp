<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/header.css"/>
</head>
<body>
	<header>
		<a href="#" id="banner"><img src="${ pageContext.request.contextPath }/image/pngegg.png" alt="adidas.logo"></a>
		<div id="member">
			<button type="button" onclick="location.href='${ pageContext.request.contextPath }/user/writeForm.do'">Signup</button>
			<button type="button" onclick="location.href='${ pageContext.request.contextPath }/user/loginForm.do'">Login</button>
		</div>
	</header>
	
	<nav id="main_menu">
		<ul>
			<li><a href="${pageContext.request.contextPath}/product/productList.do?category=MEN">MEN</a></li>
			<li><a href="${pageContext.request.contextPath}/product/productList.do?category=WOMEN">WOMEN</a></li>
			<li><a href="${pageContext.request.contextPath}/product/productList.do?category=KIDS">KIDS</a></li>
			<li><a href="${pageContext.request.contextPath}/product/productList.do?category=SPORTS">SPORTS</a></li>
		</ul>
	</nav>
</body>
</html>