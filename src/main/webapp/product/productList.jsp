<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Adidas Products - ${category}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
</head>
<body>
    <header>
        <a href="${pageContext.request.contextPath}/index.jsp" id="logo">
            <img src="${pageContext.request.contextPath}/image/logo.jpg" alt="Adidas Logo">
        </a>
    </header>
    
    <main>
        <h1>${category}</h1>
        <div class="product-grid">
            <c:forEach var="product" items="${products}">
                <article class="product-item">
                    <img src="${pageContext.request.contextPath}/${product.productImage}" alt="${product.productName}">
                    <h3>${product.productName}</h3>
                    <p>${product.productPrice}원</p>
                </article>
            </c:forEach>
        </div>
    </main>
    
    <footer>
        <p>Adidas Korea | All rights reserved.</p>
    </footer>
</body>
</html>
