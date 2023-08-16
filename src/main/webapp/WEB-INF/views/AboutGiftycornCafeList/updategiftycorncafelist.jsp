<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프트콘 카페 수정</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>
<link href="<%= request.getContextPath() %>/resources/css/updateFC.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="list">
<hr>
<h3 id="cafe">수정할 카페 이름을 선택해주세요</h3>
<hr>

	<form action="updategiftycornCafeListService.cafe" method="post">
<br>
<table>
  <tr id="thisiscenter">
    <td>
      <select name="GIFTYCORN_CLN" id="checkCLN">
	<optgroup label="">
    <option disabled>변경할 카페 이름을 선택해주세요.</option>
    <c:forEach items="${InfoList}" var="InfoList">
        <option value="${InfoList.GIFTYCORN_CLN }">${InfoList.GIFTYCORN_CAFE_NAME}</option>
    </c:forEach>
    </optgroup>
</select>
    </td>
    <td>
      <span id="changename">➡</span>
    </td>
    <td>
      <input type="text" id="GTCname" name="GIFTYCORN_CAFE_NAME">
    </td>
    <td>
      <input type="submit">
    </td>
  </tr>
    </table>
	</form>
</div>
<script type="text/javascript" src="./resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(function(){
	var check = $('#checkCLN')
	$('p').html();
	
});
</script>
</body>
</html>