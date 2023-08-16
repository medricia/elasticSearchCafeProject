<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String checkIn = (String)session.getAttribute("LoginMEMBER");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- 카페 메뉴 리스트를 가져오는 창입니다.<br>
<hr> -->
<div id="list">
	<c:forEach items="${MENU}" var="MENU">
	<div hidden="">카페 등록 넘버: ${MENU.cafe_ID}<br>
	카페 메뉴 넘버: <a href="updateCafeMenu.cafe?cafe_Menu_ID=${MENU.cafe_Menu_ID}">${MENU.cafe_Menu_ID}</a><br></div>
	카페 메뉴: ${MENU.cafe_Menu}<br>
	가격: ${MENU.cafe_Menu_Price}<br>
	
	
	
	<hr>
	
	<%

try{

if(checkIn.equals("admin")){
%>
<hr><br>
	<div id="admin">
		<a  href="deleteCafeMenu.cafe?cafe_Menu_ID=${MENU.cafe_Menu_ID }" class="spacing goBack" >삭제</a> &nbsp;

	</div>


<%
}
}
catch(Exception e){
	
}
%>	
	
	
<!-- 	<a href="insertCafeMenu.cafe">메뉴 생성</a> -->
	
	</c:forEach>	


</div>
</body>
</html>