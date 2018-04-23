<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div .form-control{
		width: 80%;
	}
</style>
</head>
<body>
<div class="container">
	<form action="inquiryAnswer.do" method="post">
	 	<div align="center">
	 	 	<h4>메일 보내기</h4>
	 	</div>
	    <div align="center"><!-- 받는 사람 이메일 -->
	      <input type="text" name="email" size="120"  class="form-control" value="${member_email }">
	    </div>     
	    <div align="center"><!-- 제목 -->
	      <input type="text" name="a_title" size="120"  placeholder="제목" class="form-control" >
	    </div>
	    <p>
	    <div align="center"><!-- 내용 --> 
	      <textarea name="a_content" cols="120" rows="12"  resize:none" placeholder="내용" class="form-control"></textarea>
	    </div>
	    <p>
	    <div align="center">
	      <input type="submit" value="메일 보내기" class="btn btn-warning">
	    </div>
  	</form>
</div>
</body>
</html>