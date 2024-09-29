<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="item2" items="${commentList}">
<c:if test="${item2.review_id == param.reviewId}">
<div class="blank" id="blank_${item2.comment_id }"></div>
<div class="comment" id="comment_${item2.comment_id }">
	<div id="content">
		<div class="name">
			<input type="hidden" name="productId" value="productId"/>
			<input type="hidden" name="reviewId" value="reviewId"/>
			<input type="hidden" name="userId" value="userId"/>
			@${item2.user_id } 님
			<c:if test="${item2.user_id == sessionScope.userId }">
				<span id="deleteBtn" class="${item2.comment_id }" onclick="return deleteComment(this);">X</span>
			</c:if>
		</div>
		<div class="iontent">${item2.comment_iontent }</div>
	</div>
</div>
</c:if>
</c:forEach>

<c:if test="${sessionScope.userId != null && !sessionScope.userId.isEmpty()}">
<div id="commentWriteList" class="${param.reviewId }Comment"></div>
<form class="commentForm">
<div class="blank"></div>
<div class="comment">
	<div id="content">
		<div class="name">
			<input type="hidden" name="product_id" value="${dto.productId }"/>
			<input type="hidden" name="review_id" value="${param.reviewId }"/>
			<input type="hidden" name="user_id" value="${sessionScope.userId }"/>
			@${sessionScope.userId } 님
		</div>
		<div class="iontent"><textarea name="comment_iontent"></textarea><input type="button" value="댓글" id="commentBtn" onclick="return submitComment(this);"/></div>
		<div class="errorIontent"></div>
	</div>
</div>
</form>
</c:if>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
function submitComment(button) {
	var $form = $(button).closest('.commentForm');

	if ($form.find('textarea[name="comment_iontent"]').val().trim() === '') {
		$form.find('.errorIontent').html('내용을 입력하세요');
        $form.find('textarea[name="comment_iontent"]').focus();
        return false;
	}else{
    $.ajax({
        type: 'post',
        url: '/adidas/product/commentWrite.do',
        data: $form.serialize(), // 현재 폼의 데이터를 직렬화
        success: function() {
            var userId = $form.find('input[name="user_id"]').val(); // 현재 폼의 사용자 ID
            var commentContent = $form.find('textarea[name="comment_iontent"]').val(); // 작성한 댓글 내용
            var productId = $form.find('input[name="product_id"]').val(); // 현재 폼의 제품 ID
            var reviewId = $form.find('input[name="review_id"]').val(); // 현재 폼의 리뷰 ID
        	
            console.log(userId + ", " + commentContent + ", " + productId + ", " + reviewId)
            // 새로운 댓글 HTML 생성
            var newCommentHtml = `
            	<div class="blank"></div>
            	<div class="comment">
            		<div id="content">
            			<div class="name">
            				<input type="hidden" name="productId" value=`+ productId +`>
            				<input type="hidden" name="reviewId" value=`+ reviewId+`>
            				<input type="hidden" name="userId" value=`+ userId +`>
            				@`+ userId +` 님
            			</div>
            			<div class="iontent">` + commentContent + `</div>
            		</div>
            	</div>
            `;

            // 댓글 리스트에 추가
            $('.' + reviewId + 'Comment').append(newCommentHtml);
            // 텍스트 영역 초기화
            $form.find('textarea[name="comment_iontent"]').val('');
        },
        error: function(e) {
            console.log(e);
        }
    });
	}
    
    return false;
}

function deleteComment(span){
	var comment_id = $(span).attr('class');
	console.log(comment_id)
	
	$.ajax({
		type : 'post',
		url : '/adidas/product/deleteComment.do',
		data : {'comment_id' : comment_id},
		success : function(){
			alert('댓글이 삭제되었습니다');
			$('#comment_' + comment_id).remove();
			$('#blank_' + comment_id).remove();
		},
		error : function(e){
			console.log(e)
		}
	});
}
</script>