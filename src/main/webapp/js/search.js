$(document).ready(function() {
	    // 검색 아이콘 클릭 시 검색창 열기/닫기
	    $("#search_imgbox").on("click", function() {
	        // 검색창을 토글하고 포커스 설정
	        $("#searchBox").toggleClass("show");
	        $("#search").focus(); // 검색창이 열리면 자동으로 포커스

	        // 검색창이 열려 있고 검색 아이콘을 다시 클릭하면 form 전송
	        if ($("#searchBox").hasClass("show")) {
	        	$.ajax({
	        		type : 'get',
	        		url : contextPath + '',
	        		data : {
	        			'search' : $('#search').val()
	        		},
	        		dataType : 'text',
	        		success : function(){},
	        		error : function(e){
	        			console.log(e);
	        		}
	        	});
	        }
	    });
	    // Enter 키를 눌렀을 때 form 전송
	    $("#search").on("keydown", function(event) {
	        if (event.key === "Enter") {
	            event.preventDefault(); // 기본 Enter 동작 방지
	            $.ajax({
	        		type : 'get',
	        		url : contextPath + '',
	        		data : {
	        			'search' : $('#search').val()
	        		},
	        		dataType : 'text',
	        		success : function(){},
	        		error : function(e){
	        			console.log(e);
	        		}
	        	});
	        }
	    });
	});