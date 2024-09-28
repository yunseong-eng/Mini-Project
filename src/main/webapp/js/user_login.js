//로그인
$(document).on('click', '#loginBtn', function(){
	$('#errorbox').empty();
	
	if($('#login_id').val() == '')
		$('#errorbox').html('아이디 입력');
	else if($('#pwd').val() == '')
		$('#errorbox').html('비밀번호 입력');
	else
		$.ajax({
			type: 'post',
			url: contextPath + '/user/login.do',
			data: {
				'user_id': $('#login_id').val(),
				'pwd': $('#pwd').val()
			},
			dataType: 'text',
			success: function(data){
				if(data.trim() == 'fail') {
					$('#errorbox').html("아이디 또는 비밀번호가 틀렸습니다.").css('color', 'red').css('font-size', '2rem');
				}
				else {
					alert('로그인');
					location.href = contextPath + '/index.do';
				}
			},
			error: function(e){
				console.log(e);
			}
		});
});
