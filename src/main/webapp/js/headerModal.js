function openSignupModal() {
        // 모달 콘텐츠 로딩
        fetch(contextPath + "/user/writeForm.do")
            .then(response => response.text())
            .then(html => {
                document.querySelector('.modal-content').innerHTML = html;
            });
    }
function openLoginModal() {
        // 모달 콘텐츠 로딩
        fetch(contextPath + "/user/loginForm.do")
            .then(response => response.text())
            .then(html => {
                document.querySelector('.modal-content').innerHTML = html;
            });
    }

    document.addEventListener('DOMContentLoaded', function () {
        var modal = document.getElementById('exampleModal');
        modal.addEventListener('show.bs.modal', function (event) {
            document.getElementById('main_menu').style.paddingRight = '15px';
        });

        modal.addEventListener('hidden.bs.modal', function (event) {
            document.getElementById('main_menu').style.paddingRight = '0';
            window.location.reload(); // 페이지 새로고침
        });

        // 모달 열기 이벤트 바인딩
		if(openLoginModal()){
	        document.querySelectorAll('[data-bs-toggle="modal"]').forEach(button => {
	            button.onclick = openLoginModal;
	        });
		} else if(openLoginModal()){
			document.querySelectorAll('[data-bs-toggle="modal"]').forEach(button => {
	            button.onclick = openSignupModal;
	        });
		}
    });