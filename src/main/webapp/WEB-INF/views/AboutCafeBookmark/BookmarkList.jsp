<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 페이지</title>
<link href="<%= request.getContextPath() %>/resources/css/aboutuser/userinfo.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/resources/css/aboutuser/updatebookmark.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>      
<script type="text/javascript">
</script>
</head>
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
  <td class="tg-0pky aboutgiftycorn"><span id="GiftycornNumber"> <span><%= checkID %></span>님의 북마크를 가져오는 창입니다.</span></td>
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
      <span id="giftycornList">북마크 목록</span><br>
      <span id="aboutInfo">현재 등록하신 북마크 목록입니다.</span>
  <input type="radio" id="tab-1" name="show" checked/>
  <input type="radio" id="tab-2" name="show" />
  <input type="radio" id="tab-3" name="show" />
  <input type="radio" id="tab-4" name="show" />
<table class="tg" id="GiftycornInfo">
<tbody>
<c:forEach items="${Bookmark}" var="Bookmark">
 <tr >
  <td colspan="2" class="getHR">
    <hr>
  </td>
  </tr>
  <tr>
    <td class="tg-0lax giftycornDate reviewName getbookmark"><a id="reviewList" href="getCafe.cafe?CAFE_ID=${Bookmark.CAFE_ID}">
      	<c:forEach items="${getCafeID}" var="option">
		<c:if test='${Bookmark.CAFE_ID eq option.value}'>
			${option.key}
		</c:if>
	</c:forEach></a></td>
    <td rowspan="3" id="BMbutton"><div id="OnlybookmarkButton">
<a class="bookmarkbutton bookmarkUpdate">수정<input id="BookmarkCafeID" type="hidden" value="${Bookmark.CAFE_ID }"></a>
<form action="deleteBookmark.cafe" class="inlineblock">
	<input type="hidden" name="CAFE_ID" value='${Bookmark.CAFE_ID }'>
	<input type="hidden" name="MEMBER_ID" value="<%= checkID %>">
	<input type="submit" value="삭제" id="bookmarkDelete">
</form>
      </div>
    </td>
  </tr>
  <tr>
    <td class="tg-0lax giftycornMeno reviewName">${Bookmark.CAFE_BOOKMARK_MEMO}</td>
  </tr>
 </c:forEach> 
 <tr >
  <td colspan="2" class="getHR">
    <hr>
  </td>
  </tr>
   <c:if test="${empty Bookmark}">
    <tr>
    <td colspan="2">
      <div id="giftyProP">
        <p class="giftyProposal">아직 북마크를 등록하지 않으셨습니다! 당신만의 카페를 찾아보세요!</p>
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

<div id="bookmarkbackground">
<div id="bookmarkcontainer">
<h3 id="cafe">북마크를 수정하시겠습니까?</h3>
<div id="bookmarklist">
<form action="updateBookmark.cafe" method="post">
	<input type="hidden" name="MEMBER_ID" value="<%= checkID %>" placeholder="nickname">
	<input type="hidden" name="CAFE_ID" id="getBookmarkCafeID" value="">
  <textarea name="CAFE_BOOKMARK_MEMO" placeholder="메모 작성이 가능합니다!" id="bookmarkmemo"></textarea><br>
	<input type="submit" value="등록" id="bookmarksubmit">
	</form>
	</div>
</div>
</div>

<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
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
$(document).ready(function() {
  // a 버튼 클릭 시 이벤트 핸들러 등록
  $(".bookmarkUpdate").click(function(event) {
    event.preventDefault(); // a 태그의 기본 동작을 막음
    var cafeId = $(this).find("#BookmarkCafeID").val(); // 클릭된 a 태그의 hidden 요소에서 cafeId 값을 가져옴
    $("#getBookmarkCafeID").val(cafeId); // getBookmarkCafeID 요소의 value 값을 cafeId로 변경
  });
});

$(document).ready(function() {
	  // 북마크 아이콘을 클릭하면 북마크 폼이 나타나도록 설정
	  $('.bookmarkUpdate').click(function() {
	    $('#bookmarkbackground').fadeIn(300);
	    $('#bookmarkcontainer').fadeIn(300);
	  });
	  
	  // 배경을 클릭하면 북마크 폼이 사라지도록 설정
	  $('#bookmarkbackground').click(function(e) {
	    if (e.target === this) { // 클릭한 요소가 배경인 경우에만 사라지도록 설정
	      $('#bookmarkbackground').fadeOut(300);
	      $('#bookmarkcontainer').fadeOut(300);
	    }
	  });
	});
	
</script>
</body>
</html>