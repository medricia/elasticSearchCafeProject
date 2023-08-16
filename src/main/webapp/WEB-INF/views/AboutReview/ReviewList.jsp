<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 페이지</title>
</head>
<link href="<%= request.getContextPath() %>/resources/css/aboutuser/userinfo.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/resources/css/aboutuser/getUserInfo.css" rel="stylesheet" type="text/css">
<%@include file="/WEB-INF/views/def/header.jsp"%>
<body>
<% if(checkID == null){
	response.sendRedirect("dologin.cafe");
}%>
<br>
<div id="MyMenuContainer">
<div id="margin1400px">
<div id="Usercontainer">
<table id="aboutUserInfo" >
<tr>
    <th class="tg-0pky myinfo">MY정보</th>
  <td class="tg-0pky aboutgiftycorn"><span id="GiftycornNumber">작성하신 리뷰 목록입니다.</span></td>
  </tr>
  <tr>
    <td class="tg-0pky MyInfo">
      <div id="MyInfoLIST">
      <span>MY 정보</span><br>
      <a href="getRealUserInfo.cafe?MEMBER_ID=<%=checkID%>">내 정보 보기</a>
      <a href="getUserInfo.cafe?MEMBER_ID=<%= checkID %>">기프티콘 보기</a><br>
      <a href="getBookmarkList.cafe?MEMBER_ID=<%= checkID %>">북마크 보기</a><br>
      <a href="getCafeReviewList.cafe?MEMBER_ID=<%= checkID %>">내가 쓴 리뷰 보기</a><br>
      <a class="Infobottom" href="AreyousureUpdate.cafe">내 정보 수정</a><br>
        <hr>
      <span>MY 활동</span><br>
      <a href="#">문의하기</a><br>
      <a class="Infobottom" href="#">문의내역 확인</a><br>
      </div>
      
    </td>
    <td class="tg-0pky getInfo">
      <span id="giftycornList">리뷰 목록</span><br>
      <span id="aboutInfo">현재 등록하신 리뷰 목록입니다.</span>
<table class="tg" id="GiftycornInfo">
<tbody>
<c:forEach items="${cafeReviewList }" var="cafeReviewList">
<c:forEach items="${ReviewCafeList }" var="ReviewCafeList">
<c:if test="${ReviewCafeList.value eq cafeReviewList.cafe_ID }">
  <tr>
  <td colspan="2" class="getHR">
    <hr>
  </td>
  </tr>
  <tr>
    <td class="tg-0lax giftycornDate reviewName"><a id="reviewList" href="getCafeReview.cafe?cafe_Review_Number=${cafeReviewList.cafe_Review_Number}">${ReviewCafeList.key}</a></td>
         <td rowspan="2" id="BMbutton">
         <div id="reviewButton">
<a class="bookmarkbutton" href="updateCafeReview.cafe?cafe_Review_Number=${cafeReviewList.cafe_Review_Number }">수정 </a>
<form action="deleteCafeReview.cafe" class="inlineblock">
	<input type="hidden" name="cafe_Review_Number" value='${cafeReviewList.cafe_Review_Number}'>
	<input type="submit" value="삭제" id="bookmarkDelete">
</form>
</div>
    </td>
  </tr>
   </c:if>
   </c:forEach>
  <tr>
    <td class="tg-0lax giftycornMeno reviewName">${cafeReviewList.cafe_Review_Title}</td>
  </tr>
</c:forEach> 
<tr>
  <td colspan="2"  class="getHR">
    <hr>
  </td>
  </tr>
   <c:if test="${empty cafeReviewList}">
    <tr>
    <td colspan="2">
      <div id="giftyProP">
        <p class="giftyProposal">아직 리뷰를 등록하지 않으셨습니다</p>
        <p>
          <div id="giftyProPbox">
        <span class="yesgifty">카페 찾아보기</span>
        </div>
      </div>
  </td>
    </tr>
    </c:if>
</tbody>
</table>
</table>
</div>

<div id="rightMenu">
  <div id="GoMenu">
    <a href="getCafeList.cafe">카페 목록 보기</a><br>
    <a href="creategiftycorn.cafe">기프티콘 등록하기</a><br>
    <a href="getUserInfo.cafe?MEMBER_ID=<%= checkID%>">등록한 기프티콘</a><br>
    <a href="getBookmarkList.cafe?MEMBER_ID=<%= checkID%>">북마크 보기</a><br>
    <a href="getCafeReviewList.cafe?MEMBER_ID=<%= checkID%>">내 리뷰 보기</a><br>
  </div>
  <a id="Gotop" href="#">▲top</a>
</div>
</div>
</div>

<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$('#PWsubmit').click(function(){
		if (!confirm("탈퇴하시겠습니까?")) {
			alert("취소하셨습니다.");
			return false;
        } else {
        	alert("탈퇴되었습니다.");
            $('#delete').submit();
        }
	})
	var menuTop = $('#margin1400px').offset().top;
var menuBottom = menuTop + $('#margin1400px').outerHeight() - $('#GoMenu').outerHeight();
var $rightMenu = $('#rightMenu');

$(window).scroll(function() {
  var distanceFromTop = $(this).scrollTop();
  var scrollTopDiff = Math.abs(distanceFromTop - menuTop);

  if (distanceFromTop >= menuTop && distanceFromTop < menuBottom) {
    $rightMenu.stop().animate({ top: scrollTopDiff + 450 }, 500);
  } else if (distanceFromTop >= menuBottom) {
    $rightMenu.stop().animate({ top: (menuBottom - menuTop) + 50 }, 500);
  } else {
    $rightMenu.stop().animate({ top: '50%' }, 500);
  }
});
$(function(){
	  $('#giftyProPbox').click(function(){
	    location.href="getCafeList.cafe"                         
	  });
	  
	  })
</script>
</body>
</html>