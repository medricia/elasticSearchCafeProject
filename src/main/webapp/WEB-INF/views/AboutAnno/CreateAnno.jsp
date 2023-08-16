<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #img-selector {
        display: none;
    }
</style>
</head>
<body>
<form action="/AnnoInsert.cafe" method="post" enctype="multipart/form-data">
  <label for="title">제목</label>
  <input type="text" name="ANNO_TITLE" id="title">


<div contentEditable="true" id="editable">

</div>

 <textarea id="content"></textarea>
  <input type="hidden" name="contentArray" id="contentArray">
  <input type="button" value="Submit" onclick="submitForm()">
  
  <div id="contents">
    <label for="content-1">본문1</label>
    <textarea name="ANNO_CONTEXT_LIST" class="Context"></textarea>
    <label for="content-1">본문2</label>
    <textarea name="ANNO_CONTEXT_LIST" class="Context"></textarea>
    <label for="content-1">본문3</label>
    <textarea name="ANNO_CONTEXT_LIST" class="Context"></textarea>
    
    <div id="image-group-1">
      <label for="image-1">이미지1</label>
      <input type="file" name="UPLOADIMAGE" id="image-1">
    </div>

    <button type="button" id="add-content-btn">본문 추가</button>
  </div>

  <button type="submit">제출</button>
</form>



<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#temp').click(function() {
      $('#append').val($('#tt').html());

    });
  });
  
function submitForm() {
    var content = document.getElementById("content").value;
    var contentArray = [];

    while (content.length > 0) {
      contentArray.push(content.substring(0, 3000));
      content = content.substring(3000);
    }

    document.getElementById("contentArray").value = JSON.stringify(contentArray);
    document.getElementById("myForm").submit();
  }
  
</script>
<!--  중간에 이미지 파일을 삽입하거나, 글자수가 4000자가 넘어가면 class가 Context인 textarea를 자동으로 추가해주는 jquery 작성 -->

</body>
</html>