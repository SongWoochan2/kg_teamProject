<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/myWishList.css" />
<link rel="stylesheet" href="/MyCGV/css/movie/movieFinder.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
   $(function() {
	   if(${result > 0}) {
			alert("삭제 성공");	
		} else {
			alert("삭제 실패");
		}
		location.href = "myWishList.do";	   
   });
</script>
</head>
<body>
</body>
</html>