<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String checkIn = (String)session.getAttribute("LoginMEMBER");
%>    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>${cafeInfo.CAFE_NAME}</title>
<link href="<%= request.getContextPath()%>/resources/css/getCafeInfo.css" rel="stylesheet" type="text/css">
<%@include file="/WEB-INF/views/def/header.jsp"%>
<link href="<%= request.getContextPath()%>/resources/css/aboutcafeInfo.css" rel="stylesheet" type="text/css">
</head>

<body>
	<br><br>

	
	<%-- 위쪽 이미지 --%>
	<div id="cafe_image" >	
		<img alt="cafe image" src="<%=request.getContextPath()%>/${cafeInfo.CAFE_IMAGE}" id="pic" class="container">
		<!-- 사진 비율에 맞게 안깨지게  -->
	</div>
	
	<div class="mapdiv">
    <div id="map"></div>
    <div class="hereiscafe">
    	<table class="tg">
		  <tbody>
		  <tr>
		    <th class="tg-0pky herecafeName">인밸류어블(invaluable)</th>
		  </tr>
		  <tr>
		    <td class="tg-0pky herecafeIntro">청파동 작은 공간에서 커피와 책을 판매합니다.</td>
		  </tr>
		  <tr>
		    <td class="tg-0lax"><a href="getCafe.cafe?CAFE_ID=93">카페 둘러보기</a></td>
		  </tr>
		   <tr>
		    <th class="tg-0pky herecafeName">디저트샵 아띠랑스</th>
		  </tr>
		  <tr>
		    <td class="tg-0pky herecafeIntro">당일레터링케이크/크랙소금빵/마카롱/눈꽃빙수/디저트/구움과자 테이크아웃 및 배달 영업합니다~</td>
		  </tr>
		  <tr>
		    <td class="tg-0lax"><a href="getCafe.cafe?CAFE_ID=168">카페 둘러보기</a></td>
		  </tr> <tr>
		    <th class="tg-0pky herecafeName">달달차차(DALDALCHACHA)</th>
		  </tr>
		  <tr>
		    <td class="tg-0pky herecafeIntro">중랑구 신내동에 위치한 100% 수제디저트 공방입니다. 어린이날, 환갑, 결혼식, 생일 등...</td>
		  </tr>
		  <tr>
		    <td class="tg-0lax"><a href="getCafe.cafe?CAFE_ID=167">카페 둘러보기</a></td>
		  </tr> <tr>
		    <th class="tg-0pky herecafeName">띤보케이크</th>
		  </tr>
		  <tr>
		    <td class="tg-0pky herecafeIntro">주문예약은 카카오톡 채널: 띤보케이크 검색 후 문의주세요 : )</td>
		  </tr>
		  <tr>
		    <td class="tg-0lax"><a href="getCafe.cafe?CAFE_ID=107">카페 둘러보기</a></td>
		  </tr> <tr>
		    <th class="tg-0pky herecafeName">텐퍼센트커피</th>
		  </tr>
		  <tr>
		    <td class="tg-0pky herecafeIntro">상위 10% 스페셜티 원두, 기본 2샷입니다.</td>
		  </tr>
		  <tr>
		    <td class="tg-0lax"><a href="getCafe.cafe?CAFE_ID=201">카페 둘러보기</a></td>
		  </tr>
		</tbody>
		</table>
    </div>
    </div>
	<br>
	<%-- 카페 제목 --%>
	<br>
	<h1 id="cafe_name" style="color: #481810;">${cafeInfo.CAFE_NAME}</h1>

	<div id="cafe_intro"><textarea readonly>${cafeInfo.CAFE_INTRODUCTION}</textarea></div>
	<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/textarea.js"></script>
	<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js" type="text/javascript"></script>
<script>
  $(document).ready(function() {
    autosize($('textarea'));
  });
</script>
		<% try{if(checkID == null){
		}else{	%>
	<span id="reviewimage">
	<a href="./insertCafeReview.cafe?Cafe_ID=${cafeInfo.CAFE_ID }"><img class="map" src="<%=request.getContextPath()%>/resources/reviewImages/insertReview.png" style="width:40px; height:40px;"></a>
	&nbsp;&nbsp;
	</span>
	
	<span id="bookmarkimage">
		<img id="createBookmarkIMG" class="bookmark" src="<%=request.getContextPath()%>/resources/reviewImages/bookmark.png" style="width:40px; height:40px;">
		
	</span>
	<%}}catch(Exception e){} %>

	<br><hr><br>
	
	<!-- 테이블로 만들기  -->
	 <div id="list">
	 <table>
     
        <tr>
          <td align="left" id="tableName">주소</td><td colspan="2" align="left" id="tableContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cafeInfo.CAFE_LOCATION}
           &nbsp;&nbsp;		
	</td><td></td>
        </tr>
        
        <tr>
          <td align="left" id="tableName">영업시간</td><td colspan="2" align="left" id="tableContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cafeInfo.CAFE_OPERATETIME}</td><td></td>
        </tr>
        <tr>
          <td align="left" id="tableName">전화번호</td><td colspan="2" align="left" id="tableContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cafeInfo.CAFE_PHONENUMBER}</td><td></td>
        </tr>
        <tr>
          <td align="left" id="tableName">웹사이트</td><td colspan="2" align="left" id="tableContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cafeInfo.CAFE_SNS }</td><td></td>
        </tr>
        <tr>
  <c:forEach items="${MENU}" var="menu" varStatus="status">
  <tr class="menuHR">
    <c:if test="${status.index == 0}">
      <td align="left" id="tableName">메뉴</td>
    </c:if>
    <c:if test="${status.index > 0}">
      <td>&nbsp;</td>
    </c:if>
    <td align="left" id="tableContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${menu.cafe_Menu}</td>
    <td align="left" id="tableContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ${menu.cafe_Menu_Price}</td>
  </tr>
</c:forEach>
         
        </tr>
      </tbody>
    </table>
	</div>
	
	
	<%-- 카페 구체설명 --%>

	<div id="explain" hidden="">
		<div id="location">
		
		주소<br><span style="color: black">${cafeInfo.CAFE_LOCATION}</span></div><br>
		<div id="location" >영업시간<br><span>${cafeInfo.CAFE_OPERATETIME}</span></div><br>
		<div id="location">전화번호<br><span>${cafeInfo.CAFE_PHONENUMBER}</span></div><br>
		<div id="location">웹사이트<br><span>${cafeInfo.CAFE_SNS }</span></div>
		
		<br><br>
		<div id="location">메뉴&nbsp;&nbsp;<br><br>
		<span>
		<c:forEach items="${MENU}" var = "menu">
		<%-- 수정요 --%>
		<div class="cafeMenu">${menu.cafe_Menu} ${menu.cafe_Menu_Price }
		</div>
		</c:forEach>
		</span>
		</div>
	</div>	<br>

<%

try{

if(checkIn.equals("admin")){
%>
<hr><br>

	<div id="admin_cafe">
		<a href="./deleteCafe.cafe?CAFE_ID=${cafeInfo.CAFE_ID }" class="spacing goBack">삭제</a> &nbsp;
		<a href="./updateCafe.cafe?CAFE_ID=${cafeInfo.CAFE_ID }" class="spacing goBack">수정</a>
	</div>

	<br><br><hr>
	<div id="">
<form action="insertCafeMenu.cafe" method="post">
	<input type="hidden" name="cafe_ID" value="${cafeInfo.CAFE_ID }"><br>
	<div class="menuTitle" id="cafe_menu_title">카페 메뉴 등록하기</div><br>
	<div id="cafemenuinputcontainer">
	<table>
		<tbody>
			<tr>
			<td><div id="cafe_menu">카페메뉴</div></td>
			<td><input type="text" name="cafe_Menu" placeholder="카페 메뉴"></td>
			</tr>
			<tr>
			<td><div id="cafe_price">가격</div></td>
			<td><input type="text" name="cafe_Menu_Price" placeholder="가격">
			</td>
			</tr>
		</tbody>
	</table>
	</div>
	<br>
	<div id="cafe_menu_submit"><input type="submit" value="등록"><a class="menuedit" href="updateCafeMenu.cafe?Cafe_ID=${cafeInfo.CAFE_ID }">수정</a></div>
</form>	
</div>	
<%
}
}
catch(Exception e){
	
}
%>	
<br>
	<hr>
	
	
	<br>
	
	<%-- 0503 리뷰 리스트 나오는 부분 수정 --%>
	<c:forEach items="${cafeReviewList}" var="cafeReviewList">
	<div class="news" id="news">
		<div class="article-box" align="center">
			<div class="article">
					<div class="art-image">
					</div>
					<div class="art-text">
						<div class="art-name" hidden="">${cafeInfo.CAFE_NAME }</div>
						<br>
						<div class="reviewListTitle">${cafeReviewList.cafe_Review_Title}</div>	 
							<br>
						<div class="reviewContent">${cafeReviewList.cafe_Review_Content}</div>
						<br><br>
						<div align="right"><a href="getCafeReview.cafe?cafe_Review_Number=${cafeReviewList.cafe_Review_Number}">리뷰 자세하게 보기 <i class="bi bi-chevron-double-right"></i></a> </div><br>
						<br>
								 
					</div>
			</div>
		</div>
	</div> <br>
	</c:forEach>
	<%try{if(checkID==null){}else{%>
	<c:if test="${empty cafeReviewList}">
	<div id="giftyProP">
        <p class="giftyProposal">첫번째 리뷰를 등록해보세요!</p>
        <p>
          <div id="giftyProPbox">
        <span class="yesgifty">리뷰 등록하기</span>
        </div>
      </div>
	</c:if>
		<%}
	}catch(Exception e){} %>
<c:forEach items="${GiftycornList }" var="GiftycornList">
<c:if test="${cafeInfo.GIFTYCORN_CLN eq GiftycornList.GIFTYCORN_CLN}">
<div id="getCafeGiftycorn">
  <button id="ThisCafeGiftycorn">현재 카페에서 사용 가능한 기프티콘이 있습니다!</button>  
<div id="CafeGiftycorn">

<c:forEach items="${ getGiftycornMEMBERInfo}" var="option">
  <div class="realGiftycorn">
    <div class="imageCenter">
  <img class="giftycornImg" src="<%= request.getContextPath()%>/${option.GIFTYCORN_IMAGE_LOCATION}"><br>
    </div>
    <p class="giftydate">사용기한:${option.GIFTYCORN_LIMIT_DATE}</p><br>
  </div>
</c:forEach>
  
  </div>
</div>
</c:if>
</c:forEach>

<div id="center">
  <div id="centerimage">
    <p id="giftyCafeName">카페 이름 종각역점</p>
      <img id="IMG" src="">
    <p class="giftymemo">간단한 메모</p>
  </div>
</div>	
</div>

<div id="bookmarkbackground">
<div id="bookmarkcontainer">
<h3 id="cafe">북마크 하시겠습니까?</h3>
<div id="list">
<form action="createBookmark.cafe" method="post">
	<input type="hidden" name="MEMBER_ID" value = "<%= checkIn %>" placeholder="nickname">
	<input type="hidden" name="CAFE_ID" value="${cafeInfo.CAFE_ID }">
  <textarea name="CAFE_BOOKMARK_MEMO" placeholder="메모 작성이 가능합니다!" id="bookmarkmemo"></textarea><br></div>
	<input type="submit" value="등록" id="bookmarksubmit">
</form>
</div>
</div>
</div>

<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	  var isGiftycornOpen = false; // 기프티콘 상태를 추적하는 변수

	$('#ThisCafeGiftycorn').click(function() {
	  if (isGiftycornOpen) { // 기프티콘이 열려있는 상태인 경우
	    $('#CafeGiftycorn').slideUp(700); // 500ms 동안 슬라이드 업 애니메이션 적용
	    isGiftycornOpen = false; // 상태 변수를 닫힌 상태로 변경
	  } else { // 기프티콘이 닫혀있는 상태인 경우
	    $('#CafeGiftycorn').slideDown(800); 
	    isGiftycornOpen = true; 
	  }
	});

	  $('.giftycornImg').click(function(){
	    var src = $(this).attr('src'); // 현재 클릭한 이미지의 src 가져오기
	    $('#IMG').attr('src', src); 
	     $('#center').fadeIn(400);
	  });
	  
	  $(document).mouseup(function (e){
	  var container = $('#center');
	    var imageother = $('#centerimage');
	  if (!imageother.is(e.target) && imageother.has(e.target).length === 0){
	    container.fadeOut(400); // center 영역을 500ms 동안 서서히 보이지 않도록 페이드아웃 애니메이션 적용
	  }
	});

	});
	
$(function(){
	  $('#giftyProPbox').click(function(){
	    location.href="insertCafeReview.cafe?Cafe_ID=${cafeInfo.CAFE_ID }"                         
	  });
	  
	  })
$(document).ready(function() {
  // 북마크 아이콘을 클릭하면 북마크 폼이 나타나도록 설정
  $('#createBookmarkIMG').click(function() {
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

$(document).ready(function() {
	  var maxLength = 45;
	  $(".reviewContent").each(function() {
	    var myStr = $(this).text();
	    if ($.trim(myStr).length > maxLength) {
	      var newStr = myStr.substring(0, maxLength);
	      $(this).text(newStr + "...");
	    }
	  });
	});

	  
	  

</script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab3d0aeb4cc20e2938328ce7f1ad6e98"></script>
<script>

var MARKER_WIDTH = 33,
MARKER_HEIGHT = 36,
OFFSET_X = 12,
OFFSET_Y = MARKER_HEIGHT,
OVER_MARKER_WIDTH = 40,
OVER_MARKER_HEIGHT = 42,
OVER_OFFSET_X = 13,
OVER_OFFSET_Y = OVER_MARKER_HEIGHT,
SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png',
SPRITE_WIDTH = 126,
SPRITE_HEIGHT = 146,
SPRITE_GAP = 10;

var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT),
markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y),
overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT),
overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y),
spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT);

var positions = [
    new kakao.maps.LatLng(${MapInfo.CAFE_LAT}, ${MapInfo.CAFE_LONG}),
],
selectedMarker = null;

var mapContainer = document.getElementById('map'),
mapOption = { 
    center: new kakao.maps.LatLng(${MapInfo.CAFE_LAT}, ${MapInfo.CAFE_LONG}),
    level: 3
};

var map = new kakao.maps.Map(mapContainer, mapOption); 

for (var i = 0, len = positions.length; i < len; i++) {
var gapX = (MARKER_WIDTH + SPRITE_GAP),
    originY = (MARKER_HEIGHT + SPRITE_GAP) * i,
    overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i,
    normalOrigin = new kakao.maps.Point(0, originY),
    clickOrigin = new kakao.maps.Point(gapX, originY),
    overOrigin = new kakao.maps.Point(gapX * 2, overOriginY);
    
addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
}

function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
    overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
    clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);

var marker = new kakao.maps.Marker({
    map: map,
    position: position,
    image: normalImage
});

marker.normalImage = normalImage;

kakao.maps.event.addListener(marker, 'mouseover', function() {

    if (!selectedMarker || selectedMarker !== marker) {
        marker.setImage(overImage);
    }
});

    kakao.maps.event.addListener(marker, 'mouseout', function() {

        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(normalImage);
        }
    });

    kakao.maps.event.addListener(marker, 'click', function() {

        if (!selectedMarker || selectedMarker !== marker) {

            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

            marker.setImage(clickImage);
        }

        selectedMarker = marker;
    });
}

function createMarkerImage(markerSize, offset, spriteOrigin) {
    var markerImage = new kakao.maps.MarkerImage(
        SPRITE_MARKER_URL,
        markerSize,
        {
            offset: offset,
            spriteOrigin: spriteOrigin,
            spriteSize: spriteImageSize
        }
    );
    
    return markerImage;
}

</script>

</body>
</html>