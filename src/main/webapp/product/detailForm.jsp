<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<c:if test="${ dto != null }">
		
	<div id="productDetail">
		<div id="history"><a href="${pageContext.request.contextPath }/index.do">Home</a> / <a href="${pageContext.request.contextPath }/product/listForm.do?ctg=${dto.ctg }">${dto.ctg }</a></div>

		<div class="img">
			<img alt="상품이미지" src="../image/${dto.productImage }" id="img">
		</div>
		
		<div class="productDetail">
			<div id="ctg">
				<span>${dto.ctg }</span>
				<span>조회수 ${dto.hit}</span>
			</div>
			
			<div id="name">${dto.productName }</div>
			<div id="price"><fmt:formatNumber pattern="#,###" value="${dto.productPrice }"/> 원<br></div>				
			
			<div id="color">
				<h4>컬러</h4>
				<p>${dto.productDescription }</p>
			</div>
			
			<div id="size">
				<h4>구입 가능한 사이즈</h4>
				<table>
					<c:set var="ranges" value="${'220,240;245,265;270,290;295,315'}" />
				    <c:forEach var="range" items="${fn:split(ranges, ';')}">
				        <tr>
				            <c:set var="limits" value="${fn:split(range, ',')}" />
				            <c:forEach var="i" begin="${limits[0]}" end="${limits[1]}" step="5">
				                <td id="${i }"><input type="button" name="size" value="${i}" class="size"/></td>
				            </c:forEach>
				        </tr>
				    </c:forEach>
				</table>
			</div>
			
			<div id="buyBtn">
				<input type="button" value="구매하기"/>
			</div>
		</div>
	</div>
		
	<div id="review">
		<div id="reviewTitle">리뷰 (${dto.reply})</div>
		<div class="review">
			<div class="name"><p>★★★★★</p><p>신짱구</p></div>
			<div id="content">
				<div class="title"><span>좋아요</span><span>2024년 9월 22일</span></div>
				<div class="content"><p>wlfjweiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii</p></div>
			<div class="like">좋아요 3</div>
			</div>
		</div>
		<div class="review">
			<div class="name"><p>★★★★★</p><p>신짱구</p></div>
			<div id="content">
				<div class="title"><span>좋아요</span><span>2024년 9월 22일</span></div>
				<div class="content"><p>wlfjweiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii</p></div>
				<div class="like">좋아요 3</div>
			</div>
		</div>

	</div>
	</c:if>
	
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$('.size').click(function(){
	$(this).addClass('sizeClick');
	$('.size').not(this).removeClass('sizeClick');
})
</script>
</body>
</html>