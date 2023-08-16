<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% session.removeAttribute("LoginMEMBER"); %>
<script type="text/javascript">
	$('.logout').click(function(){
		alert('로그아웃 되셨습니다.');
	});
</script>
<% response.sendRedirect("./index.jsp"); %>

</body>
</html>