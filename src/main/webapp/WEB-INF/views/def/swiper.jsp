<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<meta charset="utf-8" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script type="text/javascript"
	src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script type="text/javascript"
	src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>
<style type="text/css">

@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
:after, :before, * {
	box-sizing: border-box;
}


 .swiper-slide {
	overflow: hidden;
	color: #fff;
}





 .slide-title h2 {
	font-size: 100px;
	font-weight: 600;
	line-height: 1;
	margin: 0 0 40px;
	text-transform: capitalize;
	transition: all .4s ease;
}




.textbox{
	position:absolute;
	bottom:30%;
	left:10%;

}
div.carousel{
top: -10px;
}
.carousel-control-next, .carousel-control-prev,span.carousel-control-next-icon,span.carousel-control-prev-icon{
position:absolute;
translate:(50%,50%);
color :white;


}
img.d-block.w-100 {
	display: block;
	margin: 0px auto;
	flex-direction: row;
	position: relative;
	align-items: center;
	object-fit: cover;
	object-position: center;
	 background-position: center;
	 background-repeat: no-repeat;
	aspect-ratio: 3/1;
	height: 600px;
	vertical-align: middle;
	transform-origin: center;

	
}
div.carousel-inner{



}
</style>

<body>
	<div id="carouselExampleDark" class="carousel carousel-dark slide">
		<div class="carousel-inner">
			<!--1 페이지  -->
			<div class="carousel-item active">
				<img src="https://i.imgur.com/tqUZMQI.png" class="d-block w-100" alt="...">
			</div>
			<!-- 2 페이지  -->
			<div class="carousel-item">
				<img src="https://i.imgur.com/hIlZ9gu.png" class="d-block w-100" alt="...">
				
			</div>
			<!-- 3 페이지  -->
			<div class="carousel-item">
				<img src="https://i.imgur.com/X84FQoU.png" class="d-block w-100" alt="...">
				
			</div>
			<div class="carousel-item">
				<img src="https://i.imgur.com/98elXue.png" class="d-block w-100" alt="...">
			
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="prev" >
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>

	</div>
</body>



</html>