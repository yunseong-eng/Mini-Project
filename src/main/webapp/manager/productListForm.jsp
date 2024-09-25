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
				<th><input type="checkbox" id="all"> <label for="all">전체선택</label></th>
				<th>카테고리</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>가격</th>
				<th>개수</th>
				<th>조회수</th>
				<th>후기수</th>
				<th>등록날짜</th>
			</tr>
<%-- 			<c:foreach var="productDTO" item="${item }"> --%>
			<tr>
				<td><input type="checkbox" id="${product_id}" class="checkBox"> <label for="${product_id}">1</label></td>
				<td>men</td>
				<td><img alt="" src="../stroge/${456 }"/></td>
				<td>아디다스 신발</td>
				<td>100,000 원</td>
				<td>50</td>
				<td>150</td>
				<td>50</td>
				<td>2024.09.24</td>
			</tr>
<%-- 			</c:foreach> --%>
			
			<tr>
				<td colspan="9">
				<input type="submit" value="선택삭제" id="deleteBtn"/>
				<div id="page">
					1 2 3 [다음]${pagingHTML}
				</div>
				</td>
			</tr>
		</table>
	</div>
	
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#all-products').attr('class', 'clickCtg')
});
</script>
</body>
</html>