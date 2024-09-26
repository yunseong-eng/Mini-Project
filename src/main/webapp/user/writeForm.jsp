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
	<div id="user_signup">
		<h2>회원가입</h2>
		<form id="signup_user">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td class="tag">아이디</td>
					<td>
						<input type="text" name="user_id" id="user_id" autofocus placeholder="아이디입력">
						<input type="hidden" id="check" value="">
						<div id="checkidbox" style="margin-bottom: 1.3rem"></div>
					</td>
				</tr>
				<tr>
					<td class="tag">비밀번호</td>
					<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호입력"></td>
				</tr>
				<tr>
					<td class="tag">비밀번호확인</td>
					<td><input type="password" name="repwd" id="repwd" placeholder="비밀번호재확인"></td>
				</tr>
				<tr>
					<td class="tag">이름</td>
					<td><input type="text" name="name" id="name" placeholder="이름입력"></td>
				</tr>
				<tr>
					<td class="tag">휴대전화</td>
					<td>
						<select name="tel1" class="tel">
	                		<optgroup>
			                    <option value="010">010</option>
			                    <option value="011">011</option>
			                    <option value="019">019</option>
			                </optgroup>
	           	 		</select>
	            	  - <input type="text" id="tel2" name="tel2" class="tel" size="4" maxlength="4">
	            	  - <input type="text" id="tel3" name="tel3" class="tel" size="4" maxlength="4">
	            	</td>
				</tr>
				<tr>
					<td class="tag">이메일</td>
					<td>
						<input type="email" name="email1" id="email1" placeholder="이메일입력"/> @
						<input type="text" name="email2" id="email2"/>
						<select id="email3_list">
			        		<option value="type">직접입력</option>
			                <option value="naver.com">naver.com</option>
			                <option value="gmail.com">gmail.com</option>
			                <option value="daum.net">daum.net</option>
			        	</select>
					</td>
				</tr>
				<tr>
					<td class="tag">성별</td>
					<td class="gender_td">
						<label><input type="radio" name="gender" class="radio" value="man" checked>남자</label>
						<label><input type="radio" name="gender" class="radio" value="woman">여자</label>
					</td>
				</tr>
				<tr>
			    	<td class="tag">주소</td>
			    	<td>
			    		<input type="text" class="addr1" name="zipcode" id="zipcode" size="6" readonly placeholder="우편번호">
			    		<button type="button" class="addr1_btn" onclick="checkPost(); return false;">우편번호 검색</button><br>
			    		<input type="text" class="addr2" name="addr1" id="addr1" size="60" readonly placeholder="주소"><br>
			    		<input type="text" class="addr2" name="addr2" id="addr2" size="60" placeholder="상세주소">
			    	</td>
			    </tr>
				<tr>
					<th colspan="2">
						<input type="button" id="signup_btn" class="bt_sty" value="회원가입">
						<input type="reset" id="reset_btn" class="bt_sty" value="다시작성">
					</th>
				</tr>
			</table>
		</form>
		<div id="errorbox"></div>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="../js/user.js">
	</script>
	
</body>
</html>