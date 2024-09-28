$(document).ready(function(){
	// 검색 아이콘 클릭 시 검색창 열기/닫기
    $("#search_imgbox").on("click", function() {
        // 검색창을 토글하고 포커스 설정
        $("#searchBox").toggleClass("show");
        $("#search").focus(); // 검색창이 열리면 자동으로 포커스

       
	    // Enter 키를 눌렀을 때 form 전송
        if ($("#searchBox").hasClass("show")) {
            $(document).on("keydown", "#search", function(event) {
                if (event.key === "Enter") {
                    event.preventDefault(); // 기본 Enter 동작 방지
                    let searchValue = $('#search').val();
                    
                    if (searchValue) {
                        // 검색어를 URL 파라미터로 추가하여 페이지 이동
                        location.href = contextPath + '/product/searchForm.do?search=' + encodeURIComponent(searchValue);
                    } else {
                        alert('검색어를 입력하세요.');
                    }
                }
            });
        }
    });
});
