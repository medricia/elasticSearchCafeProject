<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="/WEB-INF/views/def/header.jsp"%>
<link href="<%= request.getContextPath() %>/resources/css/font.css"  rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/resources/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="margin1100px">
<table width=100%>
<thead>
  <tr>
    <th class="th_board"align="left" height="150">공지사항</th>
  </tr>
</thead>

</table>
	
	
<div class="li_board">
	<ul class="li_header">
		<li class="no" >No</li>
		<li class="tit">제목</li>
		<li class="name">글쓴이</li>
		<li class="date">작성시간</li>
	</ul>

<c:forEach items="${AnnoList }" var="AnnoList">
	
	<ul class="li_body holder">
		<li class="count">${AnnoList.ANNO_ID }</li>
		<li class="tit show_right_tools">
			<a href="GetAnno.cafe?ANNO_ID=${AnnoList.ANNO_ID }" class="tit_ico noDecoration boardSubjectColor">
					<span class="boardSubject">${AnnoList.ANNO_TITLE }</span>
			</a>
		</li>
		<li class="name">운영자</li>
		<li class="time">${AnnoList.ANNO_DATE }</li>
	</ul>
</c:forEach>
</div>

<div style="text-align: center; margin-top: 20px; ">
<% if(nowpage > 1){%>
	<a href = "GetAnnoList.cafe?page=<%= nowpage - 1 %>" class="backstep" >이전</a>
	<%} else { out.print("<span class='backstep'> 이전 </span>");}%>
	<div class='boardNumberContainer' style="display:inline;">
	<%
	for(int i=1; i<= endPage; i++){
		if(i == nowpage){
			out.print("<span class='highlight'>"+ i +"</span>");
		}else{
%>
		<a href="GetAnnoList.cafe?page=<%= i %>" class='boardNumber'><%= i %></a>
<%
		}
	}
%>
	
<% if(nowpage < endPage){%>
	<a href = "GetAnnoList.cafe?page=<%= nowpage + 1 %>" class="frontstep" style="display:inline;" >다음</a>
<%} else { out.print("<span class='frontstep'> 다음 </span>");} %>
</div>
</div>
<%
try{					
if (checkID.equals("admin")) {
%>
					
<div class="detail"><a class="addBoard" href="AnnoInsert.cafe">글쓰기</a></div>
					<%
					} else {
					}
}catch(Exception e){}
					%>

</div>


		
</body>
</html>