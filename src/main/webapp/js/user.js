//회원 관련 JavaScript

//아이디 중복 체크
$('#user_id').focusout(function() {
	$('#checkidbox').empty();
	
	if($('#user_id').val() == '')
		$('#checkidbox').html('먼저 아이디 입력').css('color', 'red').css('font-size', '1.5rem');
	else
		$.ajax({
			type: 'post',
			url: './checkId.do',
			data: 'user_id=' + $('#user_id').val(),
			dataType: 'text',
			success: function(data){
				//alert(data.trim());
				
				if(data.trim() == 'exist'){
					$('#checkidbox').html('사용 불가능').css('color', 'red').css('font-size', '1.5rem');
				}else{
					$('#checkidbox').html('사용 가능').css('color', 'blue').css('font-size', '1.5rem');
					$('#check').val($('#user_id').val());
				}
			},
			error: function(e){
				console.log(e);
			}
		});
});
//유효성 검사 및 데이터 전송
$(function(){
	$('#signup_btn').click(function(){
		$('#errorbox').empty();
		if($('#user_id').val() == '') {
			$('#errorbox').html('아이디를 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#user_id').focus();
		} else if ($('#pwd').val() == '') {
			$('#errorbox').html('비밀번호를 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#pwd').focus();
		} else if ($('#repwd').val() == '') {
			$('#errorbox').html('비밀번호를 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#repwd').focus();
		}else if ($('#name').val() == '') {
			$('#errorbox').html('이름을 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#name').focus();
		} else if ($('#email1').val() == '') {
			$('#errorbox').html('이메일을 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#email1').focus();
		} else if ($('#email2').val() == '') {
			$('#errorbox').html('이메일을 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#email2').focus();
		} else if ($('#tel2').val() == '') {
			$('#errorbox').html('핸드폰번호를 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#tel2').focus();
		} else if ($('#tel3').val() == '') {
			$('#errorbox').html('핸드폰번호를 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#tel3').focus();
		} else if ($('#pwd').val() != $('#repwd').val()){
			$('#errorbox').html('비밀번호를 다시 입력하세요').css('color', 'red').css('font-size', '2.5rem');
		} else {
			$.ajax({
				type : 'post',
				url : '${ pageContext.request.contextPath }/main/write.do',
				data : $('#signup_user').serialize(),
				dateType : 'text',
				success : function(){
					alert('회원가입이 완료되었습니다.');
					location.href = '${ pageContext.request.contextPath }/index.do';
				},
				error : function(e){
					alert('회원가입 실패');
					console.log(e);
				}
			});
		}
	});
});
//email selectbox 변경
function change() {
	// 도메인 직접 입력 or domain option 선택
	const email3 = document.querySelector('#email3_list');
	const email2 = document.querySelector('#email2');
	// select 옵션 변경 시
	email3.addEventListener('change', (event) => {
		// option에 있는 도메인 선택 시
		if (event.target.value !== "type") {
			// 선택한 도메인을 input에 입력하고 disabled
			email2.value = event.target.value
			email2.disabled = true
		} else { // 직접 입력 시
			// input 내용 초기화 & 입력 가능하도록 변경
			email2.value = ""
			email2.disabled = false
		}
	});
}
// 우편번호
function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}