<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프트콘 카페 목록 제거</title>
<link href="<%=request.getContextPath() %>/resources/css/deleteFLList.css" rel="stylesheet" type="text/css">
</head>

<%@include file="/WEB-INF/views/def/header.jsp"%>
<body>
<div id="list">
  <h3>삭제할 프렌차이즈를 선택해주세요</h3>
  <hr>
<form action="deletegiftycornCafeListService.cafe" method="post">
		
<select name="GIFTYCORN_CLN" id="checkCLN">
	<optgroup label="">
    <option disabled>삭제할 카페 이름을 선택해주세요.</option>
    <c:forEach items="${InfoList}" var="info">
        <option value="${info.GIFTYCORN_CLN }">${info.GIFTYCORN_CAFE_NAME}</option>
    </c:forEach>
    </optgroup>
</select>

<input type="submit" value="삭제">
</form>
</div>
</body>
</html>