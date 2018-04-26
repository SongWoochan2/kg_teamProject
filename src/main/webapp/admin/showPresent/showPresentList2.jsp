<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			for(var i = 0; i < 22; i++){
				var time = i + 6;
				if(time > 24){ time -= 24; }
				$(".time_label").append($("<div>").addClass("time_box").attr("time", time).html(time).append($("<hr>")));
			}
		});
	</script>
	<c:forEach var="show_place_code" items="${ place_set }">
		<script type="text/javascript">
			$(function(){
				$("#schedule_frame").append( $("<div>").addClass("schedule_box").attr("show_place_code", "${show_place_code}") );
			});
		</script>
	</c:forEach>
	<c:forEach var="presentVO" items="${list}">
		<script type="text/javascript">
			$(function(){
				var box = $(".schedule_box[show_place_code='${presentVO.show_place_code}']");
				var present = $("<div>").addClass("show_present");
				present.html("${presentVO.movie_name}<br>${presentVO.show_time}:${presentVO.show_minute}/${presentVO.movie_recycle_time}");
				present.css("height", "${presentVO.movie_recycle_time}px");
				present.css("top", "${(presentVO.show_time-6)*60 + presentVO.show_minute}px");
				present.attr("show_present_code", "${presentVO.show_present_code}");
				
				box.append(present);
			});
		</script>
	</c:forEach>
	<c:forEach var="show_place_code" items="${ place_set }">
		<script type="text/javascript">
			$(function(){
				$(".schedule_box").append( $("<input>").attr("type", "button").val("추가").addClass("show_add").attr("show_place_code", "${show_place_code}") );
			});
		</script>
	</c:forEach>
	<script type="text/javascript">
		$(function(){
			$(".show_add").click(function(){
				location.href="/MyCGV/showPresentWriteForm.do?sp_code="+$(".show_add").attr("show_place_code");
			});
			
		});
	</script>
	
	<style type="text/css">
		div{
			box-sizing: border-box;
		}
		.time_label{
			text-align: right;
			position: relative;
			top: -10px;
			width: 60px;
			height: 1420px;
			float: left;
		}
		.schedule_box{
			width: 120px;
			height: 1100px;
			border: 1px dotted black;
			float: left;
		}
		.time_box{
			width: 100%;
			height: 60px;
			border : 1px dotted red;
		}
		.show_present{
			position: relative;
			width: 100%;
			background-color: gray;
			border: 1px dotted blue;
		}
	</style>
</head>
<body>
	
	<div id="schedule_frame">
		<div class="time_label">
		</div>
		<c:forEach var="i" begin="1" end="4" step="1">
			<div class="schedule_box">
			</div>
		</c:forEach>
	</div>
	
	<div></div>
	
	
	
	
</body>
</html>