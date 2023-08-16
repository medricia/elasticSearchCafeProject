<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String getID = (String)session.getAttribute("getIDsession"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span id="ID" style="font-size: 20px; color: #683830; font-weight: bold; padding-left:5px; display:inline-block; margin-top:10px;"></span>
	<p id="check"></p>
	<input type="button" class="checkokay" value="제출하기">
	
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-3.6.3.js"></script>
	<script type="text/javascript">
	var getID = sessionStorage.getItem("getIDsession");

	$('#ID').html(getID);
	
	if(getID == ""){
		$('#check').html('아이디가 작성되지 않으셨습니다.');
		$('.checkokay').attr('value','수정하기')
		sessionStorage.setItem("IDcheck", "No");
	}
	<c:forEach items="${userInfolist}" var="userInfolist">
	else if(getID == "${userInfolist.MEMBER_ID}"){
		$('#check').html('중복된 ID 입니다.');
		$('.checkokay').attr('value','수정하기')
		sessionStorage.setItem("IDcheck", "No");
	}
	</c:forEach>
	else{
		$('#check').html('사용가능한 ID 입니다.');	
		sessionStorage.setItem("IDcheck", "Yes");
	}
	<c:if test="${empty userInfolist}">
	$('#check').html('사용가능한 ID 입니다.');	
	sessionStorage.setItem("IDcheck", "Yes");
	</c:if>
	$('.checkokay').click(function(){
		if($('#check').val().match("사용가능")){
			sessionStorage.setItem("IDcheck", 'Yes');
			sessionStorage.removeItem("getIDsession");
			window.close();
		}else{
			sessionStorage.setItem("IDcheck", 'No');
			sessionStorage.removeItem("getIDsession");
			window.close();
		}
	});
	addEventListener('keydown', function(event) {
		  if (event.keyCode === 27) {
		    window.close();
		  }
		});

	</script>

<script type="text/javascript">
if (e.which === 116) {
    if (typeof event == "object") {
        event.keyCode = 0;
    }
    return false;
} else if (e.which === 82 && e.ctrlKey) {
    return false;
}
</script>

</body>
</html>