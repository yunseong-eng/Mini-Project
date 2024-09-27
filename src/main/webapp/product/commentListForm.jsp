<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${ commentList != null}">
<c:forEach var="item2" items="${commentList}">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="item2" items="${commentList}">
<c:if test="${item2.review_id == param.reviewId}">
<div class="blank"></div>
<div class="comment">
	<div id="content">
		<div class="name">
			<input type="hidden" name="productId" value="productId"/>
			<input type="hidden" name="reviewId" value="reviewId"/>
			<input type="hidden" name="userId" value="usertId"/>
			<input type="hidden" name="userId" value="userId"/>
			@${item2.user_id } 님
		</div>
		<div class="iontent">${item2.comment_iontent }</div>
	</div>
</div>
<c:if test="${sessionScope.memId != null}">
<div class="blank"></div>
<div class="comment">
<form id="commentForm">
	<div id="content">
		<div class="name">
			<input type="hidden" name="productId" value="${item2.product_id }"/>
			<input type="hidden" name="reviewId" value="${item2.review_id }"/>
			<input type="hidden" name="userId" value="${sessionScope.memeId }"/>
			@${sessionScope.memeId } 님
		</div>
		<div class="iontent"><textarea name="coment_iontent"></textarea></div>
	</div>
	<div id="commentBtn"><input type="submit" value="댓글" id="btn"/></div>
</form>
</div>
</c:if>
</c:forEach>
</c:if>
</c:if>
</c:forEach>

<%-- <c:if test="${sessionScope.memId != null}"> --%>
<div id="commentWriteList" class="${param.reviewId }Comment"></div>
<div class="blank"></div>
<div class="comment">
<form class="commentForm">
	<div id="content">
		<div class="name">
			<input type="hidden" name="product_id" value="${dto.productId }"/>
			<input type="hidden" name="review_id" value="${param.reviewId }"/>
			<input type="hidden" name="user_id" value="shinchan"/>
			<%-- ${sessionScope.memeId } --%>
			@${sessionScope.memeId }shinchan 님
		</div>
		<div class="iontent"><textarea name="comment_iontent"></textarea></div>
	</div>
	<div id="commentBtn"><input type="button" value="댓글" id="btn" onclick="return submitComment(this);"/></div>
</form>
</div>
<%-- </c:if> --%>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
function submitComment(button) {
	var $form = $(button).closest('.commentForm');

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
    
    return false;
}
</script>

