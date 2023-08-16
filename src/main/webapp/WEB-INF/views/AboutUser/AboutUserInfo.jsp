<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 페이지</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>


<link href="<%= request.getContextPath() %>/resources/css/aboutuser/userinfo.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resources/css/aboutuser/updateUserInfo.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<div id="MyMenuContainer">
<div id="margin1400px">
<div id="Usercontainer">
<table id="aboutUserInfo" >
<tr>
    <th class="tg-0pky myinfo">MY정보</th>
  <td class="tg-0pky aboutgiftycorn"><span id="GiftycornNumber">내 정보 보기</span></td>
  </tr>
  <tr>
    <td class="tg-0pky MyInfo">
       <div id="MyInfoLIST">
      <span>MY 정보</span><br>
      <a href="getRealUserInfo.cafe?MEMBER_ID=<%=checkID%>">내 정보 보기</a>
      <a href="getUserInfo.cafe?MEMBER_ID=<%= checkID %>">기프티콘 보기</a><br>
      <a href="getBookmarkList.cafe?MEMBER_ID=<%= checkID %>">북마크 보기</a><br>
      <a href="getCafeReiviewMemberList.cafe?MEMBER_ID=<%= checkID %>">내가 쓴 리뷰 보기</a><br>
      <a class="Infobottom" href="AreyousureUpdate.cafe">내 정보 수정</a><br>
        <hr>
      <span>MY 활동</span><br>
      <a href="#">문의하기</a><br>
      <a class="Infobottom" href="#">문의내역 확인</a><br>
      </div>
      
    </td>
    <td class="tg-0pky getInfo">
    <div id="DIVUserInfo">
      <table class="tg" id="RealUserInfo">
<thead>
  <tr>
    <td colspan="2" id="UsertableHeader">회원 정보</td>
  </tr>
  <tr >
  <td colspan="2" style="width:1800px; margin:0px;">
  </td>
  </tr>
        </thead>
<tbody>
  <tr>
    <td class="tg-0pky usertablefront">아이디</td>
    <td class="tg-0lax usertableback">${userInfo.MEMBER_ID}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">닉네임</td>
    <td class="tg-0lax usertableback">${userInfo.MEMBER_NICKNAME}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">이름</td>
    <td class="tg-0lax usertableback">${userInfo.MEMBER_NAME}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">이메일</td>
    <td class="tg-0lax usertableback">${userInfo.MEMBER_EMAIL}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">모바일</td>
    <td class="tg-0lax usertableback">${userInfo.MEMBER_MOBILE}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">생일</td>
    <td class="tg-0lax usertableback">${userInfo.MEMBER_BIRTH }</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">가입일</td>
    <td class="tg-0lax usertableback">${userInfo.MEMBER_JOIN_DATE}</td>
  </tr>
</tbody>
</table>
      </div>
    </td>
  </tr>
      <tr >
  <td colspan="2" class="getHR">
  </td>
  </tr>
</table>
</div>
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

</script>

</body>
</html>