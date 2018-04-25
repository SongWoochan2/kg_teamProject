<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<!-- 
/* old_nick_name val()이랑 같으면   */
/*      
		            if(data=="-1"){
		                alert("오류가 발생하였습니다.");
		                _this.attr('data', 0);
		                return false;
		            } else if(data=="0"){
		            	alert('이미 사용중인 닉네임입니다.');
		            	nickNameObj.focus();
			            _this.attr('data', 0);
		           	} else if(data=="1"){
		           	 	alert('사용가능한 닉네임입니다.');
		           	 	_this.attr('data', 1);
		           	 	nickNameObj.val(newNick);
		           	}     
             */ -->
<c:if test="${exist == -1}">
<script type="text/javascript">
$(function(){
	alert("오류가 발생하였습니다.");
	window.close();
});
</script>
</c:if>
<c:if test="${exist == 0}">
<script type="text/javascript">
$(function(){
	alert("이미 사용중인 닉네임입니다.");
	window.close();
});
</script>
</c:if>
<c:if test="${exist == 1}">
<script type="text/javascript">
$(function(){
	alert("사용가능한 닉네임입니다.");
	window.close();
});
</script>
</c:if>
</head>
<body>

</body>
</html>