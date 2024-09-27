<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:if test="${ commentList != null}">
<c:forEach var="item2" items="${commentList}">
<div class="blank"></div>
<div class="comment">
	<div id="content">
		<div class="name">
			<input type="hidden" name="productId" value="productId"/>
			<input type="hidden" name="reviewId" value="reviewId"/>
			<input type="hidden" name="userId" value="usertId"/>
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