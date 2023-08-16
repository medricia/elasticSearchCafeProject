<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.projcafe.cafe.review.repository.ProjCafeReviewVO" %>
<%
ProjCafeReviewVO vo = (ProjCafeReviewVO)request.getAttribute("review");
String memberID = vo.getMEMBER_ID();

%>

<%--0504 수정본 현재 수정중 --%>
<!DOCTYPE html>
<html>
<head>
<title>${review.cafe_Review_Title}</title>
<link href="<%= request.getContextPath()%>/resources/css/reviewInfo.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
		<%@include file="/WEB-INF/views/def/header.jsp"%>
</head>
<body>
	<div class="ReviewContainer">
	<div class="reviewMain">			
					<table class="">
						<tr class="">
							<td class="reviewInfocafename">
								<c:forEach items="${ReviewCafeList }" var="ReviewCafeList">
						<c:if test="${ReviewCafeList.value eq review.cafe_ID}">
						<a href="getCafe.cafe?CAFE_ID=${review.cafe_ID }">${ReviewCafeList.key}</a>
							
						</c:if>
						</c:forEach>
							
							</td>
						</tr>
						<tr class="">
						</tr>
						<tr class="">
							<td class="userNickName">
								<c:forEach items="${getUserNickname }" var="getUserNickname" >
									<c:if test="${getUserNickname.value eq review.MEMBER_ID}">
										${getUserNickname.key }
									</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr class="">
							<td class="reviewInfoTitle">${review.cafe_Review_Title}</td>
						</tr>
						<tr class="reviewInfoContentTR">
							<td class="reviewInfoContent"><textarea readonly id="reviewcontenttextarea">${review.cafe_Review_Content}</textarea></td>
						</tr>
					</table>
  </div>
<div id="reviewIMGmain">
<c:if test="${!empty reviewImageBoolean }">
  <span class="leftclick">&lt;</span>
<ul class="scroll-container" data-layoutmethod="grid">
<c:forEach items="${reviewImage }" var="reviewImage">
  <li class="scroll-item"><img src="${reviewImage.REVIEW_IMAGE }"></li>
</c:forEach>
  </ul>
  <span class="rightclick">&gt;</span>
  </c:if>
</div>

<% try{if(checkID.equals(memberID)){
%>

<div id="Reviewbutton">
<a class="" href='updateCafeReview.cafe?cafe_Review_Number=${review.cafe_Review_Number}'>수 정</a>
<a class=""
								 href='deleteCafeReview.cafe?cafe_Review_Number=${review.cafe_Review_Number}'>
									삭 제 </a>
  </div>
  </div>
	
<%	
}
		
}catch(Exception e){} %>

<div id="ReviewImage">
<div id="ReviewIMGContainer">
<div id="list">
  <img id="getIMG" src="#">
</div>
</div>
</div>

<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	  var $scrollContainer = $("ul.scroll-container");
	  var $leftClick = $(".leftclick");
	  var $rightClick = $(".rightclick");

	  $leftClick.on("click", function () {
	    $scrollContainer.animate({scrollLeft: "-=300"}, 700);
	  });

	  $rightClick.on("click", function () {
	    $scrollContainer.animate({scrollLeft: "+=300"}, 700);
	  });
	});
$(function(){
	  $('.scroll-item img').click(function() {
	    var src = $(this).attr('src');
	    $('#getIMG').attr('src',src);
	    $('#ReviewImage').fadeIn(300);
	  });
	  
  $('#ReviewImage').click(function(e) {
	    if (e.target === this) { // 클릭한 요소가 배경인 경우에만 사라지도록 설정
	      $('#ReviewImage').fadeOut(300);
	    }
	  });

});

</script>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/textarea.js"></script>
	<script>
  $(document).ready(function() {
    autosize($('textarea'));
  });
</script>
</body>
</html>