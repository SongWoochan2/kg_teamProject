<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/xdomain/jquery.xdomainajax.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/tmpl/jquery.tmpl.min.js"></script>
	<style type="text/css">
		#schedule_frame{
			width:  800px;
			margin: 0 auto;
			
		}
		#schedule_frame > fieldset{
			width: 100%;
			padding : 30px;
			
		}.show_place_schedule h2 input {
			font-size: 20px;
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
		.show_place_schedule thead, .show_place_schedule tbody, .show_place_schedule tr{
			display: block;
			width: 100%;
		}
		.show_place_schedule td, .show_place_schedule th{
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
				var tmpl = $("#template").tmpl(list[i]);
				$(".show_place_schedule[code='"+code+"'] > table > tbody").append(tmpl);
			}
			
			$("input[name='new_button']").click(function(){
				var show_place_code = $(this).attr("code");
				location.href="/MyCGV/showPresentWriteForm.do?sp_code="+show_place_code+"&count="+${param.count};
			});
			
			
			$("input[name='delete_button']").click(function(){
				var result = confirm("삭제 하시겠습니까?");
				if(result){
					location.href="/MyCGV/showPresentDelete.do?show_present_code="+$(this).attr("code");
				}
			});
			
			
			
		});
	</script>
	
	<script type="text/x-jquery-tmpl" id="template">
		<tr>
			<td class="show_time">\${ show_time }시 \${show_minute}분</td>
			<td class="movie_name">\${ movie_name }</td>
			<td class="movie_recycle_time">\${movie_recycle_time} </td>
			<td class="movie_director">\${movie_director}</td>
			<td class="delete"><input type="button" name="delete_button" code="\${show_present_code}" value="삭제 하기"></td>
		</tr>
	</script>
</head>
<body>
	<div id="schedule_frame">
		<fieldset>
		<legend>상영 현황</legend>
			<c:forEach var="show_place" items="${sp_list }">
				<div class="show_place_schedule" code="${show_place.show_place_code }">
					<h2>상영관 : ${show_place.show_place_name }  
						<input type="button" name="new_button" code="${show_place.show_place_code }" value="상영 등록">
					</h2>
					<br>
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
		</fieldset>
	</div>
	
</body>
</html>


