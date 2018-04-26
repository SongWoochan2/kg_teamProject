<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/tmpl/jquery.tmpl.min.js"></script>
	<style type="text/css">
		#schedule_frame{
			width:  800px;
			margin: 0 auto;
			padding: 30px;
			border: 1px dotted black;
			
		}
		.show_place_schedule table {
			display: block;
			width: 100%;
			font-size: 14px;
			text-align: center;
		}
		.show_place_schedule table .left {
			text-align: left;
		}
		.show_place_schedule thead, tbody, tr{
			display: block;
			width: 100%;
		}
		.show_place_schedule td, th{
			display: block;
			float: left;
			padding: 10px 0;
		}
		.show_place_schedule table thead{
			border-bottom: solid 2px #285E8E;
			font-weight: bold;
		}
		.show_place_schedule table tbody tr{
			border-bottom: 1px dotted #ccc;
		}
		.show_place_schedule table .show_time {
			width: 15%;
		}
		.show_place_schedule table .movie_name {
			width: 45%;
		}
		.show_place_schedule table .movie_recycle_time {
			width: 10%;
		}
		.show_place_schedule table .movie_director {
			width: 20%;
		}
		.show_place_schedule table .delete {
			width: 10%;
			text-align: center;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			
			var json = ${json};
			var list = json.show_list;
			
			
			for(var i = 0; i < list.length; i++){
				var code = list[i].show_place_code;
				var tmpl = $("#itemTemplate").tmpl(list[i]);
				$(".show_place_schedule[code='"+code+"']").append(tmpl);
			}
			
			$(".show_add").click(function(){
				location.href="/MyCGV/showPresentWriteForm.do?sp_code="+$(".show_add").attr("show_place_code");
			});
			
		});
	</script>
	
	<script type="text/x-jquery-tmpl" id="itemTemplate">
		<tr>
			<tr class="show_time">\${show_time}</tr>
			<tr class="movie_name">\${movie_name}</tr>
			<tr class="movie_recycle_time">\${movie_recycle_time}</tr>
			<tr class="movie_director">\${movie_director}</tr>
			<tr class="delete"><input type="button" name="delete_button" code="\${show_present_code}" value="삭제 하기"></th>
		</tr>
	</script>
</head>
<body>
	
	<div id="schedule_frame">
		<c:forEach var="map" items="${place_map }">
			<div class="show_place_schedule" code="${map.key }">
				<h2>상영관 : ${map.value } <input type="button" name="new_button" code="${map.key }" value="상영 등록"></h2>
				<table>
					<thead>
						<tr>
							<th class="show_time">시간</th>
							<th class="movie_name">영화 제목</th>
							<th class="movie_recycle_time">상영 시간</th>
							<th class="movie_director">감독</th>
							<th class="delete">삭제</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<hr>
			<br>
			<br>
		</c:forEach>
	</div>
	
</body>
</html>


