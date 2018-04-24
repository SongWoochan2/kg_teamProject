<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장삭제</title>
<script type="text/javascript">
	window.onload=function(){
		if(${result > 0}) {
			alert("삭제 성공");	
		} else {
			alert("삭제 실패");
		}
		location.href = "theaterList.do?pg=1";
	}
</script>
</head>
<body>

</body>
</html>