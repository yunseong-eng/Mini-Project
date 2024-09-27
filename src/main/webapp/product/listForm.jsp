<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./header.css">
<link rel="stylesheet" href="./product.css">
</head>
<body>
	<jsp:include page="./header.jsp"/>
	
	<div id="title">
		${ ctgTitle}
	</div>

	<c:if test="${list != null && !list.isEmpty()}">
	<div id="filter">
		<input type="button" class="filter" value="Filter"/>
		<div class="productAlign">
		<form id="alignList" action="${pageContext.request.contextPath }/product/listForm.do" method="post">
			<input type="hidden" name="filter" value="${map.filter }" id="id"/>
			<input type="hidden" name="align" value="${map.align }" id="class"/>
			<input type="hidden" name="ctg" value="${map.ctg }" id="class"/>
		</form>
			<div class="selected">정렬기준</div>
			<div class="options">
				<div class="option"><span id="logtime" class="desc">최신</span></div>
				<div class="option"><span id="hit" class="desc">인기 상품</span></div>
				<div class="option"><span id="product_price" class="desc">가격(높음)</span></div>
				<div class="option"><span id="product_price" class="asc">가격(낮음)</span></div>			
			</div>
		</div>
	</div>

	<div id="products">
	<c:if test="${ list != null }">
		<c:forEach var="item" items="${list }">
			<div class="product" id="${item.productId }" >
				<img alt="상품이미지" src="../storage/${item.productImage }" class="img">
				<div class="priceDiv">
					<div class="price"><fmt:formatNumber pattern="#,###" value="${item.productPrice }"/> 원</div>
				</div>
				<div id="detail">
					<div><p class="name">${item.productName }</p><img src="../image/heart_none.png" class="like"/></div>
					<div class="ctg">${item.productDescription }</div>
				</div>
			</div>
		</c:forEach> 
	</c:if>
	</div>
	</c:if>
	
	<c:if test="${list == null || list.isEmpty() }">
		<div id="products">상품이 없습니다.</div>
	</c:if>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	 var alignValueId = $('#id').val(); // align 값 가져오기
	 var alignValueClass = $('#class').val();
	 
	    $('.option').each(function() {
	        var optionAlign1 = $(this).find('span').attr('id'); // 각 option의 class 가져오기
	        var optionAlign2 = $(this).find('span').attr('class');
	        
	        if (alignValueId === optionAlign1&&alignValueClass === optionAlign2) {
	            var optionText = $(this).find('span').text(); // 해당 option의 텍스트 가져오기
	            $('.selected').text(optionText); // selected에 텍스트 업데이트
	        }
	    });
})

$('.product .img,  .product .name, .product .priceDiv').click(function(){
	var productId = $(this).closest('.product').attr('id');
	console.log(productId)

	location.href="/adidas/product/detailForm.do?productId=" + productId;			
});

$('.selected').click(function(){
	const selected = document.querySelector('.selected');
	const optionsContainer = document.querySelector('.options');
	const optionsList = document.querySelectorAll('.option');
	
	$('.options').slideToggle(200);

	optionsList.forEach(option => {
	    option.addEventListener('click', () => {
	        selected.textContent = option.textContent;
	        $('.options').slideUp(200);
	    });
	});

	document.addEventListener('click', (e) => {
	    if (!selected.contains(e.target)) {
	    	$('.options').slideUp(200);
	    }
	});
	
	$('.option').click(function(){
		// 클릭한 span에서 id와 class 값을 가져옴
        var filterId = $(this).find('span').attr('id');
        var alignClass = $(this).find('span').attr('class');
        
        // ID와 class input의 value 값을 변경
        $('#id').val(filterId);
        $('#class').val(alignClass);

        // 확인을 위한 로그 출력
        console.log('Filter ID:', $('#id').val());
        console.log('Align Class:', $('#class').val());
        
        $('#alignList').submit();
		
	});
	
});

$('#detail .like').hover(
	function(){
		$(this).attr('src','../image/heart.png');
	}, 
	function(){
		$(this).attr('src','../image/heart_none.png');	
	}
);

$('#detail .like').click(function(){
	
	var productId = $(this).closest('.product').attr('id');
	
	$.ajax({
		type : 'post',
		url : '/adidas/product/productOrder.do',
		data : {
			'product_id' : productId
		},
		success : function(){
			
		},
		error : function(e){
			console.log(e)
		}
	});

})

</script>
</body>
</html>