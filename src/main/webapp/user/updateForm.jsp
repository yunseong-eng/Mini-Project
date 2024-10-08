<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<style type="text/css">
h2 {
	text-align: center;
	padding : 3rem 0;
	font-size: 2.5rem;
}
#updateForm {
	display: flex;
	flex-direction: column;
	justify-content: center;
}
</style>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/user.css">
</head>
<body>
	<jsp:include page="/main/header.jsp"/>
	<div id="updateForm">
		<h2>회원정보수정</h2>
		<input type="hidden" name="getpwd" id="getpwd" value="${userDTO.getPwd() }"/>
		<form id="update_user" action="${pageContext.request.contextPath }/user/update.do" method="post">
			<table>
				<tr>
					<td class="tag">아이디</td>
					<td>
						<input type="text" name="user_id" id="user_id" readonly value="${userDTO.getUser_id() }"/>
					</td>
				</tr>
				<tr>
					<td class="tag">이름</td>
					<td><input type="text" name="name" id="name" value="${userDTO.getName() }" placeholder="이름입력"></td>
				</tr>
				<tr>
					<td class="tag">비밀번호확인</td>
					<td><input type="password" name="checkpwd" id="checkpwd"placeholder="비밀번호입력"></td>
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
					<td class="tag">휴대전화</td>
					<td>
						<select name="tel1" class="tel">
	                		<optgroup>
			                    <option value="010" ${userDTO.getTel1() == '010' ? 'selected' : ''}>010</option>
						        <option value="011" ${userDTO.getTel1() == '011' ? 'selected' : ''}>011</option>
						        <option value="019" ${userDTO.getTel1() == '019' ? 'selected' : ''}>019</option>
			                </optgroup>
	           	 		</select>
	            	  - <input type="text" id="tel2" name="tel2" class="tel" size="4" maxlength="4" value="${userDTO.getTel2() }">
	            	  - <input type="text" id="tel3" name="tel3" class="tel" size="4" maxlength="4" value="${userDTO.getTel3() }">
	            	</td>
				</tr>
				<tr>
					<td class="tag">이메일</td>
					<td>
						<input type="text" name="email1" id="email1" value="${userDTO.getEmail1() }" placeholder="이메일입력"/> @
						<input type="text" name="email2" id="email2" value="${userDTO.getEmail2() }" />
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
						<label><input type="radio" name="gender" class="radio" value="man" ${userDTO.getGender() == 'man' ? 'checked' : '' }>남자</label>
						<label><input type="radio" name="gender" class="radio" value="woman" ${userDTO.getGender() == 'woman' ? 'checked' : '' }>여자</label>
					</td>
				</tr>
				<tr>
			    	<td class="tag">주소</td>
			    	<td>
			    		<input type="text" class="addr1" name="zipcode" id="zipcode" size="6" value="${userDTO.getZipcode() }" readonly placeholder="우편번호">
			    		<button type="button" class="addr1_btn" onclick="checkPost(); return false;">우편번호 검색</button><br>
			    		<input type="text" class="addr2" name="addr1" id="addr1" size="60" value="${userDTO.getAddr1() }" readonly placeholder="주소"><br>
			    		<input type="text" class="addr2" name="addr2" id="addr2" size="60" value="${userDTO.getAddr2() }" placeholder="상세주소">
			    	</td>
			    </tr>
			    <tr>
			    	<th colspan="2"><div id="errorbox"></div></th>
			    </tr>
				<tr>
					<th colspan="2" id="bt_sty">
						<input type="button" id="update_Btn" class="bt_sty" value="수정완료" />
						<input type="reset" id="reset_btn" class="bt_sty" value="다시작성">
						<input type="button" id="delete_user" class="bt_sty" value="회원탈퇴">
					</th>
				</tr>
			</table>
		</form>
		
	</div>
	
	<footer id="footer"></footer>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		var contextPath = '${pageContext.request.contextPath}';
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/updateUser.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>