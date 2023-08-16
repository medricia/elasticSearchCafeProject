<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	
	String searchKeyword=request.getParameter("searchKeyword");
	String searchCondition = request.getParameter("searchCondition");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 리스트</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>

<link href="<%= request.getContextPath()%>/resources/css/CafeList.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<style type="text/css">

	body{
		background-image: url("<%= request.getContextPath()%>/resources/defaultImage/listBack.png");
		background-repeat: repeat;
	}

</style>
</head>
<body>
<div id="rigthMenuheigth">
<div id="cafeintro">
<span id="alist">Cafe List</span><br>
<span id="cafeside2">"쉼이 필요한 당신을 위해 준비한 향긋하고 아늑한 카페들"</span>
</div>
<div id="RealSearchContainer">
<div id="searchContainer">
<div id="searchFormDiv">
		<form action="getCafeList.cafe?SEARCHKEYWORD=<%= searchKeyword%>">
					<div align="center">
						<input type="text"  name="SEARCHKEYWORD" /> 
						<input type="submit" value="검색" />
				</div>
		</form>
	</div>
	</div>	
	</div>
	<div id="RealcafeListContainer">
	<div id="cafeListContainerDiv">
	<c:forEach items="${cafeList}" var="cafeList">
	<span hidden="id">아이디(출력x): ${cafeList.CAFE_ID}</span>
	<div class="news">
		<div class="article-box">
			<div class="article">
				<article class="art-1 art">
				<table>
				<tbody>
					<tr>
					<td><img  style="text-align:center; vertical-align:center; height:200px; width:200px;"alt="cafeimage" src="<%=request.getContextPath()%>/${cafeList.CAFE_IMAGE}" />
					</td>
					<td>
					<div class="art-text">
						<div class="art-name"> <a href="getCafe.cafe?CAFE_ID=${cafeList.CAFE_ID}">${cafeList.CAFE_NAME}</a></div>
							<div class="art-location"> ${cafeList.CAFE_LOCATION}</div>
							<div class="art-intro">${cafeList.CAFE_INTRODUCTION} </div>	
							<div class="see">
							<a href="getCafe.cafe?CAFE_ID=${cafeList.CAFE_ID}">카페 더 보기<i class="bi bi-chevron-double-right"></i></a><br>	 
							</div>
					</div>
					</td>
					</tr>
				</tbody>
				</table>
					
				</article>
			</div>
		</div>
	</div>
	</c:forEach>
</div>
</div>
<div id="count">
<div style="text-align: center; margin-top: 20px; ">
<% if(nowpage > 1){%>
	<a href = "getCafeList.cafe?page=<%= nowpage - 1 %>" class="backstep" >이전</a>
	<%} else { out.print("<span class='backstep'> 이전 </span>");}%>
	<div class='boardNumberContainer' style="display:inline;">
	<%
	for(int i=startPage; i<= endPage; i++){
		if(i == nowpage){
			out.print("<span class='highlight'>"+ i +"</span>");
		}else{
%>
		<a href="getCafeList.cafe?page=<%= i %>" class='boardNumber'><%= i %></a>
<%
		}
	}
%>
	
<% if(nowpage < endPage){%>
	<a href = "getCafeList.cafe?page=<%= nowpage + 1 %>" class="frontstep" style="display:inline;" >다음</a>
<%} else { out.print("<span class='frontstep'> 다음 </span>");} %>
</div>
</div>
</div>
<br>
<br>
</div>


<div id="rightMenu">
  <div id="GoMenu">
    <a href="getCafeList.cafe">카페 목록 보기</a><br>
    <a href="creategiftycorn.cafe">기프티콘 등록하기</a><br>
    <a href="getUserInfo.cafe?MEMBER_ID=<%= checkID%>">등록한 기프티콘</a><br>
    <a href="getBookmarkList.cafe?MEMBER_ID=<%= checkID%>">북마크 보기</a><br>
    <a href="getCafeReviewList.cafe?MEMBER_ID=<%= checkID%>">내 리뷰 보기</a><br>
  </div>
  <a id="Gotop" href="#">▲top</a>
</div>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
var $rightMenu = $('#rightMenu');
var originalTop = $rightMenu.offset().top; // 초기 위치 저장
var menuHeight = $rightMenu.outerHeight();
var windowHeight = $(window).height();

$(window).scroll(function() {
  var scrollTop = $(this).scrollTop();
  var newPosition = originalTop + scrollTop + ((windowHeight - menuHeight) / 2);

  $rightMenu.stop().animate({ top: newPosition }, 500);
});

	  
</script>

</body>
</html>