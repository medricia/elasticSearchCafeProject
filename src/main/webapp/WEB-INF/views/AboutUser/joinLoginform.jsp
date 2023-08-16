<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinloginform</title>
<link href="<%= request.getContextPath() %>/resources/css/aboutuser/logincss.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="joinLoginForm">
    <form action="joinMember.cafe" method="post">
<table class="tg">
<thead>
  <tr>
    <th class="tg-0lax"></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax" colspan="5"><label for="joinMemberID" class="loginformlabel">아이디</label></td>
  </tr>
  <tr>
    <td class="tg-0lax"  colspan="5"><input type="text" name="MEMBER_ID" id="joinMemberID" class="loginform" placeholder="id"></td>
  </tr>
  <tr>
     <td colspan="5" class="goright"><input type="button" class="checkID" value="아이디 중복 확인"></td>
  </tr>
  <tr>
    <td class="tg-0lax"  colspan="5"><label for="joinMemberPW" class="loginformlabel">비밀번호</label></td>
  </tr>
  <tr>
    <td class="tg-0lax"  colspan="5"> <input type="password" name="MEMBER_PW" id="joinMemberPW" class="loginform" placeholder="password"></td>
  </tr>
  <tr>
  <td  colspan="5">
  <p id="pwcheckfail" style="color:red; display:none">비밀번호가 다릅니다.</p>
  <p id="pwchecksuccess" style="color:blue; display:none">비밀번호가 일치합니다.</p>
  </td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"><label for="joinMemberPWcheck" class="loginformlabel">비밀번호 확인</label></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"><input type="password" id="joinMemberPWcheck" class="loginform" placeholder="check password"></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"><label for="joinMemberNickname" class="loginformlabel">별명</label></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"><input type="text" name="MEMBER_NICKNAME" id="joinMemberNickname" class="loginform" placeholder="nickname"></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"><label for="joinMemberName" class="loginformlabel">이름</label></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"> <input type="text" name="MEMBER_NAME" id="joinMemberName" class="loginform" placeholder="name"></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"> <label for="joinMemberEmail" class="loginformlabel">이메일</label></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"> <input type="text" name="MEMBER_EMAIL" id="joinMemberEmail" class="loginform" placeholder="email"></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"><label for="joinMemberMobilesecond" class="loginformlabel">전화번호</label></td>
  </tr>
  <tr>
    <td class="tg-0lax"><input type="tel" name="MEMBER_MOBILE" id="joinMemberMobile" class="loginform getmobile" placeholder="010" value="010"></td>
    <td><span class="mobile">-</span></td>
    <td> <input type="tel" name="MEMBER_MOBILE" id="joinMemberMobilesecond" class="loginform getmobile"></td>
    <td><span class="mobile">-</span></td>
    <td> <input type="tel" name="MEMBER_MOBILE" id="joinMemberMobilethird" class="loginform getmobile"></td>
  </tr>
  <tr>
  <td colspan="5">
   <p id="mobilecheckfail" style="color:red; display:none">4글자로 입력해주십시오.</p>
  </td>
  </tr>
  <tr>
    <td class="tg-0lax"><label for="joinMemberYear" class="loginformlabel">생일</label></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="2"> <input type="text" name="MEMBER_BIRTH" id="joinMemberYear" class="loginform getDate" placeholder="년 4자"></td>
    <td colspan="1"><select name="MEMBER_BIRTH" id="joinMemberMonth" class="loginform getDate">
        <option disabled selected>월</option>
        <c:forEach items="${MONTH_SELECT }" var="option">
          <option value="${option.value }">${option.key }
        </c:forEach>
      </select></td>
    <td colspan="2"> <input type="text" name="MEMBER_BIRTH" placeholder="일" id="joinMemberDay" class="loginform getDate"></td>
  </tr>
  <tr>
  <td colspan="5">
  	<p id="yearcheckfail" style="color:red; display:none">4글자로 입력해주십시오.</p>
      <p id="daycheckfail" style="color:red; display:none">2글자로 입력해주십시오.</p>
  </td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"><label for="joinMembergender" class="loginformlabel">성별</label></td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="5"> 
      <select name="MEMBER_GENDER" id="joinMembergender" class="loginform loginsubmit" width="180">
        <option disabled selected>성별을 선택해주세요</option>
        <c:forEach items="${GENDER_SELECT }" var="option">
          <option value="${option.value }">${option.key }
        </c:forEach>
      </select></td>
  </tr>
  <tr>
  <td colspan="5">
  <input type="submit" id="joinMemberSubmit" class="loginform loginsubmit" value="가입하기">
  </td>
  </tr>
</tbody>
</table>
</form>
</div>

<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(function(){
	  var selectTarget = $('.selectbox select');

	   selectTarget.change(function(){
	     var select_name = $(this).children('option:selected').text();
	     $(this).siblings('label').text(select_name);
	   });
	  
	var popUp;

	
	$('.checkID').click(function(){
		if($('#joinMemberID').val() != ''){
			sessionStorage.setItem("getIDsession", $('#joinMemberID').val());
			popUp = window.open("checkID.cafe", "IDcheck", "menubar=no, toolbar=no width=500, height=500");
			popUp.addEventListener('load', function() {
				
		        popUp.onbeforeunload = function() {
		            var getIDcheck = sessionStorage.getItem("IDcheck");
		        };
		    });	
		}else{
			alert("ID를 입력해주십시오.");
		}
	});
	
		
	var pw = $('#joinMemberPW');
	var pwCheck = $('#joinMemberPWcheck');
	$('html').on('click keydown', function(event){
		  // 클릭 이벤트 또는 탭 키 이벤트를 처리함
		  if(event.type === 'click' || (event.type === 'keydown' && event.which === 9)){
		    if(pw.val() != '' || pwCheck.val() != ''){
		      if(pw.val() == pwCheck.val()){
		        $('#pwcheckfail').css('display','none');
		        $('#pwchecksuccess').css('display','block');
		      }else{
		        $('#pwcheckfail').css('display','block');
		        $('#pwchecksuccess').css('display','none');
		      }
		    }else{
		      $('#pwcheckfail').css('display','none');
		      $('#pwchecksuccess').css('display','none');
		    }
		  }
		});

	  
	var checkyear = $('#joinMemberYear');
	if(checkyear.val() != ''){
	  if(isNaN(checkyear.val())){
	    $('#yearcheckfail').html('숫자를 입력해주세요.');
	    $('#yearcheckfail').css('display','block');
	  }else if(checkyear.val().length != 4){
	    $('#yearcheckfail').css('display','block');  
	  }else{
	     $('#yearcheckfail').css('display','none');
	  }
	}else{
	  $('#yearcheckfail').css('display','none');
	}
	  var checkday = $('#joinMemberDay');
	  if(checkday.val() != ''){
	  if(isNaN(checkday.val())){
	    $('#daycheckfail').html('숫자를 입력해주세요.');
	    $('#daycheckfail').css('display','block');
	  }else if(checkday.val().length != 2){
	    $('#daycheckfail').css('display','block');  
	  }else{
	     $('#daycheckfail').css('display','none');
	  }
	}else{
	  $('#daycheckfail').css('display','none');
	}
	var checksecond = $('#joinMemberMobilesecond');
	var checkthird = $('#joinMemberMobilethird');
	  
	if(checksecond.val() != ''){
	  if(isNaN(checksecond.val())){
	    $('#mobilecheckfail').html('숫자를 입력해주세요.');
	    $('#mobilecheckfail').css('display','block');
	  }else if(checksecond.val().length != 4){
	    $('#mobilecheckfail').css('display','block');  
	  }else{
	     $('#mobilecheckfail').css('display','none');
	  }
	}else{
	  $('#mobilecheckfail').css('display','none');
	}
	 
	 if(checkthird.val() != ''){
	  if(isNaN(checkthird.val())){
	    $('#mobilecheckfail').html('숫자를 입력해주세요.');
	    $('#mobilecheckfail').css('display','block');
	  }else if(checkthird.val().length != 4){
	    $('#mobilecheckfail').css('display','block');  
	  }else{
	     $('#mobilecheckfail').css('display','none');
	  }};
	  
		
		$('#joinMemberID').on('keypress', function(event) {
			  if (event.keyCode === 13) {
			    event.preventDefault(); // 폼 제출 방지
			    if ($(this).val() !== '') {
			      sessionStorage.setItem('getIDsession', $(this).val());
			      var popUp = window.open('checkID.cafe', 'IDcheck', 'menubar=no, toolbar=no, width=500, height=500');
			      popUp.addEventListener('load', function() {
			        popUp.onbeforeunload = function() {
			          var getIDcheck = sessionStorage.getItem('IDcheck');
			        };
			      });  
			    } else {
			      alert('ID를 입력해주세요.');
			    }
			  }
			});
		
		$('#joinMemberSubmit').on('keydown', function(e){
		  if (e.keyCode === 13) {
		    if(!$('#joinMemberID').val()){
		      alert('아이디를 체크해주세요');
		      $('#joinMemberID').focus();
		      return false;
		    }else if(sessionStorage.getitem("IDcheck") == 'No'){
		        alert('아이디가 중복되었습니다.');
		        return false;
		      }else if(!$('#joinMemberPW').val()){
		      alert('비밀번호를 체크해주세요');
		      $('#joinMemberPW').focus();
		      return false;
		    }else if(sessionStorage.getitem("IDcheck") == 'No'){
		      alert('아이디가 중복되었습니다.')
		      return false;
		    }else if($('#joinMemberPWcheck').val() != $('joinMemberPW').val()){
		      alert('패스워드가 일치하지 않습니다. 다시 확인해주세요.')
		      return false;
		    }else if(!$('#joinMemberNickname').val()){
		      alert('닉네임을 체크해주세요');
		      $('#joinMemberNickname').focus();
		      return false;
		    }else if(!$('#joinMemberName').val()){
		      alert('이름을 체크해주세요');
		      $('#joinMemberName').focus();
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
		    }else if(!$('#joinMemberMonth').val()){
		      alert('생일을 체크해주세요');
		      $('#joinMemberMonth').focus();
		      return false;
		    }else if(!$('#joinMembergender').val()){
		      alert('성별을 체크해주세요');
		      $('#joinMembergender').focus();
		      return false;
		    }else if(getIDcheck == 'No'){
		      alert('아이디를 체크해주세요');
		      $('#joinMemberID').focus();
		      return false;
		    }
		  }
		});

	  $('#joinMemberSubmit').click(function(){
	    if(!$('#joinMemberID').val()){
	      alert('아이디를 체크해주세요');
	      $('#joinMemberID').focus();
	      return false;
	    }else if(!$('#joinMemberPW').val()){
	      alert('비밀번호를 체크해주세요');
	      $('#joinMemberPW').focus();
	      return false;
	    }else if(sessionStorage.getitem("IDcheck") == 'No'){
	    	alert('아이디가 중복되었습니다.')
	    	return false;
	    }else if(!$('#joinMemberPWcheck').val()){
	    	 alert('비밀번호를 체크해주세요');
		      $('#joinMemberPWcheck').focus();
		      return false;
	    }else if($('#joinMemberPWcheck').val() != $('#joinMemberPW').val()){
	    	alert('패스워드가 일치하지 않습니다. 다시 확인해주세요.')
	    	return false;
	    }else if(!$('#joinMemberNickname').val()){
	      alert('닉네임을 체크해주세요');
	      $('#joinMemberNickname').focus();
	      return false;
	    }else if(!$('#joinMemberName').val()){
	      alert('이름을 체크해주세요');
	      $('#joinMemberName').focus();
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
	    }else if(!$('#joinMemberMonth').val()){
	      alert('생일을 체크해주세요');
	      $('#joinMemberMonth').focus();
	      return false;
	    }else if(!$('#joinMembergender').val()){
	      alert('성별을 체크해주세요');
	      $('#joinMembergender').focus();
	      return false;
	    }
	  })
	});
</script>
</body>
</html>