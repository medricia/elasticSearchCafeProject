<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String checkIn = (String)session.getAttribute("LoginMEMBER");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@include file="/WEB-INF/views/def/header.jsp"%>
<body>
<pre>
북마크가 생성되었습니다!
확인하시겠습니까?

주의!) Session에 저장된 MEMBER_ID 데이터를 요구하기 때문에 로그인 한 상태로 클릭하셔야 오류가 뜨지 않습니다.

<a href="getBookmarkList.cafe?MEMBER_ID=<%= checkIn %>">Read 북마크(로그인 필요!) </a>
<% response.sendRedirect("getBookmarkList.cafe?MEMBER_ID=" + checkIn); %>
</pre>
</body>
</html>