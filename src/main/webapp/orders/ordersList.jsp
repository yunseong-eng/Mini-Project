<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 목록</title>
<style>
main {
	margin-top: 70px; /* 헤더와 테이블 사이의 간격 */
}
/* 테이블 스타일 */
table {
    border-collapse: collapse;
    width: 80%; /* 표 크기를 줄임 */
    margin: 0 auto; /* 표를 중앙에 정렬 */
    border-radius: 13px; /* 테두리의 모서리를 둥글게 */
    overflow: hidden; /* 둥근 모서리가 적용되도록 설정 */
    font-size: 2.0rem; /* 글씨 크기를 키움 */
    font-family: 'Arial', sans-serif; /* 전체적으로 Arial 폰트 적용 */
}

/* 테이블 내부 셀 스타일 */
th, td {
    border: 1px solid #ddd;
    text-align: center;
    padding: 12px; /* 셀의 내부 여백을 늘림 */
    font-family: 'Arial', sans-serif; /* Arial 폰트 적용 */
    font-size: 1.5rem; /* 글씨 크기를 키움 */
}

/* 테이블 헤더 스타일 */
th {
    background-color: black;
    color: white;
}

/* 리뷰 버튼 스타일 */
.review-button {
    background-color: black;
    color: white;
    border: none;
    padding: 8px 15px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-family: 'Arial', sans-serif; /* 버튼에도 Arial 폰트 적용 */
    font-size: 1.6rem; /* 버튼 글씨 크기 */
    border-radius: 5px; /* 버튼 모서리도 둥글게 */
}

.review-button:hover {
    background-color: #505050; /* 배경색을 #505050으로 변경 */
    color: white; /* 글자색 흰색 유지 */
}
/* 제목 */
tr.header-row th {
    font-size: 1.7rem; /* 원하는 글자 크기로 설정 */
    font-weight: bold; /* 글자를 굵게 */
}
</style>
</head>
<body>
    <jsp:include page="/main/header.jsp"/>
    <main>
        <c:if test="${not empty orderList}">
            <table>
                <tr class="header-row">
                    <th>IMAGE</th>
                    <th>NAME</th>
                    <th>DATE</th>
                    <th>REVIEW</th>
                </tr>
                <c:forEach var="order" items="${orderList}">
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/${order.productImage}" alt="${order.productName}" style="width: 100px; height: 100px;"></td>
                        <td>${order.productName}</td>
                        <td><fmt:formatDate value="${order.logtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><button class="review-button" onclick="location.href='${pageContext.request.contextPath}/review/reviewWriteForm.do?orderId=${order.orderId}'">후기 등록</button></td>
                    </tr>
                </c:forEach>
            </table> 
        </c:if>
        </main>   
        <c:if test="${empty orderList}">
            <p>구매 내역이 없습니다.</p>
        </c:if>
</body>
</html>
