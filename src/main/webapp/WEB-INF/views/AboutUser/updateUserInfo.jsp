<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  <td class="tg-0pky aboutgiftycorn"><span id="GiftycornNumber">정보 수정란 입니다.</span></td>
  </tr>
  <tr>
    <td class="tg-0pky MyInfo">
       <div id="MyInfoLIST">
      <span>MY 정보</span><br>
          <a href="getRealUserInfo.cafe?MEMBER_ID=<%=checkID%>">내 정보 보기</a>
      <a href="getUserInfo.cafe?MEMBER_ID=<%= checkID %>">기프티콘 보기</a><br>
      <a href="getBookmarkList.cafe?MEMBER_ID=<%= checkID %>">북마크 보기</a><br>
      <a href="getCafeReviewList.cafe?MEMBER_ID=<%= checkID %>">내가 쓴 리뷰 보기</a><br>
      <a class="Infobottom" href="updateUserInfo.cafe?MEMBER_ID=<%=checkID%>">내 정보 수정</a><br>
      
        <hr>
      <span>MY 활동</span><br>
      <a href="#">문의하기</a><br>
      <a class="Infobottom" href="#">문의내역 확인</a><br>
      </div>
      
    </td>
    <td class="tg-0pky getInfo">
    <div id="UpdateList">
<form action="updateUserInfo.cafe" method="post" enctype="multipart/form-data">
<input type="hidden" name="MEMBER_ID" value="<%= checkID %>">
	<table class="tg" id="UserTable">
    <thead>
      <tr>
        <td colspan="3" class="makeOutLine"><h3 id="UserInfoChangeH3">회원 정보 수정</h3>
        </td>
      </tr>
    </thead>
<tbody>
  <tr>
    <td class="tg-0pky firstBox makeOutLine">닉네임</td>
    <td class="tg-0pky makeOutLine"  colspan="2"><input type="text" name="MEMBER_NICKNAME" placeholder="nickname" class="aboutUserInfoEdit" id="UpdateMEMBERNickname"></td>
  </tr>
  <tr>
    <td class="tg-0pky firstBox makeOutLine">이메일</td>
    <td class="tg-0pky makeOutLine" colspan="2"><input type="text" name="MEMBER_EMAIL" placeholder="email" id="joinMemberEmail" class="aboutUserInfoEdit"></td>
  </tr>
  <tr>
    <td class="tg-0pky firstBox makeOutLine" rowspan="3">비밀번호</td>
  </tr>
  <td>
      <label for="NewPW" class="changePW">새 비밀번호</label><input type="password" name="MEMBER_PW" placeholder="" class="aboutUserInfoEdit aboutPW" id="NewPW">
    </td>
  <tr>
  <td class="makeOutLine2">
    <label for="reNewID" class="changePW">비밀번호 다시 입력</label><input type="password" class="aboutUserInfoEdit aboutPW" id="reNewPW"><span id="PWFail"></span><span id="PWFailchange">비밀번호가 동일하지 않습니다</span>
  </td>    
  </tr>
  <tr>
    <td class="tg-0pky firstBox makeOutLine">전화번호</td>
    <td class="tg-0pky makeOutLine"  colspan="2"><input type="tel" name="MEMBER_MOBILE" placeholder="010" value="010" class="aboutUserInfoEdit editTel"id="joinMemberMobilesecond"> - <input type="tel" name="MEMBER_MOBILE" placeholder="" class="aboutUserInfoEdit editTel"> - <input type="tel" name="MEMBER_MOBILE" placeholder="" class="aboutUserInfoEdit editTel"id="joinMemberMobilethird">
    </td>
  </tr>
  <tr>
    <td class="tg-0pky firstBox makeOutLine">생일</td>
    <td class="tg-0pky makeOutLine"  colspan="2"><input type="text" name="MEMBER_BIRTH" placeholder="연도 4자 " class="aboutUserInfoEdit birth" id="joinMemberYear">
	<select name="MEMBER_BIRTH" class="aboutUserInfoEdit birth" id="userInfoMonth">
    <option disabled selected>월</option>
		<c:forEach items="${MONTH_SELECT }" var="option">
			<option value="${option.value }">${option.key }
		</c:forEach>
	</select>
	<input type="text" name="MEMBER_BIRTH" placeholder="일" class="aboutUserInfoEdit birth" id="joinMemberDay"></td>
  </tr>
  <tr>
    <td colspan="2" class="updateUserInfo makeOutLine">	<input type="submit" value="회원 정보 업데이트" id="updateUserInfo">
   <a id="deleteUser" href="deleteUserInfo.cafe">회원 탈퇴</a>
    </td>
  </tr>
</tbody>
</table>

</form>
</div>
    </td>
  </tr>
   <tr >
  <td colspan="2" class="getHR">
  </td>
  </tr>
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
$(function(){

	$('html').click(function(){
	  if($('#NewPW').length && $('#reNewPW').length){ // #NewPW와 #reNewPW 요소가 있는지 확인
	    if($('#NewPW').val() !== $('#reNewPW').val()){ // 비밀번호가 일치하지 않는 경우
	      $('#PWFail').html('비밀번호가 동일하지 않습니다.').show(); // #PWFail 요소에 텍스트 추가 및 표시
	      $('#PWFailchange').hide();
	    }else{
	      $('#PWFail').hide(); // 비밀번호가 일치하는 경우 #PWFail 요소 숨김 처리
	      $('#PWFailchange').show();
	    }
	  }
	});

	  
	  
	  $('#updateUserInfo').click(function(){
	    if(!$('#UpdateMEMBERNickname').val()){
	      alert('닉네임을 체크해주세요');
	      $('#UpdateMEMBERNickname').focus();
	      return false;
	    }else if(!$('#NewPW').val()){
	      alert('비밀번호를 체크해주세요');
	      $('#NewPW').focus();
	      return false;
	    }else if($('#NewPW').val() < 8){
	      alert('비밀번호를 8자 이상 작성해주세요');
	      $('#NewPW').focus();
	      return false;
	    }else if(!$('#UpdateMEMBERNickname').val()){
	      alert('닉네임을 체크해주세요');
	      $('#UpdateMEMBERNickname').focus();
	      return false;
	    }else if(!$('#joinMemberEmail').val()){
	      alert('이메일을 체크해주세요');
	      $('#joinMemberEmail').focus();
	      return false;
	    }else if(!$('#joinMemberMobilesecond').val()){
	      alert('전화번호를 체크해주세요');
	      $('#joinMemberMobilesecond').focus();
	      return false;
	    }else if(!$('#joinMemberMobilethird').val()){
	      alert('전화번호를 체크해주세요');
	      $('#joinMemberMobilethird').focus();
	      return false;
	    }else if(!$('#joinMemberYear').val()){
	      alert('생일을 체크해주세요');
	      $('#joinMemberYear').focus();
	      return false;
	    }else if(!$('#joinMemberDay').val()){
	      alert('생일을 체크해주세요');
	      $('#joinMemberDay').focus();
	      return false;
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
	});
</script>
</body>
</html>