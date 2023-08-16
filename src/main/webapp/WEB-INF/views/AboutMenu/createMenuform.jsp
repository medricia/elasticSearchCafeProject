<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 메뉴</title>
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
	hr{width: 500px; color:black; border: thin solid black;}
</style>
</head>
<body>
<br><br>
<h3 id="cafe">메뉴를 등록해주세요</h3>
<hr>
<br>
<div id="list">
<form action="/insertCafeMenu.cafe" method="post">
	<input type="hidden" name="cafe_Menu_ID" value="1">
	<input type="hidden" name="cafe_ID" value="1">
	<div id="name">카페메뉴&nbsp;&nbsp;<input type="text" name="cafe_Menu" placeholder="카페 메뉴" style="width:250px;height:25px; margin: 10px; font-weight: bold;"><br></div>
	<div id="name">가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="cafe_Menu_Price" placeholder="가격" style="width:250px;height:25px; margin: 10px; font-weight: bold;"><br></div>
	<hr><br>
	<input type="submit" value="등록" style="background: black; color: white; width: 50px; height: 30px;">
</form>
</div>
</body>
</html>