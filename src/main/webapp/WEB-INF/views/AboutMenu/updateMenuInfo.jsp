<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String name = request.getParameter("Cafe_ID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 수정폼</title>
</head>
<link href="<%= request.getContextPath()%>/resources/css/aboutuser/UpdateMenuCSS.css" rel="stylesheet" type="text/css">
<%@include file="/WEB-INF/views/def/header.jsp"%>
<body>
<c:if test="${not empty MENU}">
<div id="list">
<h3 id="cafe">수정할 메뉴를 선택해주세요</h3>
<hr>

	<form action="updateCafeMenu.cafe?Cafe_ID=<%= name %>" method="post">
<br>
<table>
  <tr id="thisiscenter">
    <td colspan="4">
      <select name="cafe_Menu_ID" id="checkCLN">
	<optgroup label="">
    <option disabled>수정하실 카페 메뉴를 선택해주세요</option>
    <c:forEach items="${MENU}" var="MENU">
        <option value="${MENU.cafe_Menu_ID }">${MENU.cafe_Menu}</option>
    </c:forEach>
    </optgroup>
</select>
    </td>
  </tr>
  <tr class="hrTable">
    <td colspan="4">
    </td>
  </tr>
  <tr id="menuNameTR">
    <td>
      <span id="menuName">메뉴 이름</span>
    </td>
    <td>
      <input type="text" class="GTCname" name="cafe_Menu">
    </td>
    <td>
          <span id="menuprice">가격</span>
    </td>
    <td>
            <input type="text" class="GTCname" name="cafe_Menu_Price">
      <input type="submit" value="수정하기">
    </td>
    </table>

<br>
<br>
	</form>
</div>
</c:if>
<c:if test="${empty MENU}">

<div id="giftyProPcontainer">
	<div id="giftyProP">
        <p class="giftyProposal">아직 메뉴를 등록하지 않으셨습니다!</p>
        <p>
          </p><div id="giftyProPbox">
        <span class="yesgifty">메뉴 등록하러가기</span>
        </div>
      </div>
</div>

</c:if>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(function(){
	var goLink = $('#giftyProPcontainer')
	
	goLink.click(function(){
		history.back();
	})
})
</script>
</body>
</html>