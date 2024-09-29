<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

</head>
<body>
    <jsp:include page="../main/header.jsp"/>
    <div id="products">
        <!-- 상품 삭제 및 수정을 위한 form 추가 -->
        <form id="productForm" method="post" action="${pageContext.request.contextPath}/manager/productModifyForm.do">
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
                        <td><input type="checkbox" name="productIds" value="${productDTO.productId}"></td>
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

            <!-- 삭제 및 수정 버튼 -->
            <div id="buttonWrapper">
                <button type="button" id="deleteBtn">Delete</button>
                <button type="button" id="modifyBtn">Modify</button>
            </div>

            <!-- 페이지네이션 출력 -->
            <div id="paging" style="text-align: center; margin-top: 20px;">
           		${productPaging.pagingHTML}
        	</div>
        </form>
    </div>
    
    <footer id="footer"></footer>
<script>
	//전체 선택/해제 기능
	document.getElementById('allCheck').addEventListener('click', function() {
	    let checkboxes = document.querySelectorAll('input[name="productIds"]');
	    checkboxes.forEach(checkbox => checkbox.checked = this.checked);
	});
	
	// 개별 체크박스의 상태 변경 시 전체 선택 상태 업데이트
	let checkboxes = document.querySelectorAll('input[name="productIds"]');
	checkboxes.forEach(function(checkbox) {
	    checkbox.addEventListener('change', function() {
	        let allChecked = document.querySelectorAll('input[name="productIds"]:checked').length === checkboxes.length;
	        document.getElementById('allCheck').checked = allChecked;
	    });
	});

 	//삭제 버튼 클릭 시
    document.getElementById('deleteBtn').addEventListener('click', function() {
        let selectedItems = document.querySelectorAll('input[name="productIds"]:checked');
        if (selectedItems.length === 0) {
            alert('삭제할 항목을 선택하세요.');
            return;
        }

     //삭제 확인 메시지
        if (confirm('정말 삭제 하시겠습니까?')) {
            document.getElementById('productForm').action = "${pageContext.request.contextPath}/manager/productDelete.do";
            document.getElementById('productForm').submit();
        }
    });

    //수정 버튼 클릭 시
    document.getElementById('modifyBtn').addEventListener('click', function() {
        let selectedItems = document.querySelectorAll('input[name="productIds"]:checked');
        if (selectedItems.length === 0) {
            alert('수정할 항목을 선택하세요.');
            return;
        }

        if (selectedItems.length > 1) {
            alert('수정할 항목은 한 개만 선택하세요.');
            return;
        }
        document.getElementById('productForm').submit();
    });

 	//페이징 클릭 이벤트 처리
    function productPaging(pg) {
        const url = "${pageContext.request.contextPath}/manager/productListForm.do?pg=" + pg;
        location.href = url;
    }

    //페이징 번호 및 이전/다음 클릭 이벤트
    document.querySelectorAll('.paging').forEach(function(span) {
        span.addEventListener('click', function() {
            const pageNum = this.getAttribute('data-page');
            productPaging(pageNum); //페이지 이동
        });

    });
</script>
</body>
</html>
