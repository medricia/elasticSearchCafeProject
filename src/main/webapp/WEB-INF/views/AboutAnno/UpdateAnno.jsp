<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.projcafe.cafe.Anno.AnnoVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/font.css"  rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/resources/css/index.css" rel="stylesheet" type="text/css">

<style>
.CONTEXT{
  border:1px black solid;
  width:30%;
}
#image_preview{
	border: 1px #ccc solid;
	border-radius: 10px;
}
#preview{
width: 100px;
}
</style>

<%@include file="/WEB-INF/views/def/header.jsp"%>
</head>
<body>
<div id="allannoteg">
<div id="thisisanno">공지사항 글쓰기
</div>
<div id="annoHR"></div>
<div id="AnnoTable">
	<form action="UpdateAnno.cafe" name="boardform" method="post" enctype="multipart/form-data">
	<input type="hidden" name="ANNO_ID" value="${AnnoInfo.ANNO_ID }">
		<table>
		<tbody>
		
  <tr>
    <td><input class="borderBottom borderSubject" type="text" name="ANNO_TITLE" placeholder="제목" value=" ${AnnoInfo.ANNO_TITLE }" style="width:1100px;height:40px; font-size:30px; padding-left:10px; margin-top: 10px; font-family: 'Pretendard-Regular';"></td>
   </tr>
  <tr style="padding-top:20px;">
		  <td class="tg-0pky">
				<textarea name="ANNO_CONTEXT" class="boardContentUpdate">${AnnoInfo.ANNO_CONTEXT }</textarea>			    
		    </td>	   
	  </tr>
	    <tr>
	    <td class="tg-0pky" >
	    <label id="imageLabel" class="input-file-button" for="image">이미지 업로드</label>
	    
			   <% 
		AnnoVO Image = (AnnoVO)request.getAttribute("AnnoInfo");
	    	System.out.println(Image.getANNO_IMAGE());
		try{
		if(Image.getANNO_IMAGE() == null){
		%>
		    <div id="image_preview" hidden>
	    		<p>이미지 프리뷰</p>
	    		<img src="#" id="preview">
	    	</div>
		<%
		}else{
		%>
			<div id="image_preview">
			<img src="<%=request.getContextPath() %>/${AnnoInfo.ANNO_IMAGE }" id="preview">
			</div>
			<%	
			}}catch(Exception e){}
			%>
	    </td>	    
	  </tr>
	  <tr>
	    <td class="tg-0pky buttons" colspan = "5">
	    	<input class="submit" type="submit" name="" value="등록">
	    	<input class="goBack" type="button" name="delete" onclick="history.back()" value="취소">
	    </td>
	  </tr>
	</tbody>
	</table>
	<input type="file" name="UPLOADIMAGE" id="image" class="image" style="display:none;" multiple/>
	</form>
</div>
</div>



<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">


	$(function(){
	  $('#image').on('change', function(){
		  ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	      if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	          resetFormElement($(this)); //폼 초기화
	          window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	      } else {
	    	  file = $('#image').prop("files")[0];
	          blobURL = window.URL.createObjectURL(file);//file URL 추가
	          $("#image_preview").removeAttr("hidden"); //image_priview의 hidden 속성 제거
	          $('#preview').attr('src', blobURL);
	          $('#imageLabel').css('display','none');
	         $('#IfyougetImage').prop("type", "text");
	      }
	  });
	});

</script>

</body>
</html>