<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프트콘 카페 목록 생성</title>
<%@include file="/WEB-INF/views/def/header.jsp"%>
<style type="text/css">
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
#margincenter{
  width:1100px;
  margin:0 auto;
}
#margincenter p{
   font-family: 'NanumSquareNeo-Variable';
  font-size:30px;
  font-weight: bold;
  margin-left:30px;
  margin-bottom:20px;
}
#makeCafeList{
  font-family: 'NanumSquareNeo-Variable';
}
#cafemaindiv{
  margin:30px;
  font-size:20px;
  text-align:center;
}
#cafemaindiv #cafename{
  display:inline-block;
  padding:13px 20px;
  font-family: 'NanumSquareNeo-Variable';
  border-radius:5px;
  border:1px solid #ccc;
}
#writeCafe{
    margin-top:20px;
  vertical-align:center;
}
#cafeFCsubmit{
  display:inline-block;
  padding:14.5px 20px;
  margin-left:20px;
  border:1px solid #ccc;
  border-radius:5px;
  font-family: 'NanumSquareNeo-Variable';
  font-size:18px;
}
</style>
</head>

<body>
<br>
<br>
<br>
<div id="margincenter">
  <p>프렌차이즈 카페를 등록해주세요</p>
<hr>
<div id="makeCafeList">
  <form action="creategiftycornCafeListService.cafe" method="post">
  <div id="cafemaindiv">
  <lable for="cafename">프렌차이즈 이름 작성하기</label><br>
    <div id="writeCafe">
    <input type="text" name="GIFTYCORN_CAFE_NAME" id="cafename" placeholder="카페 이름"><input type="submit" value="등록" id="cafeFCsubmit">
    </div>
    </div>
	
</form>
  </div>
</div>
</body>
</html>