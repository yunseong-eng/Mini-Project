<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager.css">
<style>
main {
    margin-top: 70px; 
}
/* 페이지 전체 스타일 */
body {
    font-family: Arial, sans-serif;
}

/* 표 스타일 */
table {
    border-collapse: collapse;
    width: 95%; /* 전체 표 너비를 늘림 */
    margin: 0 auto; /* 표를 가운데 정렬 */
    font-size: 1.2rem; /* 글씨 크기를 조금 늘림 */
}

th, td {
    padding: 15px; /* 셀 간격을 조금 넓힘 */
    text-align: center;
    border: 1px solid #ddd;
}

th {
    background-color: #000;
    color: white;
}
/* 페이징 번호 간격 조정 */
.paging, #currentPaging {
    margin: 0 10px; /* 좌우 간격을 10px로 설정 */
    padding: 5px 10px; /* 패딩 추가로 간격 넓히기 */
    font-size: 1.2rem; /* 글씨 크기 조금 키움 */
    display: inline-block; /* 번호들을 가로로 정렬 */
}

/* 현재 페이지 스타일 */
#currentPaging {
    color: red; /* 현재 페이지 번호는 빨간색으로 표시 */
    font-weight: bold;
    text-decoration: underline;
}

/* 페이징 호버 스타일 */
.paging:hover {
    cursor: pointer;
    color: red; /* 호버 시에도 빨간색으로 변경 */
    text-decoration: underline; /* 호버 시 밑줄 표시 */
}

/* 열 너비 설정 */
th:nth-child(1), td:nth-child(1) { width: 10%; }  /* 아이디 */
th:nth-child(2), td:nth-child(2) { width: 15%; }  /* 성명 */
th:nth-child(3), td:nth-child(3) { width: 10%; }  /* 성별 */
th:nth-child(4), td:nth-child(4) { width: 20%; }  /* 이메일 */
th:nth-child(5), td:nth-child(5) { width: 20%; }  /* 전화번호 */
th:nth-child(6), td:nth-child(6) { width: 25%; }  /* 주소 (너비를 늘림) */
</style>
</head>
<body>
    <jsp:include page="../main/header.jsp"/>
    <div id="users">
    <main>
        <table>
            <tr>
                <th>아이디</th>
                <th>성명</th>
                <th>성별</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>주소</th>
            </tr>
            <c:forEach var="userDTO" items="${userList}">
                <tr>
                    <td>${userDTO.user_id}</td>
                    <td>${userDTO.name}</td>
                    <td>${userDTO.gender}</td>
                    <td>${userDTO.email1}@${userDTO.email2}</td> <!-- 이메일의 두 부분을 제대로 출력 -->
                    <td>${userDTO.tel1}-${userDTO.tel2}-${userDTO.tel3}</td>
                    <td>${userDTO.addr1} ${userDTO.addr2}</td>
                </tr>
            </c:forEach>
        </table>
	</main>
	
        <!-- 페이지네이션 출력 -->
        <div id="paging" style="text-align: center; margin-top: 20px;">
            ${userPaging.pagingHTML}
        </div>
    </div>
<script>
	// 페이징 클릭 이벤트 처리
	document.querySelectorAll('.paging').forEach(function(span) {
	    span.addEventListener('click', function() {
	        const pageNum = this.getAttribute('data-page');
	        userPaging(pageNum); // 페이지 이동 함수 호출
	    });
	});
	
	// 현재 페이지는 클릭 불가능하게 설정 (옵션)
	document.getElementById('currentPaging')?.addEventListener('click', function(event) {
	    event.preventDefault(); // 현재 페이지 클릭 시 이벤트 막음
	});
	
	// 페이징 이동 함수
	function userPaging(pageNum) {
	    const url = "${pageContext.request.contextPath}/manager/userListForm.do?pg=" + pageNum;
	    location.href = url; // 페이지 이동
	}
</script>
</body>
</html>
