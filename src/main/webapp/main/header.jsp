<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
    		<div class="modal-content">
    		</div>
    	</div>
   	</div>
   	
<div id="topBack"></div>

<div id="member">
	<c:if test="${ sessionScope.userId == null }">
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/writeForm.do'">Signup</button>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/loginForm.do'">Login</button>
	</c:if>
	<c:if test="${ sessionScope.userId != null }">
		<button type="button" onclick="location.href='${ pageContext.request.contextPath }/user/myPage.do'">My Page</button>
		<button type="button" id="logoutBtn">Logout</button>
	</c:if>
</div>

<div id="header">
	<div class="img"><img alt="adidas" src="${pageContext.request.contextPath}/image/Adidas-logo.png" onclick="location.href='${pageContext.request.contextPath }/index.do'"></div>
	<div class="nav">
	<div id="nav">
		<ul>
			<li id="men"><a href="${pageContext.request.contextPath }/product/listForm.do?ctg=MEN">MEN</a></li>
			<li id="women"><a href="${pageContext.request.contextPath }/product/listForm.do?ctg=WOMEN">WOMEN</a></li>
			<li id="kids"><a href="${pageContext.request.contextPath }/product/listForm.do?ctg=KIDS">KIDS</a></li>
			<li id="sports"><a href="${pageContext.request.contextPath }/product/listForm.do?ctg=SPORTS">SPORTS</a></li>
		</ul>
	</div>
	<c:if test="${ sessionScope.userId == 'admin' }">
	<div id="nav" class="managerNav">
		<ul>
			<li><a href="${pageContext.request.contextPath }/manager/productWriteForm.do">ADD</a></li>
			<li><a href="${pageContext.request.contextPath }/manager/productListForm.do">LIST</a></li>
			<li><a href="${pageContext.request.contextPath }/manager/userListForm.do">USERS</a></li>
		</ul>
	</div>
	</c:if>
	</div>
	
	<div class="searchForm">
		<form id="searchForm" method="get">
			<div id="searchBox">
				<input type="text" name="search" id="search" />
			</div>
			<div id="search_imgbox">
				<label for="search"><img src="${pageContext.request.contextPath }/image/search_icon.png"></label>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script> 
	var contextPath = '${ pageContext.request.contextPath }';
</script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/search.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/user.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/user_login.js"></script>