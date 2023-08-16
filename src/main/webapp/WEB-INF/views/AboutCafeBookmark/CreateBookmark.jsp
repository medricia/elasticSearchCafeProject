<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String checkIn = (String)session.getAttribute("LoginMEMBER");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마크 생성</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>
<style type="text/css">
	#number{margin: 0; padding: 0;}
	#list{text-align: center;}
	#cafe{text-align: center; color: #481810; font-weight: bold;}

	#name{color: #481810; font-weight: bold;}
	#location{color: #481810; font-weight: bold;}
	#time{color: #481810; font-weight: bold;}
	#call{color: #481810; font-weight: bold;}
	#sns{color: #481810; font-weight: bold;}
	#intro{color: #481810; font-weight: bold;}
	hr{width: 500px; color:black; border: thin solid black; margin:0 auto;}
</style>
</head>
<body>
<br><br>
<h3 id="cafe">북마크를 생성해주세요</h3>
<hr>
<br>
<div id="list">
<form action="createBookmark.cafe" method="post" enctype="multipart/form-data">
	<div id="name"><input type="hidden" name="MEMBER_ID" value = "<%= checkIn %>" placeholder="nickname" style="width:250px;height:25px; margin: 10px; font-weight: bold;"><br></div>
	<div id="name"><input type="hidden" name="CAFE_ID" value="${CafeID }">
	</div>
	<div id="name"><input type="text" name="CAFE_BOOKMARK_MEMO" placeholder="CAFE_BOOKMARK_MEMO" style="width:250px;height:25px; margin: 10px; font-weight: bold;"><br></div>
	<hr><br>
	<input type="submit" value="등록" style="background: black; color: white; width: 50px; height: 30px;">
</form>
</div>
</body>
</html>