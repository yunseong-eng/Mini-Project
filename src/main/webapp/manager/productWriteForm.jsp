<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main.css">
<style>
    body {
        background-color: #f0f0f0; /* 밝은 배경색으로 변경 */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    main {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    table {
        margin: 0 auto;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    input[type="submit"] {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    #preview {
        margin-top: 10px;
        display: block;
        width: 100px;
        height: 100px;
        object-fit: cover;
    }

</style>
</head>
<body>
    <header>
        <h1 style="text-align:center;">상품 등록</h1>
    </header>

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
                    <td><input type="number" id="productPrice" name="productPrice" required></td>
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
                        <input type="submit" value="상품 등록">
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
