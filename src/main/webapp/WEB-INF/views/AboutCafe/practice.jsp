<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.projcafe.cafe.board.repository.ProjCafeVO" %>
<% ProjCafeVO vo = (ProjCafeVO)session.getAttribute("MapInfo"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>



<div id ="maplist"> aaa </div>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4f643e96e766e471123588fdd6983de"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(${MapInfo.CAFE_LAT}, ${MapInfo.CAFE_LONG}), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
<%--
<c:forEach items=${MapInfoList } var="item">
	var positions = [
	{
	    title: 'testetste', 
	    latlng: new kakao.maps.LatLng(${item.CAFE_LAT}, ${item.CAFE_LONG})
	}
	]

	<c:out value="${item.CAFE_LAT}" />
	<c:out value="${item.CAFE_LONG}" />
</c:forEach>
	

function list(item){
}

const arr = ${MapInfoList};
arr.forEach(list);
--%>

//각각 하나의 페이지
var positions = [
	{
	    title: '{MapInfo.CAFE_NAME}', 
	    latlng: new kakao.maps.LatLng(${MapInfo.CAFE_LAT}, ${MapInfo.CAFE_LONG})
	
	]



//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng, // 마커를 표시할 위치
    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
}
</script>
</body>
</html>