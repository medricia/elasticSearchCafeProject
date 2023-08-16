<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>
</head>
<body>
<% response.sendRedirect("updateUserInfo.cafe?MEMBER_ID="+checkID); %>
</body>
</html>