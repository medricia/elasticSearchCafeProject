<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프트콘 생성</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>
<link href="<%=request.getContextPath()%>/resources/css/createGiftycorn.css" rel="stylesheet" type="text/css">
</head>
<% if(checkID == null){
	response.sendRedirect("dologin.cafe");
}%>
<body>

<div id="creategiftycorn">
<form action="creategiftycorn.cafe" method="post" enctype="multipart/form-data">

	<input type="hidden" name="MEMBER_ID" value="<%= checkID%>">

  <div id="name">
<div class="givespace" id="selectcontainer">
  <div class="dropdown" id="selectCafe">
    <div class="select">
          <span>카페를 선택해주세요.</span>
          <i class="fa fa-chevron-left"></i>
        </div>
        <input type="hidden" name="GIFTYCORN_CLN">
        <ul class="dropdown-menu">
          
		<c:forEach items="${giftycornCafeList }" var="option">
          <li id="${option.value }">${option.key }</li>
          	</c:forEach>
        </ul>
      </div>
  
    </div>
	</div>
	
	<div id="GIMGlabel" class="givespace">
    <label for="uploadgiftycornIMG">
      <div class="content"><img id="upGIMG" class="image_preview updateGiftyIMG " src="" style=" visibility : hidden;"></div>
    </label>
	<input type="file" id="uploadgiftycornIMG" name="UPLOADIMAGE"></div>
	
	<div id="Gtime">
    <label for="GSyear">시작 시간</label>
	<br> <input type="text" name="GIFTYCORN_START_DATE"  placeholder="년(2023)" id="GSyear" class="GiftyBorder">
	<select name="GIFTYCORN_START_DATE" class="GiftyBorder">
		<c:forEach items="${MONTH_SELECT }" var="option">
			<option value="${option.value }">${option.key }
		</c:forEach>
	</select>
	<input type="text" class="GiftyBorder" name="GIFTYCORN_START_DATE"  placeholder="일(22)"><br>
	</div>
	
	<div id="endtime">
	 <label for="GEyear">종료 시간</label><br> <input type="text" name="GIFTYCORN_LIMIT_DATE"  id="GEyear" class="GiftyBorder" placeholder="년(2023)">
	<select name="GIFTYCORN_LIMIT_DATE" class="GiftyBorder">
		<c:forEach items="${MONTH_SELECT }" var="option">
			<option value="${option.value }">${option.key }
		</c:forEach>
	</select>
	<input type="text" name="GIFTYCORN_LIMIT_DATE" class="GiftyBorder" placeholder="일(02)" ><br><br>
	</div>
	
	<div id="GMemo">
    <label for="GiftMemo">메모</label><br>
    <textarea id="GiftMemo" name="GIFTYCORN_MEMO"
          rows="5" cols="33">
</textarea>
	</div>
	<hr>
	<input type="submit" value="기프티콘 등록" id="giftycornSubmit">
</form>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$('.content')
.on("dragover", dragOver)
.on("dragleave", dragOver)
.on("drop", uploadFiles);

function dragOver(e){
e.stopPropagation();
e.preventDefault();
}

function uploadFiles(e){
e.stopPropagation();
e.preventDefault();
}
function dragOver(e) {
  e.stopPropagation();
  e.preventDefault();
  if (e.type == "dragover") {
      $(e.target).css({
          "background-color": "#83684e",
          "outline-offset": "-20px"
      });
  } else {
      $(e.target).css({
          "background-color": "#fff",
          "outline-offset": "-10px"
      });
  }
}
function uploadFiles(e) {
  e.stopPropagation();
  e.preventDefault();
  dragOver(e); //1

  e.dataTransfer = e.originalEvent.dataTransfer; //2
  var files = e.target.files || e.dataTransfer.files;

  if (files.length > 1) {
      alert('기프티콘 이미지는 하나만 올릴 수 있습니다.');
      return;
  }
if (files[0].type.match(/image.*/)) {
   $(e.target).css({
      "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
      "outline": "none",
      "background-size": "100% 100%"
  });
}else{
    alert('이미지가 아닙니다.');
    return;
}

}

/*Dropdown Menu*/
$('.dropdown').click(function () {
      $(this).attr('tabindex', 1).focus();
      $(this).toggleClass('active');
      $(this).find('.dropdown-menu').slideToggle(300);
  });
  $('.dropdown').focusout(function () {
      $(this).removeClass('active');
      $(this).find('.dropdown-menu').slideUp(300);
  });
  $('.dropdown .dropdown-menu li').click(function () {
      $(this).parents('.dropdown').find('span').text($(this).text());
      $(this).parents('.dropdown').find('input').attr('value', $(this).attr('id'));
  });
/*End Dropdown Menu*/


$('.dropdown-menu li').click(function () {
var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>',
    msg = '<span class="msg">Hidden input value: ';
$('.msg').html(msg + input + '</span>');
}); 
$('#uploadgiftycornIMG').on('change', function(){
	  ext = $(this).val().split('.').pop().toLowerCase(); //확장자
  if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
      resetFormElement($(this)); //폼 초기화
      window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
  } else {
      file = $('#uploadgiftycornIMG').prop("files")[0];
      blobURL = window.URL.createObjectURL(file);//file URL 추가
      $(".image_preview").css("visibility","visible"); //image_priview의 hidden 속성 제거
      $('#upGIMG').attr('src', blobURL);
     $('#IfyougetImage').prop("type", "text");
  }
});
</script>
</body>
</html>