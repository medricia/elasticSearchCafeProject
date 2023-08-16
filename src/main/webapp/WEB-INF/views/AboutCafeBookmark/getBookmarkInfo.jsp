<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	단순한 링크 이동 페이지
	
	북마크 컨트롤러에 /GetBookmark.cafe 로 매핑되어있는 메소드가 있는데, 해당 메소드를 보시면
	model.addAttribute("BookmarkInfo", service.getBookmarkInfo(map));
	
	해당 코드가 있습니다. 이 코드를 통해 업데이트할 북마크 info를 전달받기 위해 넣은 페이지 입니다.
	
	<% response.sendRedirect("updateBookmark.cafe"); %>	

</body>
</html>