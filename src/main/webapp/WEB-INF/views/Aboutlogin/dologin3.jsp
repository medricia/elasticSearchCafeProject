<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<body style="padding-top: 0;">

	<%@include file="/WEB-INF/views/def/header.jsp"%>

	<section>
		<article>
			<br> <br>
			<h2 class="form-floating mb-3 " align="center">로그인</h2>
		</article>
		<br>
		<form action="dologin.cafe" method="post" class="align-items-center d-grid col-6 mx-auto">
			<div class="row mb-3">
					<label for="inputID"  class="col-sm-2 col-form-label">ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="MEMBER_ID"/>
				</div>
			</div>
			<div  class="row mb-3">
					<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="MEMBER_PW"/>
				</div>
			</div>
			<div class="d-grid gap-2">
				<input class="btn btn-warning text-orange-800" type="submit" value="Log-In">
			<div align="center">아직 가입하지 않으셨나요?</div>
			<input type="button" class="btn btn-warning text-text-orange-800 joinus" value="Join us"/>
		</div>
	</form>
	</section>
	<%@include file="/WEB-INF/views/def/footer.jsp"%>
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