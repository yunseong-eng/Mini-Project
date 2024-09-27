<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="topBack"></div>
<div id="header">
	<div class="img"><img alt="adidas" src="../image/Adidas-logo.png" onclick="location.href='${pageContext.request.contextPath }/index.do'"></div>
	<div id="nav">
		<ul>
			<li id="men"><a href="${pageContext.request.contextPath }/product/listForm.do?ctg=MEN">MEN</a></li>
			<li id="women"><a href="${pageContext.request.contextPath }/product/listForm.do?ctg=WOMEN">WOMEN</a></li>
			<li id="kids"><a href="${pageContext.request.contextPath }/product/listForm.do?ctg=KIDS">KIDS</a></li>
			<li id="sports"><a href="${pageContext.request.contextPath }/product/listForm.do?ctg=SPORTS">SPORTS</a></li>
		</ul>
	</div>

</div>