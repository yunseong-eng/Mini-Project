<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/login.css">
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/main/header.jsp"/>
	<div id="user_login">
		<h2>로그인</h2>
		<form id="login_user">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td class="tag">아이디</td>
					<td>
						<input type="text" name="login_id" id="login_id" autofocus placeholder="아이디입력">
					</td>
				</tr>
				<tr>
					<td class="tag">비밀번호</td>
					<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호입력"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" id="loginBtn" class="bt_sty" value="로그인"/>
						<input type="button" class="bt_sty" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/user/writeForm.do'"/>
					</th>
				</tr>
			</table>
		</form>
		<div id="errorbox"></div>
	</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		var contextPath = '${pageContext.request.contextPath}';
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/user_login.js"></script>
</body>
</html>