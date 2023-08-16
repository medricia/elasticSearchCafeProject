<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#header {
	width: 1320px;
	height: 200px;
}

.navi {
	width: 80%;
	height: 100px;
	z-index: 1;
}

.headlogo {
	display: grid;
	grid: " . . .";
	gap: 1px;
	grid-template-areas: 
		" . logo h_s";
	
	
}

div.logo {
	align-content: center;
	position: relative;
	right: 10px;
	left: 10px;
}

nav ul li {
	float: left;
	list-style: none;
}

nav li {
	display: inline-block;
}

div.navi {
	position: absolute;
	top: 15px;
}

.navi ul {
	position: fixed;
	right: 50px;
}

a, a :link, a:visited {
	color: black;
	font-weight: bold;
	padding: 5px;
	text-decoration: none;
	text-transform: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	z-index: 1;
	/*다른 요소들보다 앞에 배치*/
	font-weight: 400;
	background-color: #f9f9f9;
	min-width: 200px;
}

.dropdown-content a {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 15px;
	padding: 12px 20px;
}

.dropdown-content a:hover {
	background-color: #ececec
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>

<body>
	<div>
		<header>
			<!-- Navbar-->

			<div id="headlogo">
				<div class="logo">
					<h1>logo</h1>
				</div>
				<div class="h_s">
					<form action="" class="searchBar" method="post" name="searchBar">
						<input type="search" name="searchKeyword"
							placeholder="지역명/카페명 검색!!!" />
					</form>
				</div>
			</div>
		</header>
		<nav>
			<div class="navi">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="home.cafe">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="GetAnnoList.cafe">Notice</a></li>
					<%
					if (session.getAttribute("seeeionID") == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="dologin.cafe">Login</a></li>
					<li class="nav-item"><a class="nav-link"
						href="joinMember*.cafe">Join</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="logout.cafe">Logout</a></li>
					<li class="nav-item"><a class="nav-link"
						href="getUserList.cafe">Info</a></li>
					<%
					}
					%>

					<li class="nav-item dropdown"><a class="dropbtn"
						id="homeDropdownMenuLink" href="#" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">My Page</a>
						<div class="dropdown-content"
							aria-labelledby="homeDropdownMenuLink">
							<a class="dropdown-item" href="getgiftycornCafeListService.cafe">Gifticon</a><br>
							<a class="dropdown-item" href="getCafeReviewList.cafe">My
								Review</a><br> <a class="dropdown-item"
								href="readBookmark.cafe">Favorites Cafe</a><br>
						</div></li>
				</ul>
			</div>
	</div>
	</nav>
	<!-- /Navbar -->
	</header>
</body>
</html>