<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 페이지</title>
<link href="<%= request.getContextPath() %>/resources/css/aboutuser/userinfo.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/resources/css/GetOneGiftycorn.css" rel="stylesheet" type="text/css">
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
  <td class="tg-0pky aboutgiftycorn"><span id="GiftycornNumber">기프티콘이 <span>${GiftycornSize }</span>개 남았습니다.</span></td>
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
      <span id="giftycornList">기프티콘 목록</span><br>
      <span id="aboutInfo">현재 등록하신 기프티콘 목록입니다.</span>
<table class="tg" id="GiftycornInfo">
<tbody>
 <tr >
  <td colspan="3" class="getHR">
    <hr>
  </td>
  </tr>
<tr >
  <td colspan="2" style="width:1800px; margin:0px;">
  </td>
  </tr>
<c:forEach items="${GiftyCornInfoList }" var="GiftyCornInfoList">
  <tr>
    <td class="tg-0lax giftycornImage" rowspan="2"><div id="onlyUseGiftycornList"><img style="cursor: pointer;" src="<%=request.getContextPath() %>/${GiftyCornInfoList.GIFTYCORN_IMAGE_LOCATION }" id="giftycornIMG" class="getClickMouse"></div></td>
    <td class="tg-0lax giftycornDate reviewName">
      	<c:forEach items="${getCafeList}" var="option">
		<c:if test='${GiftyCornInfoList.GIFTYCORN_CLN == option.value}'>
		<div class="clickMouse">${option.key}
		  <input type="text" class="GiftyInfoCafeName" value="${ option.key}" style="display:none;">
		 <input type="text" class="GiftyInfoGIFTYCORN_ID" value="${ GiftyCornInfoList.GIFTYCORN_ID}" style="display:none;">
  <input type="text"class="GiftyInfoGIFTYCORN_CLN" value="${ GiftyCornInfoList.GIFTYCORN_CLN}" style="display:none;">
  <input type="text" class="GiftyInfoGIFTYCORN_IMAGE_LOCATION" value="${ GiftyCornInfoList.GIFTYCORN_IMAGE_LOCATION}" style="display:none;">
  <input type="text"class="GiftyInfoGIFTYCORN_START_DATE" value="${ GiftyCornInfoList.GIFTYCORN_START_DATE}" style="display:none;">
  <input type="text" class="GiftyInfoGIFTYCORN_LIMIT_DATE" value="${ GiftyCornInfoList.GIFTYCORN_LIMIT_DATE}" style="display:none;">
<input type="text" class="GiftyInfoGIFTYCORN_MEMO" value="${ GiftyCornInfoList.GIFTYCORN_MEMO}" style="display:none;">
		</div>
		</c:if>
	</c:forEach>
</td>
     <td rowspan="2" id="BMbutton">
     <div id="GiftyButton">
<a class="bookmarkbutton" href="updategiftycorn.cafe?GIFTYCORN_ID=${GiftyCornInfoList.GIFTYCORN_ID }">수정 </a>
<form action="deletegiftycorn.cafe" class="inlineblock">
	<input type="hidden" name="GIFTYCORN_ID" value='${GiftyCornInfoList.GIFTYCORN_ID }'>
	<input type="submit" value="삭제" id="bookmarkDelete">
</form>
</div>
    </td>
  </tr>
  <tr>
    <td class="tg-0lax giftycornMeno reviewName">${GiftyCornInfoList.GIFTYCORN_MEMO }
    </td>
  <tr >
  <td colspan="3" class="getHR">
    <hr>
  </td>
  </tr>
 </c:forEach> 
 <c:if test="${empty GiftyCornInfoList}">
    <tr>
    <td colspan="2">
      <div id="giftyProP">
        <p class="giftyProposal">아직 기프티콘을 등록하지 않으셨습니다</p>
        <p>
          <div id="giftyProPbox">
        <span class="yesgifty">기프티콘 등록하기</span>
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


<div id="getoneGiftycorn">
<div id="creategiftycorn">


  <div id="name">
          <span id="GetMember_ID"></span>
	</div>
	
	<div id="GIMGlabel" class="givespace">
      <div class="content"><img id="upGIMG" class="image_preview updateGiftyIMG " src="" style=" visibility : hidden;"></div>
	</div>
	
	<div id="Gtime">
    <label for="GSyear">시작 시간</label>
	<br> 
	<div><span id="getstartTime"></span></div>
	</div>
	
	<div id="endtime">
	 <label for="GEyear">종료 시간</label>
	<div><span id="getEndTime"></span></div><br><br>
	</div>
	
	<div id="GMemo">
    <label for="GiftMemo">메모</label><br>
<span id="getGiftMemo"></span>
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
	    location.href="creategiftycorn.cafe"                         
	  });
	  
	  })
$(document).ready(function() {

  $('.clickMouse').click(function() {
    var CafeName = $(this).find('.GiftyInfoCafeName').val();
    var giftycorn_id = $(this).find('.GiftyInfoGIFTYCORN_ID').val();
    var giftycorn_cln = $(this).find('.GiftyInfoGIFTYCORN_CLN').val();
    var giftycorn_image_location = $(this).find('.GiftyInfoGIFTYCORN_IMAGE_LOCATION').val();
    var giftycorn_start_date = $(this).find('.GiftyInfoGIFTYCORN_START_DATE').val();
    var giftycorn_limit_date = $(this).find('.GiftyInfoGIFTYCORN_LIMIT_DATE').val();
    var giftycorn_memo = $(this).find('.GiftyInfoGIFTYCORN_MEMO').val();
    
    
    var targetDate = new Date(giftycorn_limit_date);
    var now = new Date();
    var timeDiff = targetDate.getTime() - now.getTime();
    var daysLeft = Math.ceil(timeDiff / (1000 * 3600 * 24));

    if (timeDiff < 0) {
      console.log('날짜가 지났습니다.');
    } else if (daysLeft === 0) {
      console.log('오늘까지 남았습니다.');
    } else {
      console.log(daysLeft + '일 남았습니다.');
    }
    
    
    $('#GetMember_ID').text(CafeName);
    $('#upGIMG').css('visibility', 'visible');
    $('#upGIMG').attr('src', giftycorn_image_location);
    $('#getstartTime').text(giftycorn_start_date);
    if (timeDiff < 0) {
    	$('#getEndTime').text('날짜가 지났습니다.');
      } else if (daysLeft === 0) {
    	  $('#getEndTime').text('오늘까지 남았습니다.');
      } else {
    	    $('#getEndTime').html(giftycorn_limit_date+'<br><span id="reallimitdate">( 사용 가능일이 '+daysLeft + '일 남았습니다.)</span>');
      }
    
    $('#getGiftMemo').text(giftycorn_memo);
  });
  
  $('.getClickMouse').click(function() {
	    $(this).closest('td').next().find('.clickMouse').trigger('click');
	});
});


$('.clickMouse').click(function(){
	  $('#getoneGiftycorn').fadeIn(400);
	});

$(document).mouseup(function (e){
	  var container = $('#getoneGiftycorn');
	  var imageother = $('#creategiftycorn');
	  if (!imageother.is(e.target) && imageother.has(e.target).length === 0 && !$('#creategiftycorn').has(e.target).length){
	    container.fadeOut(400);
	  }
	});


	  
</script>
</body>
</html>