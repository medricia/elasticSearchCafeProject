<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 리스트</title>

<link href="<%= request.getContextPath() %>/resources/css/aboutuser/getUserListCSS.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resources/css/aboutuser/updateUserInfo.css" rel="stylesheet" type="text/css">
<%@include file="/WEB-INF/views/def/header.jsp"%>
<style type="text/css">
	#number{margin: 0; padding: 0;}
	#list{text-align: center;}
	#cafe{color: blue; text-align: center;}
</style>
</head>
<body>
<div id="list">
<table class="tg" id="RealUserInfo">
<thead>
  <tr>
    <td colspan="2" id="UsertableHeader">회원 정보</td>
  </tr>
  <tr >
  <td colspan="2" style="width:1800px; margin:0px;">
  </td>
  </tr>
        </thead>
<tbody>
<c:forEach items="${userInfolist}" var="userInfolist">
<tr>
<td>
<br>
</td>
<tr>
  <tr>
    <td class="tg-0pky usertablefront">아이디</td>
    <td class="tg-0lax usertableback">${userInfolist.MEMBER_ID}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">닉네임</td>
    <td class="tg-0lax usertableback">${userInfolist.MEMBER_NICKNAME}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">이름</td>
    <td class="tg-0lax usertableback">${userInfolist.MEMBER_NAME}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">이메일</td>
    <td class="tg-0lax usertableback">${userInfolist.MEMBER_EMAIL}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">모바일</td>
    <td class="tg-0lax usertableback">${userInfolist.MEMBER_MOBILE}</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">생일</td>
    <td class="tg-0lax usertableback">${userInfolist.MEMBER_BIRTH }</td>
  </tr>
  <tr>
    <td class="tg-0lax usertablefront">가입일</td>
    <td class="tg-0lax usertableback">${userInfolist.MEMBER_JOIN_DATE}</td>
  </tr>
  </c:forEach>
</tbody>

</table>

</div>

	
</body>
</html>