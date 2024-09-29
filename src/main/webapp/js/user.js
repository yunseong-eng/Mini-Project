//회원 관련 JavaScript

//아이디 중복 체크
$(document).on('focusout', '#user_id', function(){
	$('#checkidbox').empty();
	
	if($('#user_id').val() == '')
		$('#checkidbox').html('먼저 아이디 입력').css('color', 'red').css('font-size', '1.5rem');
	else
		$.ajax({
			type: 'post',
			url: contextPath + '/user/checkId.do',
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
				return
			},
			error: function(e){
				console.log(e);
			}
		});
});
//유효성 검사 및 데이터 전송
$(document).on('click', '#signup_btn', function(){
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
			url : contextPath + '/user/write.do',
			data : $('#signup_user').serialize(),
			dataType : 'text',
			success : function(){
				alert('회원가입이 완료되었습니다.');
				location.href = contextPath + '/index.do';
			},
			error : function(e){
				alert('회원가입 실패');
				console.log(e);
			}
		});
	}
});
//email selectbox 변경
$(document).ready(function() {
    // 이메일 select box 변경 시 이벤트 바인딩
    $('#email3_list').change(function() {
        var selectedValue = $(this).val();
        if (selectedValue !== "type") {
            // 선택한 도메인을 input에 입력하고 비활성화
            $('#email2').val(selectedValue).prop('disabled', true);
        } else {
            // 직접 입력 시 input 초기화 및 활성화
            $('#email2').val('').prop('disabled', false);
        }
    });
});
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
//로그아웃
$('#logoutBtn').click(function(){
	$.ajax({
		type: 'post',
		url: contextPath + '/user/logout.do',
		success: function(){
			location.href = contextPath + '/index.do';
		},
		error: function(e){
			console.log(e);
		}
	});
});
$('#updateFormBtn').click(function(){
	$.ajax({
		type : 'post',
		url : contextPath + '/user/updateForm.do',
		data : {
			'user_id' : $('#user_id').val()
		},
		dataType : 'text',
		success : function(){
			location.href = contextPath + '/user/updateForm.do';
		},
		error : function(e){
			console.log(e);
		}
	});
});

$('#updateBtn').click(function(){
	$('#errorbox').empty();
		if ($('#name').val() == '') {
			$('#errorbox').html('이름을 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#name').focus();
		} else if ($('#pwd').val() == '') {
			$('#errorbox').html('비밀번호를 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#pwd').focus();
		} else if ($('#repwd').val() == '') {
			$('#errorbox').html('비밀번호를 입력하세요').css('color', 'red').css('font-size', '2.5rem');
			$('#repwd').focus();
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
		} else if ($('#pwd').val() != $('#repwd').val()) {
			$('#errorbox').html('비밀번호를 다시 입력하세요').css('color', 'red').css('font-size', '2.5rem');
		} else if ($('#checkpwd').val() != $('#getpwd').val()) {
			$('#errorbox').html('비밀번호를 확인해주세요').css('color', 'red').css('font-size', '2.5rem');
		} else {
			$.ajax({
				type : 'post',
				url : contextPath + '/user/update.do',
				data : $('#update_user').serialize(),
				dateType : 'text',
				success : function(){
					alert('회원정보가 수정되었습니다.');
					location.href = contextPath + '/index.do';
				},
				error : function(e){
					alert('회원정보수정 실패');
					console.log(e);
				}
			});
		}
});

//회원정보 수정

$('#delete_user').click(function(){
	if(confirm('회원탈퇴를 하시겠습니까?'))
		$.ajax({
			type : 'post',
			url : contextPath + '/user/deleteUser.do',
			data : {
				'user_id' : $('#user_id').val()
				},
			dataType : 'text',
			success : function(){
				alert('회원탈퇴완료');
				location.href = contextPath + '/index.do';
			},
			error : function(e){
				console.log(e);
			}
		});
});
