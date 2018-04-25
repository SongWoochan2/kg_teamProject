<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<!-- /*             if (result == "") {
                alert("오류가 발생하였습니다.");
                
            } else if (result == "0") {
                
               
            } else {
               
                
                	if(("#existNick").val()=="-1"){
						
					} else if(("#existNick").val()=="0"){
						 
					} else(("#existNick").val()=="1"){
						
						$("#nick_name").val();
					}
            } */ -->
<c:if test="${exist == -1}">
<script type="text/javascript">
$(function(){
	alert("오류가 발생하였습니다.");
	location.href="/MyCGV/mypage/editProfileForm.do"
});
</script>
</c:if>
<c:if test="${exist == 0}">
<script type="text/javascript">
$(function(){
	alert("이미 사용중인 닉네임입니다.");
	history.back();
});
</script>
</c:if>
<c:if test="${exist == 1}">
<script type="text/javascript">
$(function(){
	alert("사용가능한 닉네임입니다.");
	history.back();
});
</script>
</c:if>
</head>
<body>

</body>
</html>