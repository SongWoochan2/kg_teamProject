<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:if test="${result == '2' }">
<script type="text/javascript">
	alert("아이디를 입력하세요.");
	location.href='adminEnrollForm.do?admin_id=${requestData.admin_id}&admin_name=${requestData.admin_name}';
</script>
</c:if>
<c:if test="${result == '1' }">
<script type="text/javascript">
	alert("중복된 아이디가 존재합니다.");
	location.href='adminEnrollForm.do?admin_id=${requestData.admin_id}&admin_name=${requestData.admin_name}';
</script>
</c:if>
<c:if test="${result == '0' }">
<script type="text/javascript">
	var id = confirm("사용가능한 아이디입니다. 사용하시겠습니까?");
	alert(id);
	location.href='adminEnrollForm.do?admin_id=${requestData.admin_id}&admin_name=${requestData.admin_name}&id_check='+id;
</script>
</c:if>
</html>