<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% session.setAttribute("MEMBER_ID", "admin"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프트콘 리스트</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>
<style type="text/css">
	#number{margin: 0; padding: 0;}
	#list{text-align: center;}
	#cafe{color: blue; text-align: center;}
</style>
</head>
<body>
<h3 id="cafe"># 기프트콘 목록</h3>
<hr>
<div id="list">
<c:forEach items="${InfoList}" var="InfoList" >
	<span style="color:blue;">${getName.NICKNAME}</span><br><br>
	
	<img src="<%= request.getContextPath() %>/${InfoList.GIFTYCORN_IMAGE_LOCATION}" ><br>
	${InfoList.GIFTYCORN_MEMO}<br>
	${InfoList.GIFTYCORN_START_DATE}<br>
	${InfoList.GIFTYCORN_LIMIT_DATE}<br>
	<span hidden="">
	${InfoList.GIFTYCORN_ID}<br>
	파일 위치: <%= request.getContextPath() %>/${InfoList.GIFTYCORN_IMAGE_LOCATION}
	${InfoList.GIFTYCORN_CLN}<br>
	</span>
	<hr>
</c:forEach>
</div>


</body>
</html>