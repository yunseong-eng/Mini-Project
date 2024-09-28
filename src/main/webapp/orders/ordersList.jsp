<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 목록</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid #ddd;
        text-align: center;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
    .review-button {
        background-color: black;
        color: white;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .review-button:hover {
        background-color: gray;
        color: black;
    }
</style>
</head>
<body>
    <jsp:include page="/main/header.jsp"/>

    <div id="ordersList">
        <h2>구매 목록</h2>
        <c:if test="${not empty orderList}">
            <table>
                <tr>
                    <th>상품 이미지</th>
                    <th>상품 이름</th>
                    <th>상품 개수</th>
                    <th>주문 날짜</th>
                    <th>후기 등록하기</th>
                </tr>
                <c:forEach var="order" items="${orderList}">
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/${order.productImage}" alt="${order.productName}" style="width: 100px; height: 100px;"></td>
                        <td>${order.productName}</td>
                        <td>${order.productQty}</td>
                        <td><fmt:formatDate value="${order.logtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><button class="review-button" onclick="location.href='${pageContext.request.contextPath}/review/reviewWriteForm.do?orderId=${order.orderId}'">후기 등록</button></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${empty orderList}">
            <p>구매 내역이 없습니다.</p>
        </c:if>
    </div>
</body>
</html>
