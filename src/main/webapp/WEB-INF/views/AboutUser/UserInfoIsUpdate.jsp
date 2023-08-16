<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@include file="/WEB-INF/views/def/header.jsp"%>
<body>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(function(){
	alert("수정되었습니다!")
})
</script>
<% response.sendRedirect("getUserInfo.cafe?MEMBER_ID="+checkID); %>
</body>
</html>