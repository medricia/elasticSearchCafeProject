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

<body>

<div id="creategiftycorn">
<form action="updategiftycorn.cafe" method="post" enctype="multipart/form-data">

	<input type="hidden" name="MEMBER_ID" value="<%= checkID%>">
	<input type="hidden" name="GIFTYCORN_ID" value="${GiftycornInfo.GIFTYCORN_ID }">
  <div id="name">
<div class="givespace" id="selectcontainer">
  <div class="dropdown" id="selectCafe">
    <div class="select">
          	<c:forEach items="${giftycornCafeList }" var="option">
		<c:if test="${GiftycornInfo.GIFTYCORN_CLN  eq option.value }">
          <span>${option.key }</span>
          </c:if>
          	</c:forEach>
          <i class="fa fa-chevron-left"></i>
        </div>
        <ul class="dropdown-menu">
	
        </ul>
      </div>
  
    </div>
	</div>
	
	<div id="GIMGlabel" class="givespace">
    <label for="uploadgiftycornIMG">
      <div class="content"><img id="upGIMG" class="updateGiftyIMG" src="<%=request.getContextPath() %>/${GiftycornInfo.GIFTYCORN_IMAGE_LOCATION }"></div>
    </label>
	<input type="file" id="uploadgiftycornIMG" name=""></div>
	
	<div id="Gtime">
    <label for="GSyear">시작 시간</label>
	<br> <input type="text" name=""  placeholder="년(2023)" id="GSyear" value="2023" class="GiftyBorder">
	<select name="GIFTYCORN_START_DATE" class="GiftyBorder">
			<option value="">5월
	</select>
	<input type="text" class="GiftyBorder" name="" value="10" placeholder="일(22)"><br>
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
          rows="5" cols="33">${GiftycornInfo.GIFTYCORN_MEMO }
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

$('#uploadgiftycornIMG').on('change', function(){
	  ext = $(this).val().split('.').pop().toLowerCase(); //확장자
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        resetFormElement($(this)); //폼 초기화
        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
    } else {
        file = $('#uploadgiftycornIMG').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);//file URL 추가
        $("#image_preview").removeAttr("hidden"); //image_priview의 hidden 속성 제거
        $('#upGIMG').attr('src', blobURL);
       $('#IfyougetImage').prop("type", "text");
    }
});
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
</script>
</body>
</html>
