<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 리뷰</title>
<%@ include file="/WEB-INF/views/def/header.jsp"%>
<link href="<%= request.getContextPath()%>/resources/css/aboutreview.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="cafereview">
  <div id="cafereview_center">
<h3 id="cafe">리뷰를 등록해주세요!</h3>
<br>
<div id="list">
<form action="insertCafeReview.cafe" method="post" enctype="multipart/form-data">
	<!-- cafe_id는 히든 -->
	<input type="hidden" name="cafe_ID" placeholder="id" value="${cafe_ID.CAFE_ID }">
	<input type="hidden" name="MEMBER_ID" placeholder="nickname" value="<%=checkID %>" style="width:250px;height:25px; margin: 10px; font-weight: bold;">
  <div id="reviewcontainer">
	<div id="reviewtitle" class="review"><input type="text" name="cafe_Review_Title" placeholder="제목"><br></div>
	<div id="reviewcontext" class="review"><textarea type="text" name="cafe_Review_Content" placeholder="내용을 입력하세요" ></textarea><br>
    <input type="file" name="UPLOADIMAGE" placeholder="email" multiple="multiple" id="file-input">
	</div>
    <div id="preview"style="display:none;"></div>
    </div>
	<hr><br>
	<input type="submit" value="등록" id="reviewsubmit">
</form>
  <div>
</div>
</div>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$('#file-input').on('change', function() {
	  var files = $(this).prop('files');
	  $('#preview').empty();
	  for (var i = 0; i < files.length; i++) {
	    var file = files[i];
	    if (file.type.match('image.*')) {
	      var reader = new FileReader();
	      reader.onload = (function(theFile) {
	        return function(e) {
	        	$('#preview').css("display","block");
	          $('#preview').append('<img style="height:150px" src="' + e.target.result + '">');
	        };
	      })(file);
	      reader.readAsDataURL(file);
	    }
	  }
	});
</script>
</body>
</html>