<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%

	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	
	String searchKeyword=request.getParameter("searchKeyword");
	String searchCondition = request.getParameter("searchCondition");

%>
 --%>
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
    <form id="searchForm" action="getname" method="get">
        <div align="center">
            <input type="text" name="name" id="searchInput" value="<%= request.getParameter("name") %>"/>
             <input type="hidden" name="lat" id="latInput" value="0">
        	<input type="hidden" name="lon" id="lonInput" value="0">
             <input type="submit" value="검색" />
        </div>
    </form>
</div>
	</div>	
	</div>

	<div id="RealcafeListContainer">
	<div id="cafeListContainerDiv">
	<c:forEach items="${elastic}" var="cafeList">
	<span hidden="id">아이디(출력x): ${cafeList.cafe_id}</span>
	<div class="news">
		<div class="article-box">
			<div class="article">
				<article class="art-1 art">
				<table>
				<tbody>
					<tr>
					<td><img  style="text-align:center; vertical-align:center; height:200px; width:200px;"alt="cafeimage" src="<%=request.getContextPath()%>/${cafeList.cafe_image}" />
					</td>
					<td>
					<div class="art-text">
						<div class="art-name"> <a href="getCafe.cafe?CAFE_ID=${cafeList.cafe_id}">${cafeList.cafe_name}</a></div>
							<div class="art-location"> ${cafeList.cafe_location}</div>
							<div class="art-intro">${cafeList.cafe_introduction} </div>	
							<div class="see">
							<a href="getCafe.cafe?CAFE_ID=${cafeList.cafe_id}">카페 더 보기<i class="bi bi-chevron-double-right"></i></a><br>	 
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
<%-- <div style="text-align: center; margin-top: 20px; ">
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
</div> --%>
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


//폼 제출 시 검색어를 쿼리 문자열에 추가하여 URL을 생성
document.getElementById("searchForm").addEventListener("submit", function(event) {
	var searchval = $('#searchInput').val();
    var lat = 0;
    var lon = 0;
    if (searchval.indexOf('근처') !== -1 || searchval.indexOf('주변') !== -1) {
        lat = 37.5696298;
        lon = 126.9845087;
        
        if (searchval.indexOf('종각') !== -1) {
            lat = 37.57002838826;
            lon = 126.97962084516;
        } else if (searchval.indexOf('서초') !== -1) {
            lat = 37.491810664483;
            lon = 127.01490282709;
        }
    }

// form 내용 get 방식으로 전달
 var searchValue = document.getElementById("searchInput").value;
 var currentUrl = new URL(window.location.href);
 currentUrl.searchParams.set("name", searchValue);
 currentUrl.searchParams.set("lat",lat);
 currentUrl.searchParams.set("lon",lon);
 window.location.href = currentUrl;
 event.preventDefault();
});

// 저장된 검색어가 있을 경우 해당 검색어를 입력란에 설정
var savedSearch = new URLSearchParams(window.location.search).get("name");
if (savedSearch) {
    document.getElementById("searchInput").value = savedSearch;
}


$(document).ready(function () {

	
    var loading = false;
    var startpage = 1; // 페이지 초기값
    var reachedEnd = false; // 추가 데이터를 가져올 수 없는 상태인지 표시하는 변수
    
    function loadCafes(search) {
        if (loading || reachedEnd) {
            return;
        }
        
        $.ajax({
            type: "GET",
            url: "./getcafename",
            data: {
                name: search,
                startpage: startpage,
                lan: lat,
                lon: lon
            },
            dataType: "json",
            success: function (response) {
            	console.log(response)
                if (response.length > 0) {
                    // 응답 데이터를 반복하여 동적으로 카페 정보를 생성하고 추가합니다.
                    for (var i = 0; i < response.length; i++) {
                        var cafe = response[i];
                        var cafeHtml = '<div class="article-box">' +
                            '<div class="article">' +
                            '<article class="art-1 art">' +
                            '<table>' +
                            '<tbody>' +
                            '<tr>' +
                            '<td><img style="text-align:center; vertical-align:center; height:200px; width:200px;" alt="cafeimage" src="<%=request.getContextPath()%>/' + cafe.cafe_image + '" /></td>' +
                            '<td>' +
                            '<div class="art-text">' +
                            '<div class="art-name"><a href="getCafe.cafe?CAFE_ID=' + cafe.cafe_id + '">' + cafe.cafe_name + '</a></div>' +
                            '<div class="art-location">' + cafe.cafe_location + '</div>' +
                            '<div class="art-intro">' + cafe.cafe_introduction + '</div>' +
                            '<div class="see">' +
                            '<a href="getCafe.cafe?CAFE_ID=' + cafe.cafe_id + '">카페 더 보기<i class="bi bi-chevron-double-right"></i></a><br>' +
                            '</div>' +
                            '</div>' +
                            '</td>' +
                            '</tr>' +
                            '</tbody>' +
                            '</table>' +
                            '</article>' +
                            '</div>' +
                            '</div>';

                        $("#cafeListContainerDiv").append(cafeHtml);
                    }

                    startpage += 1; // 다음 페이지 정보 업데이트
                } else {
                    // 더 이상 데이터가 없을 경우 로딩 메시지를 숨기고 reachedEnd 변수를 true로 설정합니다.
                    $("#loading-message").hide();
                    reachedEnd = true;
                }
            },
            complete: function () {
                setTimeout(function () {
                    loading = false;
                }, 1); // 약 0.1초의 로딩 시간을 추가
            }
        });
    }
    $('#searchForm').submit(function (event) {
        event.preventDefault();
        searchTerm = $('#searchInput').val();
        startpage = 0; 
        reachedEnd = false; 
        loadCafes(searchTerm);
    });

    $(window).scroll(function () {
        var scrollH = $(window).scrollTop() + $(window).height();
        var documentH = $(document).height();
        searchTerm = $('#searchInput').val(); // Update the searchTerm
        if (scrollH >= documentH - 100) {
            loadCafes(searchTerm);
        }
    });
});


</script>

</body>
</html>