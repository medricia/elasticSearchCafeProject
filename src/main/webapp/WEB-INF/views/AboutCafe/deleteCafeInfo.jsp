<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 목록 제거</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>
<style type="text/css">
 #list{ text-align: center; margin: 30px;}
</style>
</head>
<body>

<script type="text/javascript">
	alert("카페 정보가 삭제되었습니다")
</script>	
	<div id="list">
		<a href="getCafeList.cafe" >카페 리스트 페이지로 돌아가기</a>
	</div>
	
	<% response.sendRedirect("getCafeList.cafe?reset=true"); %>
</body>
</html>