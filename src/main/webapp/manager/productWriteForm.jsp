<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD</title>
<link rel="stylesheet" href="./header.css">
<style>
/* 폼을 중앙에 정렬하는 CSS */
main {
    width: 60%;
    max-width: 800px;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    text-align: left;
    margin: 0 auto; /* 수평 중앙 정렬 */
    margin-top: 70px; /* 헤더 아래에 충분한 여백을 줌 */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center; /* 내부 내용도 중앙 정렬 */
    font-family: 'Arial', sans-serif;
}

/* 폼 설정 */
form#productWriteForm {
    width: 100%;
    margin: 0 auto; /* 폼을 수평 중앙 정렬 */
    display: block; /* 기본 블록 레이아웃 유지 */
}

/* 테이블 스타일 */
form#productWriteForm table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 2rem;
}

form#productWriteForm table th, 
form#productWriteForm table td {
    padding: 15px;
    font-size: 1.5rem;
    text-align: left;
    border: 1px solid #ddd;
}

form#productWriteForm table th {
    background-color: #f2f2f2;
    width: 30%;
    font-weight: bold;
    text-align: center; /* 제목 가운데 정렬 */
}

form#productWriteForm table td {
    width: 70%;
}

/* 입력 필드 스타일 */
form#productWriteForm input[type="text"], 
form#productWriteForm input[type="number"], 
form#productWriteForm select, 
form#productWriteForm textarea {
    width: 100%; /* 전체 폭을 넉넉히 사용 */
    height: 4rem;
    font-size: 1.4rem;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-family: 'Arial', sans-serif;
}

form#productWriteForm select {
    font-size: 1.2rem;
}

form#productWriteForm textarea {
    resize: none;
    height: 15rem;
}

/* 파일 선택 필드 */
form#productWriteForm input[type="file"] {
    width: 100%;
    font-size: 1.6rem;
    padding: 5px;
}

/* 버튼 스타일 */
form#productWriteForm input[type="submit"] {
    width: 100%;
    max-width: 130px; /* 버튼 크기 제한 */
    height: 4rem;
    font-size: 1.6rem;
    background-color: #000;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

form#productWriteForm input[type="submit"]:hover {
    background-color: #505050; 
}

/* 이미지 미리보기 */
#preview {
    width: 100px;
    height: 100px;
    margin-top: 10px;
    border: 1px solid #ccc;
    object-fit: cover;
    display: none;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
    <main>
        <form id="productWriteForm" method="post" enctype="multipart/form-data" 
              action="${ pageContext.request.contextPath }/manager/productWrite.do">
            <table>
                <tr>
                    <th>상품명</th>
                    <td><input type="text" id="productName" name="productName" size="50" required></td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td><input type="text" id="productPrice" name="productPrice" required></td>
                </tr>
                <tr>
                    <th>수량</th>
                    <td><input type="number" id="productQty" name="productQty" required></td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>
                        <select name="ctg" id="ctg" required>
                            <option value="MEN">MEN</option>
                            <option value="WOMEN">WOMEN</option>
                            <option value="KIDS">KIDS</option>
                            <option value="SPORTS">SPORTS</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>상품 설명</th>
                    <td><textarea name="productDescription" id="productDescription" rows="5" cols="50"></textarea></td>
                </tr>
                <tr>
                    <th>상품 이미지</th>
                    <td>
                        <input type="file" name="productImage" id="productImage" required>
                        <img id="preview" src="" alt="미리보기 이미지" style="display:none;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="상품 등록" style="float: right;">
                    </td>
                </tr>
            </table>
        </form>
    </main>

    <script>
        //이미지 미리보기 기능 추가
        document.getElementById("productImage").addEventListener("change", function(event) {
            const file = event.target.files[0];

            //파일이 없으면 미리보기 이미지 숨김
            if (!file) {
                document.getElementById("preview").style.display = "none";
                return;
            }

            //파일이 이미지가 아니면 경고
            if (!file.type.startsWith("image/")) {
                alert("이미지 파일을 선택해주세요.");
                document.getElementById("preview").style.display = "none";
                return;
            }

            const reader = new FileReader();
            reader.onload = function() {
                const preview = document.getElementById("preview");
                preview.src = reader.result;
                preview.style.display = "block";
            };
            reader.readAsDataURL(file);
        });
    </script>
</body>
</html>