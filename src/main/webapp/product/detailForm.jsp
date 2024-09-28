<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<c:if test="${ dto != null }">
		
	<div id="productDetail">
		<div id="history"><a href="${pageContext.request.contextPath }/index.do">Home</a> / <a href="${pageContext.request.contextPath }/product/listForm.do?ctg=${dto.ctg }">${dto.ctg }</a></div>

		<div class="img">
			<img alt="상품이미지" src="${pageContext.request.contextPath}/${dto.productImage }" id="img">
		</div>
		
		<div class="productDetail">
			<div id="ctg">
				<span>${dto.ctg }</span>
				<span>조회수 ${dto.hit}</span>
			</div>
			
			<div id="name">${dto.productName }</div>
			<div id="price"><fmt:formatNumber pattern="#,###" value="${dto.productPrice }"/> 원<br></div>				
			
			<div id="color">
				<h4>컬러</h4>
				<p>Originals</p>
			</div>
			
			<div id="size">
				<h4>구입 가능한 사이즈</h4>
				<table>
					<c:set var="ranges" value="${'220,240;245,265;270,290;295,315'}" />
				    <c:forEach var="range" items="${fn:split(ranges, ';')}">
				        <tr>
				            <c:set var="limits" value="${fn:split(range, ',')}" />
				            <c:forEach var="i" begin="${limits[0]}" end="${limits[1]}" step="5">
				                <td id="${i }"><input type="button" name="size" value="${i}" class="size"/></td>
				            </c:forEach>
				        </tr>
				    </c:forEach>
				</table>
			</div>
			
			<div id="buyBtn">
				<input type="button" value="구매하기"id="${dto.productId }" />
			</div>
		</div>
	</div>

	<div id="review">
	    <!-- 리뷰 타이틀과 리뷰 수 -->
	    <div id="reviewTitle">리뷰 (${fn:length(reviewList)})<span class="under">▽</span></div>
	    
	    <!-- 리뷰가 있을 경우 -->
	    <c:if test="${reviewList != null && !reviewList.isEmpty()}">
	        <c:forEach var="item" items="${reviewList}">
	            <div class="review" style="display: none;">
	                <div class="name"><p>★★★★★</p><p>${item.user_id}</p></div>
	                <div id="content">
	                    <div class="title">${item.review_title}</div>
	                    <div class="content"><p>${item.review_content}</p></div>
	                    <div class="like"><span>좋아요 ${item.review_like}</span> <span id="comment" class="${item.review_id}">댓글 ${countComment}</span></div>
	                </div>
	                <div id="date"><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${item.logtime}"/></div>
	            </div>
	        </c:forEach>
	    </c:if>
	    
	    <!-- 리뷰가 없을 경우 -->
	    <c:if test="${reviewList == null || reviewList.isEmpty()}">
	        <div id="reviewNone" class="review1" style="display: none;">리뷰가 없습니다.</div>
	    </c:if>
	</div>
		
	<div id="productDescription">
		<div class="productDescriptionTitle">상세설명<span class="under">▽</span></div>
		<div class="productDescription" style="display: none;">

		<c:if test="${dto.productDescription != null && !dto.productDescription.isEmpty()}">
			${dto.productDescription }
		</c:if>
		
		<c:if test="${dto.productDescription  == null || dto.productDescription .isEmpty() }">
			상세정보가 없습니다.
		</c:if>
		</div>
	</div>
	</c:if>
	
	<footer id="footer"></footer>
	
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$('.size').click(function(){
	$(this).addClass('sizeClick');
	$('.size').not(this).removeClass('sizeClick');
})

$('.like #comment').click(function(){
	if(${commentList != null}){
		// 현재 클릭한 #comment의 부모 요소인 .review를 찾습니다.
	    var reviewDiv = $(this).closest('.review'); 
	    // 해당 reviewDiv 내에 있는 commentDiv를 찾습니다.
	    reviewDiv.next('#commentDiv').slideToggle(200); // 슬라이드 토글
	}
});

/* 리뷰 */
$('.productDescriptionTitle').click(function(){
	
	if(${dto.productDescription != null && !dto.productDescription.isEmpty()}){
		$('.productDescription').slideToggle(200);
		
	}else if(${dto.productDescription == null || dto.productDescription.isEmpty() }){
        $('.review1').slideToggle(200);
	}
	
});

/* 상세보기 */
$('#reviewTitle').click(function(){
	
	if(${reviewList != null && !reviewList.isEmpty()}){
		$('.review').slideToggle(200); // commentDiv의 표시 상태를 토글
		$('.commentDiv').slideUp(200); // commentDiv의 표시 상태를 토글
	}else if(${ reviewList == null || reviewList.isEmpty() }){
        $('.review1').slideToggle(200);
	}
	
});

$('#buyBtn input[type=button]').click(function(){
	
	var productId = $(this).attr('id');
	
	$.ajax({
		type : 'post',
		url : '/adidas/product/productOrder.do',
		data : {
			'product_id' : productId
		},
		success : function(){
			alert('구매가 완료되었습니다.')
		},
		error : function(e){
			console.log(e)
		}
	});

})
</script>
</body>
</html>