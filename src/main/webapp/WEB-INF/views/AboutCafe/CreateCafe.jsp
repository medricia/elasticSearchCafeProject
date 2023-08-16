<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 목록 생성</title>
<link href="<%=request.getContextPath()%>/resources/css/CreateCafe.css" rel="stylesheet" type="text/css">
<%@include file="/WEB-INF/views/def/header.jsp"%>

</head>

<body>
<div id="MakeCafeContainer">
<form action="insertCafe.cafe" method="post" enctype="multipart/form-data">

  <table class="tg">
<thead>
  <tr class="newCafe">
    <th class="tg-0lax"><span>새로운 카페 정보를 등록해주세요</span></th>
  </tr>
</thead>
<tbody>
  <tr class="makehr">
    <td>
    </td>
  </tr>
  <tr>
    <td class="tg-0pky"><select name="GIFTYCORN_CLN" class="GiftyBorder"><option selected disabled>해당하시는 프렌차이즈를 선택해주세요.</option><c:forEach items="${giftycornCafeList }" var="option"><option value="${option.value }">${option.key }</c:forEach></select><br></td>
  </tr>
    <tr>
    <td class="tg-0lax upload"><div class="content">
      <label for="image" id="IMGfileupload">
        <div id="uploadPic">
          <span id="uploadPicSpan">대표 사진을 업로드해주세요<span>
            </div>
            <div id="imgContainer"><img id="upGIMG" class="image_preview updateGiftyIMG " src=""></div>
            </label>
          
          <input type="file" name="UPLOADIMAGE" id="image">
        </div>
      </td>
  </tr>
  <tr>
    <td class="tg-0pky front"><label for="name"><span class="infotext">카페이름</span></label><br><input type="text" name="CAFE_NAME" class="inputtext" placeholder="카페이름을 입력해 주세요" id="name"></td>
  </tr>
  <tr>
    <td class="tg-0pky front"><label for="location"><span class="infotext">카페위치</span></label><br><input type="text" class="inputtext" name="CAFE_LOCATION" placeholder="CAFE_LOCATION" id="location" value="서울특별시 종로구 우정국로2길 21 대왕빌딩 7층"></td>
  </tr>
  <tr>
    <td class="tg-0lax front"><label for="optime"><span class="infotext">영업시간</span></label><br><input type="text" class="inputtext" name="CAFE_OPERATETIME" placeholder="영업시간을 입력해주세요" id="optime"></td>
  </tr>
  <tr>
    <td class="tg-0lax front"><label for="secondNumber"><span class="infotext">전화번호</span></label><br><input type="text" name="CAFE_PHONENUMBER" placeholder="010" value="010" class="number "><span class="bar">─</span><input type="text" name="CAFE_PHONENUMBER" id="secondNumber" class="number"><span class="bar">─</span><input type="text" name="CAFE_PHONENUMBER" id="thirdNumber" class="number"></td>
  </tr>
  <tr>
    <td class="tg-0lax front"><label for="sns"><span class="infotext">SNS</span></label><br><input type="text" class="inputtext" name="CAFE_SNS" placeholder="SNS를 입력해주세요" id="sns"></td>
  </tr>
  <tr>
    <td class="tg-0lax front"><label for="intro"><span class="infotext">카페소개</span></label><br><textarea class="inputtext" name="CAFE_INTRODUCTION" placeholder="카페 소개를 입력해주세요" id="intro"></textarea></td>
  </tr>
  <tr>
    <td class="tg-0lax"><input type="submit" value="등록"></td>
  </tr>
</tbody>
</table>
  </form>

</div>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
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
}else{
    alert('이미지가 아닙니다.');
    return;
}

}

$('#image').on('change', function() {
  ext = $(this).val().split('.').pop().toLowerCase(); //확장자
  if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
    resetFormElement($(this)); //폼 초기화
    window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
  } else {
    file = $('#image').prop("files")[0];
    blobURL = window.URL.createObjectURL(file); //file URL 추가
    $(".image_preview").css("visibility", "visible"); //image_preview의 hidden 속성 제거
    $('#upGIMG').attr('src', blobURL);
    $('#upGIMG').css("display","inline-block");
    $('#imgContainer').fadeIn();
    $('#uploadPicSpan').css("display", "none");
    $('#uploadPic').css("display","none");
  }

});
$(document).ready(function() {
	  function adjustImageSize() {
	    var img = $('#upGIMG');
	    var width = img.width();
	    var height = img.height();
	    if (width > height) {
	      img.css({
	        'margin-left': '-10%',
	        'height': '500px',
	        'display': 'none'
	      });
	    }else if(width == height){
	    	img.css({
	    	'height': '500px',
		    'display': 'none'
	    	});
	    }else if(width < height) {
	      img.css({
	        'margin-top': '-10%',
	        'width': '500px',
	        'display': 'none'
	      });
	    }
	  }

	  // 이미지 업로드 이벤트
	  $('#image').on('change', function() {
	    var input = $(this)[0];
	    if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function(e) {
	        $('#upGIMG').attr('src', e.target.result).one('load', function() {
	          adjustImageSize();
	          $(this).fadeIn();
	        });
	      }
	      reader.readAsDataURL(input.files[0]);
	    }
	  });

	});



</script>
</body>
</html>