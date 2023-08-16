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
	<%-- 0504 수정 --%>
	리뷰 삭제창입니다.
	<% response.sendRedirect("getCafeReviewList.cafe?MEMBER_ID="+checkID); %>
</body>
</html>