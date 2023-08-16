<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% session.setAttribute("MEMBER_ID", "admin"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<span style="color:#FF0000;">${InfoList.MEMBER_ID }</span><br>
	
	${GiftycornInfo.GIFTYCORN_ID}<br>
	${GiftycornInfo.GIFTYCORN_CLN}<br>
	<img src="<%= request.getContextPath() %>/${GiftycornInfo.GIFTYCORN_IMAGE_LOCATION}" ><br>
	파일 위치: <%= request.getContextPath() %>/${GiftycornInfo.GIFTYCORN_IMAGE_LOCATION}
	${GiftycornInfo.GIFTYCORN_START_DATE}<br>
	${GiftycornInfo.GIFTYCORN_LIMIT_DATE}<br>
	${GiftycornInfo.GIFTYCORN_MEMO}<br>
	
	<a href="deletegiftycorn.cafe?GIFTYCORN_ID=${GiftycornInfo.GIFTYCORN_ID}">삭제</a>
	<a href="updategiftycorn.cafe?GIFTYCORN_ID=${GiftycornInfo.GIFTYCORN_ID}">수정</a>
</body>
</html>