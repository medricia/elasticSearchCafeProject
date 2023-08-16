<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
리뷰 리스트
<c:forEach items="${MemberReviewList }" var="list">
카페 아이디: ${list.cafe_ID}<br>
리뷰 제목: <a href="getCafeReview.cafe?cafe_Review_Number=${list.cafe_Review_Number}">${list.cafe_Review_Title}</a><br>
<hr>
</c:forEach>
</body>
</html>