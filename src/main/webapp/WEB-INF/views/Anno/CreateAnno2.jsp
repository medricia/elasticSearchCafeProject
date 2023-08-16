<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jquery 수정 필요</title>
<style>
.CONTEXT{
  border:1px black solid;
  width:30%;
}
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>

<script>
$(document).ready(function () {
	
	var oEditors = [];
	function smartEditorIFrame() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ANNO_CONTEXT_LIST",
			sSkinURI: "<%= request.getContextPath() %>/resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
	        fCreator : "createSEditor2"
		});
      }
	smartEditorIFrame();
});
</script>

</head>
<body>

<form action="/AnnoInsert.cafe" method="post" enctype="multipart/form-data" id="myForm">
	<input type="text" name="ANNO_TITLE" id="title">
	
	<div id="smarteditor">
            <textarea
                name="ANNO_CONTEXT_LIST"
                id="ANNO_CONTEXT_LIST"
                rows="30"
                style="width: 800px"></textarea>
      </div>	
	
	<input type="submit" id="submit" value="제출"></input>

</form>



</body>
</html>