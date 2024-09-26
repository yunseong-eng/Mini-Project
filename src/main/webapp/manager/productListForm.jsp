<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager.css">
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }

    #paging span {
        padding: 5px 10px;
        margin: 5px;
        cursor: pointer;
    }

    #currentPaging {
        font-weight: bold;
        color: red;
    }

    #paging span:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <jsp:include page="../menu/header.jsp"/>
    <div id="products">
        <table>
            <tr>
                <th><input type="checkbox" id="allCheck"> <label for="allCheck">전체선택</label></th>
                <th>카테고리</th>
                <th>이미지</th>
                <th>상품명</th>
                <th>가격</th>
                <th>개수</th>
                <th>조회수</th>
                <th>후기수</th>
                <th>등록날짜</th>
            </tr>

            <!-- 상품 리스트 출력 -->
            <c:forEach var="productDTO" items="${productList}">
                <tr>
                    <td><input type="checkbox" name="selectItem" class="checkBox" value="${productDTO.productId}"></td>
                    <td>${productDTO.ctg}</td>
                    <td><img alt="${productDTO.productName}" src="${pageContext.request.contextPath}/${productDTO.productImage}" width="100" height="100"/></td>
                    <td>${productDTO.productName != null ? productDTO.productName : 'N/A'}</td>
                    <td><fmt:formatNumber value="${productDTO.productPrice != null ? productDTO.productPrice : 0}" pattern="#,###"/> 원</td>
                    <td>${productDTO.productQty != null ? productDTO.productQty : 0}</td>
                    <td>${productDTO.hit}</td>
                    <td>${productDTO.reply}</td>
                    <td><fmt:formatDate value="${productDTO.logtime}" pattern="yyyy-MM-dd HH:mm"/></td>
                </tr>
            </c:forEach>
        </table>

        <!-- 페이지네이션 출력 -->
        <div id="paging" style="text-align: center; margin-top: 20px;">
            ${productPaging.pagingHTML}
        </div>
    </div>

<script>
    // 전체 선택/해제 기능
    document.getElementById('allCheck').addEventListener('click', function() {
        let checkboxes = document.querySelectorAll('input[name="selectItem"]');
        for (let checkbox of checkboxes) {
            checkbox.checked = this.checked;
        }
    });

    // 개별 선택이 변경될 때마다 전체 선택 상태를 업데이트
    function updateAllCheck() {
        let checkboxes = document.querySelectorAll('input[name="selectItem"]');
        let allChecked = document.querySelectorAll('input[name="selectItem"]:checked').length === checkboxes.length;
        document.getElementById('allCheck').checked = allChecked;
    }

    let checkboxes = document.querySelectorAll('input[name="selectItem"]');
    for (let checkbox of checkboxes) {
        checkbox.addEventListener('change', updateAllCheck);
    }

    // 페이징 클릭 이벤트 처리
    function productPaging(pg) {
        location.href = "${pageContext.request.contextPath}/manager/productListForm.do?pg=" + pg;
    }

    // 페이징 번호 클릭 이벤트 추가
    document.querySelectorAll('#paging span').forEach(function(span) {
        span.addEventListener('click', function() {
            const pageNum = this.textContent;
            productPaging(pageNum); // 페이지 이동
        });
    });
</script>
</body>
</html>
