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
<title>Insert title here</title>
</head>
<body>
업데이트 창입니다.

<form action="updateBookmark.cafe" method="post">
	<input type="text" name="MEMBER_ID" value = "<%= checkIn %>" placeholder="nickname"><br>
	<input type="text" name="CAFE_ID" value='${BookmarkInfo.CAFE_ID}'><br>
	<input type="text" name="CAFE_BOOKMARK_MEMO" value="${BookmarkInfo.CAFE_BOOKMARK_MEMO}" placeholder="CAFE_BOOKMARK_MEMO"><br>
	<input type="submit">
</form>

</body>
</html>