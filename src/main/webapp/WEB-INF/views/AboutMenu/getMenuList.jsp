<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
<!-- 카페 메뉴 리스트를 가져오는 창입니다.<br>
<hr> -->

	<c:forEach items="${MENU}" var="MENU">
		<div hidden="">카페 등록 넘버: ${MENU.cafe_ID}<br>
		카페 메뉴 넘버: <a href="updateCafeMenu.cafe?cafe_Menu_ID=${MENU.cafe_Menu_ID}">${MENU.cafe_Menu_ID}</a><br></div>
		카페 메뉴: ${MENU.cafe_Menu}<br>
		가격: ${MENU.cafe_Menu_Price}<br>
		<a href="deleteCafeMenu.cafe?cafe_Menu_ID=${MENU.cafe_Menu_ID }">삭제</a>
		<hr>
	
<!-- 	<a href="insertCafeMenu.cafe">메뉴 생성</a> -->
	
	</c:forEach>	

<% 

response.sendRedirect("getCafeList.cafe"); %>

</body>
</html>