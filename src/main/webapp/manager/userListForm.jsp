<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager.css">

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="products">
		<table>
			<tr>
				<th>아이디</th>
				<th>성명</th>
				<th>성별</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
			<c:foreach var="userDTO" item="${item }">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			</c:foreach>
			
		</table>
	</div>
	
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#header li').click(function(){
		
	})
});
</script>
</body>
</html>