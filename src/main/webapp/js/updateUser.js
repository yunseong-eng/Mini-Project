$(document).on('click', '#update_Btn', function(){
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
				dataType : 'text',
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