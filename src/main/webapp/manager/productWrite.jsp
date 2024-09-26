<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 완료</title>
</head>
<body>
<script type="text/javascript">
    alert("상품이 성공적으로 등록되었습니다.");
    location.href = "${pageContext.request.contextPath}/manager/productListForm.do";  // 전체 목록 페이지로 이동
</script>
</body>
</html>
