<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page contentType="text/html; charset=UTF-8"%>
<% String checkID = (String)session.getAttribute("LoginMEMBER"); %>
<!doctype html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">
<title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.container-fluid{
  font-family: 'NanumSquareNeo-Variable';
}
.card{
font-family: 'NanumSquareNeo-Variable';
}
#indexcontainer{
  width:1000px;
}
</style>
</head>
	<nav class="navbar h4  navbar-expand-lg " style="background-color:#481810";>
		<div class="container-fluid ">
			<a class="navbar-brand text-white h4 linkCSS" href="index.jsp">
					<img style="padding-left:10px; padding-top:10px;"src="resources/img/logo.png"
						 "width="65px"
						height="65px" alt="" />
			</a>
			<button class="navbar-toggler " type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation ">
				<span class="navbar-toggler-icon "  style="color: #D8B838"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<div class="p-2 flex-fill"></div>
				<ul class="navbar-nav " style="-bs-scroll-height: 300px;">
					<li class="nav-item "><a class="nav-link active text-white"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						href="GetAnnoList.cafe">Notice</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						href="./getname?name=&lat=&lon=">CafeTour</a></li>
						<%	
					if (checkID == null) {
					%>
					
					<li class="nav-item"><a class="nav-link active text-white"
						href="./dologin.cafe">Login</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						href="./joinMember*.cafe">Join</a></li>
					<%
					} else if (checkID.equals("admin")) {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link active dropdown-toggle text-white"
						href="/getUserList.cafe" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> admin page </a>
						<ul class="dropdown-menu" style="background-color:#481810">
							<li><a class="dropdown-item h4 text-white "
								href="insertCafe.cafe" >Make Cafe</a></li>
							<li><a class="dropdown-item h4 text-white "
								href="getgiftycornCafeListService.cafe">franchise List</a></li>
							<li><a class="dropdown-item h4 text-white "
								href="getUserList.cafe" >Read User</a></li>
						</ul></li>
						<li class="nav-item"><a class="nav-link active text-white"
						href="./dologout.cafe">Logout</a></li>
					<%
					} else {
						%>
						<li class="nav-item dropdown"><a
						class="nav-link active dropdown-toggle text-white"
						href="/getUserList.cafe" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> My Page </a>
						<ul class="dropdown-menu" style="background-color:#481810">
							<li><a class="dropdown-item h4 text-white "
								href="getUserInfo.cafe?MEMBER_ID=<%= checkID %>" >My Giftycon</a></li>
							<li><a class="dropdown-item h4 text-white "
								href="getCafeReviewList.cafe?MEMBER_ID=<%= checkID %>">My Review</a></li>
							<li><a class="dropdown-item h4 text-white "
								href="getBookmarkList.cafe?MEMBER_ID=<%= checkID %>" >My Favorites</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link active text-white"
						href="./dologout.cafe">Logout</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>





<style>
.nav, .dropdown-menu,#footer_container {

background-color: #481810;
text-color:  #D8B838;
}
.navbar-expand-lg{

background-color: #481810;
text-color:  #D8B838;
}
.button{
font-weight: bold;
}
.nav-item, .dropdown-item ,.btn{
font-weight: bold;
}
.navbar-toggler{
color: #D8B838;
}

</style>

	<!-- End Example Code -->
</body>
</html>