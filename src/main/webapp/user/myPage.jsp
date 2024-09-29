<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
    <jsp:include page="/main/header.jsp"/>
    <div id="mypage">
        <h2>마이페이지</h2>
            <table border="1" style="border-collapse: collapse;">
                <tr>
                    <td class="tag">아이디</td>
                    <td>
                        <div id="user_id">${userDTO.getUser_id() }</div>
                        <input type="hidden" id="user_id" name="user_id" value="${userDTO.getUser_id() }"/>
                    </td>
                </tr>
                <tr>
                    <td class="tag">이름</td>
                    <td><div id="name">${userDTO.getName() }</div></td>
                </tr>
                <tr>
                    <td class="tag">휴대전화</td>
                    <td>
                        <div class="tel">${userDTO.getTel1() } - ${userDTO.getTel2() } - ${userDTO.getTel3() }</div>
                    </td>
                </tr>
                <tr>
                    <td class="tag">이메일</td>
                    <td>
                        <div id="email" >${userDTO.getEmail1() } @ ${userDTO.getEmail2() }</div>
                    </td>
                </tr>
                <tr>
                    <td class="tag">성별</td>
                    <td>
                        <div id="gender">${userDTO.getGender() }</div>
                    </td>
                </tr>
                <tr>
                    <td class="tag">주소</td>
                    <td class="address">
                        <div class="addr1" id="zipcode"><pre>우편번호: ${userDTO.getZipcode() }</pre></div>
                        <div class="addr2" id="addr1"><pre>주소    : ${userDTO.getAddr1() }</pre></div>
                        <div class="addr2" id="addr2"><pre>상세주소: ${userDTO.getAddr2() }</pre></div>
                    </td>
                </tr>
                <tr>
                    <th colspan="2">
                        <input type="button" id="updateFormBtn" class="bt_sty" value="회원정보수정">
                        <input type="button" id="myListBtn" class="bt_sty" value="구입목록">
                    </th>
                </tr>
            </table>
    </div>
    
    <footer id="footer"></footer>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        // 구입목록 버튼 클릭 시 OrderList.do로 이동
        document.getElementById('myListBtn').addEventListener('click', function() {
            window.location.href = '${pageContext.request.contextPath}/orders/orderList.do';
        });
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/user.js"></script>
</body>
</html>
