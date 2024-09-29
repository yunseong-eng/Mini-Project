<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<style>
main {
    margin-top: 30px; /* 헤더와 폼 사이에 공간 추가 */
}
/* 상품 수정 폼 크기를 줄이기 위한 스타일 */
form {
    width: 50%; /* 폼의 가로 크기를 줄임 */
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    text-align: left;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 2rem;
}

table th, table td {
    padding: 10px; /* 세로 공간을 줄임 */
    font-size: 1.2rem; /* 글씨 크기를 약간 줄임 */
    text-align: left;
    border: 1px solid #ddd;
}

table th {
    background-color: #f2f2f2;
    width: 30%; /* 레이블의 너비 설정 */
}

table td {
    width: 70%; /* 입력 필드의 너비 설정 */
}

input[type="text"], input[type="number"], textarea {
    width: 95%;
    height: 3rem;
    font-size: 1.4rem;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

textarea {
    resize: none;
    height: 20rem; /* 세로 길이 추가 */
}

input[type="file"] {
    width: 95%;
    font-size: 1.4rem;
    padding: 5px;
}

img {
    margin-top: 10px;
    max-width: 100px;
    max-height: 100px;
    display: block;
}

input[type="submit"] {
    width: 30%;
    height: 3.5rem;
    font-size: 1.6rem;
    background-color: #000;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-align: center;
    margin-left: 70%;
}

input[type="submit"]:hover {
    background-color: #333;
}
header {
    width: 100%;
    display: flex;
    align-items: flex-start; /* 이미지가 더 위로 올라가도록 수정 */
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
}

header img {
    width: 100px;
    height: 80px; /* 이미지 높이를 살짝 줄임 */
    object-fit: contain;
    margin-left: 20px;
    margin-top: -7px; /* 이미지 위로 살짝 올라가도록 마이너스 마진 추가 */
}
</style>
<script>
    //이미지 미리보기 기능
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
                document.getElementById('preview').style.display = 'block';
            };
            reader.readAsDataURL(input.files[0]); // 선택한 파일을 읽어 미리보기를 준비
        }
    }
</script>
</head>
<body>
    <jsp:include page="../main/header.jsp"/>
    <main>
    <form method="post" action="${pageContext.request.contextPath}/manager/productModifySubmit.do" enctype="multipart/form-data">
         <table>
            <tr>
                <th>상품명</th>
                <td><input type="text" name="productName" value="${productDTO.productName}" required></td>
            </tr>
            <tr>
                <th>가격</th>
                <td><input type="text" name="productPrice" value="${productDTO.productPrice}" required></td>
            </tr>
            <tr>
                <th>수량</th>
                <td><input type="number" name="productQty" value="${productDTO.productQty}" required></td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td>
               	<select name="ctg" id="ctg" value="${productDTO.ctg}" required>
	                <option value="MEN">MEN</option>
	                <option value="WOMEN">WOMEN</option>
	                <option value="KIDS">KIDS</option>
	                <option value="SPORTS">SPORTS</option>
                </select>
                </td>
            </tr>
            <tr>
                <th>상품 설명</th>
                <td><textarea name="productDescription" required>${productDTO.productDescription}</textarea></td>
            </tr>
            <tr>
                <th>상품 이미지</th>
                <td>
                    <!-- 기존 이미지 표시 -->
                    <img id="preview" src="${pageContext.request.contextPath}/${productDTO.productImage}" alt="${productDTO.productName}" width="100" height="100"><br>
                    <!-- 새 이미지를 선택하지 않으면 기존 이미지 유지 -->
                    <input type="file" name="productImage" onchange="previewImage(this)">
                </td>
            </tr>
         </table>
        <!-- Hidden 필드에 Product ID를 추가 -->
        <input type="hidden" name="productId" value="${productDTO.productId}">
        <input type="submit" value="수정 완료">
    </form>
    </main>
    
    <footer id="footer"></footer>
</body>
</html>