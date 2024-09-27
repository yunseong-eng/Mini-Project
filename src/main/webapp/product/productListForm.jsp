<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./header.css">
<link rel="stylesheet" href="./product.css">
</head>
<body>
	<jsp:include page="./header.jsp"/>
	
	<div id="title">
		스포츠 운동화
	</div>
	
	<div id="products">
	<c:if test="${ list != null }">
		<c:forEach var="item" items="${list }">
			<div class="product" id="${item.product_id }">
				<img alt="상품이미지" src="../image/${item.product_image }" id="img">
				<div class="priceDiv">
					<div class="price"><fmt:formatNumber pattern="#,###" value="${item.product_price }"/> 원</div>
				</div>
				<div id="detail">
					<div><p class="name">${item.product_name }</p><p class="like">♡</p></div>
					<div class="ctg">${item.product_description }</div>
				</div>
			</div>
		</c:forEach> 
	</c:if>
	</div>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$('.product').click(function(){
	
	var productId = $(this).attr('id')
	
	location.href="/adidas/product/productDetail.do?productId=" + productId;			
});
</script>
</body>
</html>