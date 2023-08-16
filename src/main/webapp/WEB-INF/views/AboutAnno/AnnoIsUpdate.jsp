<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

업데이트 되었습니다!
확인하시겠습니까?

<a href="GetAnno.cafe?Anno_ID=${AnnoInfo.ANNO_ID }">확인하기</a>
<% response.sendRedirect("GetAnnoList.cafe"); %>
</body>
</html>