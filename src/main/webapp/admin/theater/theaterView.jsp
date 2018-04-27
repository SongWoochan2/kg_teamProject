<%@page import="theater.bean.TheaterDTO"%>
<%@page import="theater.dao.TheaterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>극장상세보기</title>
	<style type="text/css">
		#test{
			width: 200px;
			height: 200px;
		}
		#wrapper{
			width: 1000px;
			margin: 0 auto;
			text-align: center;
			align-items: center;
			background-color: #ffe9ce;
			border: 3px solid black;
			padding: 50px;
		}
		#wrapper table{
			margin : 0 auto;
			background-color: white;
		}
		#date_select_div{
			display: flex;
			width: 100%;
			align-items: center;
		}
		#date_select_div *{
			float: left;
		}
		#date_select_div input{
			float: left;
			margin: auto;
		}
	</style>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>

	<script type="text/javascript">
		$(function(){
			var count = 0;
			
			$.ajax({
				url : "/MyCGV/showPlaceList.do",
				type : "get",
				dataType : "html",
				data : { theater_code : "${theaterDTO.theater_code }" },
				timeout : 30000,
				cache : false,
				success : function(html){
					$("#showPlaceList").html(html);
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
		});
	</script>
</head>
<body>
<jsp:include page="../adminMain/adminTemplate.jsp"/>
<div id = "content" align="center">
	<div id="wrapper">
		<table border="1">
			<tr>
				<td colspan="3">
					<font size="5">${theaterDTO.theater_code }</font>
				</td>
			</tr>
			
			<tr>
				<td width="150" align="center">극장이름 : ${theaterDTO.theater_name }</td>
				<td width="150" align="center">극장주소 : ${theaterDTO.theater_photo_addr }</td>
				<td width="150" align="center">극장번호 : ${theaterDTO.theater_phone }</td>
			</tr>
			<tr>
				<td colspan="3" height="200">
					<img id="test" alt="" src="/MyCGV/image/theater_juso/${theaterDTO.theater_photo_addr }"> 
				</td>
			</tr>
		</table>
		<div id="showPlaceList"></div><br><br>
		
		
		<input type="button" value="목록" onclick="location.href='theaterList.do?pg=${pg}'">
		<input type="button" value="수정" onclick="location.href='theaterModifyForm.do?pg=${pg}&theater_code=${theater_code}'">
		<input type="button" value="삭제" onclick="location.href='theaterDelete.do?theater_code=${theater_code}'">
	</div>
</div>
</body>
</html>