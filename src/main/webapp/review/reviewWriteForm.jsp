<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기작성</title>
<link rel="stylesheet" href="./header.css">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

#container {
    display: flex;
    justify-content: flex-start; /* 왼쪽 정렬 */
    align-items: flex-start;
    margin: 20px;
}

#leftSection {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 50%;
    margin: 0;
    padding: 0;
}

.img {
    text-align: center;
    margin: 0;
    padding: 0;
}

.img img {
	margin-top: 50px;
    width: 300px;
    height: 400px;
    object-fit: cover;
    border: 1px solid #ddd;
    border-radius: 10px;
    margin: 0; /* 이미지의 여백 제거 */
    padding: 0;
}

.productDetail {
    margin-top: 10px;
    text-align: center;
}

#name {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
    text-align: center;
}

#rightSection {
	margin-top: 70px;
    width: 25%; /* 폼 크기는 유지 */
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    margin-left: -100px; /* 이미지와 폼 사이 간격 완전히 붙이기 */
}

#rightSection h2 {
    font-size: 22px;
    margin-bottom: 15px;
    text-align: left;
}

#rightSection textarea {
    width: 100%;
    height: 250px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}

#rightSection button {
    background-color: #000;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    float: right;
}

#rightSection button:hover {
    background-color: #333;
}
</style>
</head>
<body>
    <jsp:include page="/main/header.jsp"/>

    <c:if test="${order != null}">
        <div id="container">
            <!-- 왼쪽 섹션: 제품 이미지와 이름 -->
            <div id="leftSection">
                <div class="img">
                    <img alt="상품 이미지" src="${pageContext.request.contextPath}/${order.productImage}">
                </div>
                <div class="productDetail">
                    <div id="name">${order.productName}</div>
                </div>
            </div>

            <!-- 오른쪽 섹션: 리뷰 작성 폼 -->
            <div id="rightSection">
                <h2>Writing reviews</h2>
                <form action="${pageContext.request.contextPath}/review/writeReview.do" method="post">
                    <input type="hidden" name="productId" value="${order.productId}">            
                    <label for="reviewContent"></label><br>
                    <textarea id="reviewContent" name="reviewContent" rows="5" required></textarea><br><br>

                    <button type="submit">후기작성</button>
                </form>
            </div>
        </div>
    </c:if>
</body>
</html>
