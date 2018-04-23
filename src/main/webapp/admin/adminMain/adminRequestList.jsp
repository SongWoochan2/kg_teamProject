<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<script type="text/javascript">
	$(function(){
		$("#allowbtn").click(function(){
			alert("승인");
			
		});
		$("#denybtn").click(function(){
			alert("거부");			
		});
	});
</script>
<style type="text/css">
	#paging {
		color: blue;
	}

	#currentPaging {
		color: red;
	}
	
	#requestlist{
		margin : auto;
	}
	#requestlist th{
		font-weight: bold;
		font-size: 18px;
		color : white;
		background-color: #333333;
		width: 170px;
		height: 50px;
	}
	#requestlist th:hover {
		background-color: #cccccc;
	}
	#requestlist td{
		background-color : #cccccc;
		text-align: center;
		font-weight: bold;
		height: 30px;
	}
	#requestlist td a{
		color : white;
		font-size : 15px;
		border-radius : 20px;
		width: 150px;
	}
	#requestlist td a:hover{
		text-decoration: none;
	}
	#requestlist td #allowbtn{
		background-color: #21215b;
		height: 100%;
		width: 50%;
		float: left;
	}
	#requestlist td #allowbtn:hover{
		background-color: #4829d2;
	}
	#requestlist td #denybtn{
		height: 100%;
		width: 50%;
		background-color: #5b1f15;
		float: left;
	}
	#requestlist td #denybtn:hover{
		background-color: #d3422a;
	}
</style>
</head>
<body>
	<jsp:include page="../adminMain/adminTemplate.jsp"/>
	<div id="content" align="center">
	<div id = "contain">
		<table id = "requestlist">
			<thead>
				<tr>
					<th>신청번호</th><th>신청아이디</th><th>신청자이름</th><th>신청일자</th><th>승인여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="adminRequestDTO" items="${requestScope.list }">
				<tr>
					<td>${adminRequestDTO.admin_request_code }</td>
					<td>${adminRequestDTO.admin_id }</td>
					<td>${adminRequestDTO.admin_name }</td>
					<td>${adminRequestDTO.request_date }</td>
					<td>
						<a href = "adminAllowable.do?pg=${pageInfo.pg }&admin_request_code=${adminRequestDTO.admin_request_code}&allowable=1">
							<div id = "allowbtn">
							승인
							</div>
						</a> 
						<a href = "adminAllowable.do?pg=${pageInfo.pg }&admin_request_code=${adminRequestDTO.admin_request_code}&allowable=0" >
							<div id = "denybtn">
							거절
							</div>
						</a>
					</td>
				</tr>
				</c:forEach>
				<tr>
				<th colspan="5">
				<c:if test="${pageInfo.startPage>1 }">
					[<a id="paging" href="adminRequestList.do?pg=${pageInfo.startPage-1}">이전</a>]
				</c:if> 
				<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
				<c:if test="${pageInfo.startPage==i }">
				[<a id="currentPaging" href="adminRequestList.do?pg=${i }">${i }</a>]
				</c:if>
				<c:if test="${pageInfo.startPage!=i }">
				[<a id="paging" href="adminRequestList.do?pg=${i }">${i }</a>]
				</c:if>
				<!-- el표현식에는 자바코드가 들어갈수없음 -->
				</c:forEach> 
				<c:if test="${pageInfo.endPage<pageInfo.totalPage}">
				[<a id="paging" href="adminRequestList.do?pg=${pageInfo.endPage+1}">다음</a>]
				</c:if> <!-- el표현식에는 자바코드가 들어갈수없음 --></th>
				</tr>
			</tbody>
		</table>
	</form>	
	</div>
	</div>
</body>
</html>