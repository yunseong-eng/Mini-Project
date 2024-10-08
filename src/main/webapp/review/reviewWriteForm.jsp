<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/product/product.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
    <jsp:include page="../main/header.jsp"/>

    <div id="reviewWriteTitle">상품후기</div>
    <c:if test="${order != null}">
        <div id="productDetail">
        	<div id="history"></div>
            <div class="img">
                <img alt="상품 이미지" src="${pageContext.request.contextPath}/${order.productImage}"/>
            </div>
            
            <div class="productDetail">
            	<div id="ctg"></div>
                <div id="name">${order.productName}</div>
				<div id="reviewWriteForm">
		            <form action="${pageContext.request.contextPath}/review/writeReview.do" method="post">
		                <input type="hidden" name="productId" value="${order.productId}">            
		                <label for="reviewContent">상품 후기</label><br>
		                <textarea id="reviewContent" name="reviewContent" rows="5" required></textarea><br><br>
		
		                <button type="submit">후기작성</button>
		            </form>
	            </div>
            </div>

        </div>
    </c:if>
    
    <footer id="footer"></footer>
</body>
</html>
