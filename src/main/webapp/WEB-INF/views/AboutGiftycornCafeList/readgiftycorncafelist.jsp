<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프트콘 카페 리스트</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>
<link href="<%=request.getContextPath() %>/resources/css/franList.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="giftyCafeListContainer">
<h3 id="cafe">등록된 프렌차이즈 목록입니다.</h3>
<hr>
<div id="list">
  <table>
    <tbody>
              <c:forEach items="${InfoList}" var="InfoList" >
          <tr>
          <td class="CLNumberTD"><span class="CLNumber">${InfoList.GIFTYCORN_CLN }</span></td>
  <td class="ListFNTD"><span class="ListFN">${InfoList.GIFTYCORN_CAFE_NAME}</span><td>
      </tr>
      </c:forEach>

    </tbody>
  </table>
</div>
	<br>
  <div id="buttonDiv">
<a href="creategiftycornCafeListService.cafe">추가</a>
<a href="updategiftycornCafeListService.cafe">수정</a>
<a href="deletegiftycornCafeListService.cafe">삭제</a>
  </div>
</div>

</body>
</html>