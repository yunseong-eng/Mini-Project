<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/user.css">
</head>
<body>
	<jsp:include page="/main/header.jsp"/>
	<div id="mypage">
		<h2>마이페이지</h2>
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td class="tag">아이디</td>
					<td>
						<div id="user_id" name="user_id"></div>
					</td>
				</tr>
				<tr>
					<td class="tag">이름</td>
					<td><div name="name" id="name"></div></td>
				</tr>
				<tr>
					<td class="tag">휴대전화</td>
					<td>
						<div name="tel1" class="tel"></div> - 
	                	<div id="tel2" name="tel2" class="tel" > </div> - 
	                	<div id="tel3" name="tel3" class="tel" > </div>
	            	</td>
				</tr>
				<tr>
					<td class="tag">이메일</td>
					<td>
						<div name="email1" id="email1" > @ </div>
						<div name="email2" id="email2"></div>
					</td>
				</tr>
				<tr>
					<td class="tag">성별</td>
					<td>
						<div name="gender" class="radio">남자</div>
						<div name="gender" class="radio">여자</div>
					</td>
				</tr>
				<tr>
			    	<td class="tag">주소</td>
			    	<td>
			    		<div class="addr1" name="zipcode" id="zipcode"></div>
			    		<div class="addr2" name="addr1" id="addr1"></div><br>
			    		<div class="addr2" name="addr2" id="addr2"></div>
			    	</td>
			    </tr>
				<tr>
					<th colspan="2">
						<input type="button" id="signup_btn" class="bt_sty" value="회원정보수정">
					</th>
				</tr>
			</table>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		var contextPath = '${pageContext.request.contextPath}';
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/user.js">
	</script>
</body>
</html>