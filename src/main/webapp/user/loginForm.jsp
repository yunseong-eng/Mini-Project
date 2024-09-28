<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	<div id="loginUser" class="modal-header">
		<h2 class="modal-title fs-5" id="exampleModalLabel">로그인</h2>
		<button type="button" class="btn-close xbtn" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	
	<div class="modal-body formDiv2">
	<div id="user_login">
		<form id="login_user">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td class="tag">아이디</td>
					<td>
						<input type="text" name="login_id" id="login_id" placeholder="아이디입력">
					</td>
				</tr>
				<tr>
					<td class="tag">비밀번호</td>
					<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호입력"></td>
				</tr>
				<tr>
					<th colspan="2"><div id="errorbox"></div></th>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" id="loginBtn" class="bt_sty" value="로그인"/>
						<input type="button" class="bt_sty" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/user/writeForm.do'"/>
					</th>
				</tr>
			</table>
		</form>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		var contextPath = '${pageContext.request.contextPath}';
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/user_login.js"></script>
</body>
</html>