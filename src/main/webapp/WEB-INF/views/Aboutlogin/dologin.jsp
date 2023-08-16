<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link href="<%= request.getContextPath() %>/resources/css/loginForm.css" rel="stylesheet" type="text/css">
<body>

	<%@include file="/WEB-INF/views/def/header.jsp"%>
<div id="Logincontainer">
<div id="mainImgDiv"><a id="gotocafeC" href="index.jsp"><span class="CafeCLogo">Cafe.C</span></a></div>
	<div id="firstDiv" class="dontDrag  marginauto">
	<form action="dologin.cafe" method="post">
		<input type="text" class="id_login" name="MEMBER_ID" size="20" placeholder="아이디"><br>
		<input type="password" class="password_login" name="MEMBER_PW" size="20" placeholder="비밀번호"><br>
		<input type="submit" class="btn_login" id="submit" value="로그인" size="20">
	</form>
</div>

<div id="secondDiv" class=" marginauto">
	<a class="search" href="#">비밀번호 찾기</a><span class="dontDrag">  |  </span>
	<a class="search" href="#">아이디 찾기</a><span class="dontDrag">  |  </span>
	<a class="search" href="joinMember.cafe">회원가입</a>
</div>
</div>
</body>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(function(){
	$('.joinus').click(function(){
		location.replace("joinMember.cafe");
	});
});
</script>
</html>