<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.projcafe.cafe.Anno.AnnoVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${AnnoInfo.ANNO_TITLE }</title>
<link href="<%= request.getContextPath() %>/resources/css/font.css"  rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/resources/css/index.css" rel="stylesheet" type="text/css">

<%@include file="/WEB-INF/views/def/header.jsp"%>
</head>
<body>
<div id="Readannocontainer">
<div id="Readanno"><a style="text-decoration: none; color:black;" href="GetAnnoList.cafe">공지사항</a>
</div>
<div id="annoHR"></div>

<div id="table">
<table class="tg" cellpadding="0" cellspacing="0" align="center" valign="middle">
		  <tr>
		    <td class="tg-0pky BoardName">운영자</td>
		  </tr>
		  <tr>
		    <td class="tg-0pky BoardSubject">${AnnoInfo.ANNO_TITLE }</td>
		  </tr>
		   <tr bgcolor="#ccc">
		  	<td colspan="2" style="height: 1px;"></td>
		  </tr>
		   <tr>
			  	<td colspan="2">&nbsp;</td>
			  </tr>
		  <tr>
		    <td class="tg-0pky detail" >
				<div class="textareaview">
   <c:if test="${! empty AnnoInfo.ANNO_IMAGE}"><img id="textImg" src="<%= request.getContextPath()%>/${AnnoInfo.ANNO_IMAGE }"><br></c:if>
          <textarea readonly id="annocontextarea">${AnnoInfo.ANNO_CONTEXT }</textarea>
          </div>	
		    </td>
		  </tr>
		  <tr bgcolor="#ccc">
		  	<td colspan="2" style="height: 1px;"></td>
		  </tr>
		  		  <tr>
		    <td class="tg-0pky classification BoardFileTD">
		    </td>
		  </tr>
		  <tr>
		  	<td colspan="2">&nbsp;</td>
		  </tr>
		  <tr>
		  <%
try{					
if (checkID.equals("admin")) {
%>
			    <td class="tg-0pky buttons" colspan = "5" style="text-align: right; padding-right: 10px;">
			    	<a href="UpdateAnno.cafe" class="spacing submit">수정</a>
			    	<a href="DeleteAnno.cafe?ANNO_ID=${AnnoInfo.ANNO_ID }" class="spacing goBack">삭제</a>
			    </td>
<%
					} else {
					}
}catch(Exception e){}
					%>
			  </tr>
	</table>
</div>
</div>
<br>
<br>
<br>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/textarea.js"></script>
<script>
  $(document).ready(function() {
    autosize($('#annocontextarea'));
  });
</script>
</body>
</html>