<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>home</title>
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<script>
	
</script>
<style type="text/css">

</style>

</head>
<body class="p-0 m-0 border-0 bd-example" style="height:1400px">
	<header>
		<%@include file="/WEB-INF/views/def/header.jsp"%>
		</header>
		<section >
			<article  class="article_1"  style="height:600px">

				<%@include file="/WEB-INF/views/def/swiper.jsp"%>
			</article>
			
			
				<br>
					<div class="row" style="height:200px">
						<div class="col-md-2"></div>
						<div class="col-md-6">
							<p class="my-1 text-warning fw-semibold">카페 스토리</p>
							<h2 class="fw-bolder">New Stories</h2>
						</div>
						<div
							class="col-md-2 d-md-flex align-items-center justify-content-end">
							<a class=" text-sm h2 fw-bold" href="getCafeList.cafe?reset=true"> more<i
								class="fi fi-br-angle-double-small-right"></i></a>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			<!--1행  -->
	</div>
	</div>
	</article>
				<div class="container"style="min-height:900px">
					<div class="row g-1 row-cols-3 ">
						<div class="col">
							<div class="card h-100 m-3 p-1">
								<img
									src="https://kaboompics.com/cache/f/8/c/2/2/f8c22b2d6e4f2479f5decf79c4cb93edc2e8feeb.jpeg"
									class="card-img-top rounded" alt="..." width="150" height="200">
								<div class="card-body">
									<h4 class="fw-border">인밸류어블(invaluable)</h4>
									<hr>
									<p class="card-text">서울특별시 용산구 효창원로86가길 30 1층 (청파동1가)</p>
									<h5 class="text-end text-sm fw-bord"><a class="text-end text-sm fw-bord" href="getCafe.cafe?CAFE_ID=93">more<i
								class="fi fi-br-angle-double-small-right"></i></h5></a>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card h-100 m-3 p-1">
								<img
									src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230403_89%2F1680497082428BphP5_JPEG%2F%25C5%25B8%25B8%25A3%25C6%25AE%25B5%25E9.jpg"
									class="card-img-top rounded" alt="..." width="150" height="200">
								</img>
								<div class="card-body">
									<h4 class="fw-border">디저트샵 아띠랑스</h4>
									<hr>
									<p class="card-text">서울특별시 중랑구 겸재로 251 1층 102호 (망우동)</p>
								<h5 class="text-end text-sm fw-bord"><a class="text-end text-sm fw-bord" href="getCafe.cafe?CAFE_ID=168">more<i
								class="fi fi-br-angle-double-small-right"></i></h5></a>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card h-100 m-3 p-1">
								<img
									src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220126_128%2F1643205739242bSj4R_JPEG%2F3B6AB944-A970-4539-A256-5058FF916530.jpeg"
									class="card-img-top rounded" alt="..." width="150" height="200">
								</img>
								<div class="card-body">
									<h4 class="fw-border">달달차차(DALDALCHACHA)</h4>
									<hr>
									<p class="card-text">서울특별시 중랑구 용마산로129나길 101 C동 202호 (신내동 라이프미성아파트)</p>
									<h5 class="text-end text-sm fw-bord"><a class="text-end text-sm fw-bord" href="getCafe.cafe?CAFE_ID=167">more<i
								class="fi fi-br-angle-double-small-right"></i></h5></a>
									
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card h-100 m-3 p-1 ">
								<img
									src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230415_101%2F1681536801583aNNwf_JPEG%2F%25B3%25D7%25C0%25CC%25B9%25F6%25C7%25C3%25B7%25B9%25C0%25CC%25BD%25BA.jpg"
									class="card-img-top rounded" alt="..." width="150" height="200">
								</img>
								<div class="card-body">
									<h4 class="fw-border">띤보케이크</h4>
									<hr>
									<p class="card-text">서울특별시 용산구 새창로14길 27 1층 (용문동)
									</p>
									<br>
									<h5 class="text-end text-sm fw-bord"><a class="text-end text-sm fw-bord" href="getCafe.cafe?CAFE_ID=107">more<i
								class="fi fi-br-angle-double-small-right"></i></h5></a>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card h-100 m-3 p-1">
								<img
									src="https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyMzA0MjRfODkg%2FMDAxNjgyMzExMjU4ODc2.fu3UYr9_6DIOKwdrzv8lCtC4HRzirIctHEwtsfRXfeog.hpWoWqSN175TxfdUzSDALjDAtKfZjL7_5qATn1RThaMg.JPEG%2F3EF41240-52CC-4A62-87DC-6FCAF2E00D43.jpeg"
									class="card-img-top rounded" alt="..." width="150" height="200">
								</img>
								<div class="card-body">
									<h4 class="fw-border">텐퍼센트커피</h4>
									<hr>
									<p class="card-text">서울특별시 성북구 동소문로 186 대성빌딩 1층 (돈암동)</p>
									<h5 class="text-end text-sm fw-bord"><a class="text-end text-sm fw-bord" href="getCafe.cafe?CAFE_ID=201">more<i
								class="fi fi-br-angle-double-small-right"></i></h5></a>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card h-100 m-3 p-1">
								<img
									src="https://cdn.pixabay.com/photo/2019/09/16/09/32/coffee-4480463__340.jpg"
									class="card-img-top rounded" alt="..." width="150" height="200">
								</img>
								<div class="card-body">
									<h4 class="fw-border">우디집(WOODY.zip)</h4>
									<hr>
									<p class="card-text">서울특별시 성동구 둘레9길 17 2층 (성수동1가)</p>
									<br>
									<h5 class="text-end text-sm fw-bord "><a class="text-end text-sm fw-bord" href="getCafe.cafe?CAFE_ID=123">more<i
								class="fi fi-br-angle-double-small-right"></i></h5></a>
								</div>
							</div>
						</div>
					</div>

	</section>
	<%-- 
		<hr>
		통합 연결 통로
		<hr>

		<a href="insertCafe.cafe">Create 카페 </a> <a href="getCafeList.cafe">Read
			카페 </a>
		<hr>

		<a href="insertCafeReview.cafe">Create 카페 리뷰 </a> <a
			href="getCafeReviewList.cafe">Read 카페 리뷰</a>
		<hr>

		<a href="insertCafeMenu.cafe">Create 카페 메뉴 </a> <a
			href="getCafeMenuList.cafe">Read 카페 메뉴</a>
		<hr>

		<a href="creategiftycornCafeListService.cafe">Create 기프티콘 카페 리스트</a> <a
			href="getgiftycornCafeListService.cafe">Read 기프티콘 카페 리스트</a>
		<hr>

		<a href="creategiftycorn.cafe">Create 기프티콘 </a> <a
			href="getgiftycorn.cafe">Read 기프티콘</a>
		<hr>

		<a href="joinMember.cafe">Create 유저 </a> <a href="getUserList.cafe">Read
			유저 </a>
		<hr>
		<%
		String checkIn = (String) session.getAttribute("LoginMEMBER");
		%>
		<a href="createBookmark.cafe">Create 북마크 </a> <a
			href="getBookmarkList.cafe?MEMBER_ID=<%=checkIn%>">Read 북마크(로그인
			필요!) </a> <br> <br> 주의!) Session에 저장된 MEMBER_ID 데이터를 요구하기 때문에
		로그인 한 상태로 클릭하셔야 오류가 뜨지 않습니다.
		<hr>
 --%>
 <footer class=footer>
	<%@include file="/WEB-INF/views/def/footer.jsp"%>
	</footer>
</body>
<STYLE>
div.card.h-100.m-3.p-1 {
	BORDER-COLOR: #481810;
	border-width: medium;
}

.text-sm ,h5.text-end.text-sm.fw-bord{
	color: #481810;
}

.fi-br-angle-double-small-right {
	position: relative;
	top: 4px;
	left: -2px;
}

a, a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	text-transform: none;
	
}
div.row{

width:100%;
}
@media (min-width: 800px){
div.container{
max-height:1200px;
}
}
</style>




</html>