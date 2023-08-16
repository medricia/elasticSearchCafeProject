<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	메뉴 데이터를 가져오는 창입니다.
	
	<c:forEach items="${cafeMenuList}" var="userInfo">
	카페 등록 넘버: ${cafeMenuList.cafe_Menu_ID}<br>
	카페 메뉴 넘버: ${cafeMenuList.cafe_Menu_ID}<br>
	카페 메뉴: ${cafeMenuList.cafe_Menu}<br>
	가격: ${cafeMenuList.cafe_Menu_Price}<br>
		
	</c:forEach>
	
</body>
</html>