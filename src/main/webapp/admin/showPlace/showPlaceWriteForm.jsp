<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<title>상영관 등록</title>
	<link href="../css/bootstrap.css" rel = "stylesheet">
	<link rel="stylesheet" type="text/css" href="/MyCGV/css/showPlace/seatView.css" />
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var x_index = $("#x_index");
			var y_index = $("#y_index");
			
			for(var x = 1; x <= 50; x++){
				var option = $("<option>").val(x).html(x);
				x_index.append(option);
				
			}
			for(var y = 1; y <= 40; y++){
				var option = $("<option>").val(y).html(y);
				y_index.append(option);
			}
			
			$(document).on("click", "input[name='passage']", function() {
				var col_number = $(this).attr("col_number");
				if($(this).is(":checked")){
					$("div[name='row']").each(function(){
						$(this).find("div[name='seat']").each(function(){
							if(col_number+"" == $(this).attr("col_number")){
								$(this).css("margin-right", "20px");
								return;
							}
						});
					});
				} else {
					$("div[name='row']").each(function(){
						$(this).find("div[name='seat']").each(function(){
							if(col_number+"" == $(this).attr("col_number")){
								$(this).css("margin-right", "1px");
								return;
							}
						});
					});
				}
			});
			
			 $(document).on("click", "div[name='seat']", function() {
				var seat_type = $("input[name='seat_type']:checked:eq(0)").val();
				if(seat_type == "0"){
					$(this).removeClass();
					$(this).addClass("empty").attr("seat_type", 0);
				} else if(seat_type == "1"){
					$(this).removeClass();
					$(this).addClass("easy").attr("seat_type", 1);
				} else if(seat_type == "2"){
					$(this).removeClass();
					$(this).addClass("basic").attr("seat_type", 2);
				} else if(seat_type == "3"){
					$(this).removeClass();
					$(this).addClass("good").attr("seat_type", 3);
				} else if(seat_type == "4"){
					$(this).removeClass();
					$(this).addClass("couple").attr("seat_type", 4);
				} else {
					alert("만들 좌석의 종류를 선택해 주세요.");
				}
			}); 
			
			$(document).on("click", ".row_label", function() {
				var seat_type = $("input[name='seat_type']:checked:eq(0)").val();
				$(this).parent().find("div[name='seat']").each(function(){
					if(seat_type == "0"){
						$(this).removeClass();
						$(this).addClass("empty").attr("seat_type", 0);
					} else if(seat_type == "1"){
						$(this).removeClass();
						$(this).addClass("easy").attr("seat_type", 1);
					} else if(seat_type == "2"){
						$(this).removeClass();
						$(this).addClass("basic").attr("seat_type", 2);
					} else if(seat_type == "3"){
						$(this).removeClass();
						$(this).addClass("good").attr("seat_type", 3);
					} else if(seat_type == "4"){
						$(this).removeClass();
						$(this).addClass("couple").attr("seat_type", 4);
					} else {
						alert("만들 좌석의 종류를 선택해 주세요.");
					}
				});
			 });
			
			
			$("#make_seat").click(function(){
				$("input[name='seat_code']").val("");
				var x_size = $("#x_index option:selected").val();
				var y_size = $("#y_index option:selected").val();
				var seatView = $("#seatView").empty();


				$("#passage_field").empty();
				$("#passage_field").append("<legend>통로</legend>");
				for(var x = 1; x < x_size; x++){
					$("#passage_field").append(
							$("<label>").html(x+"과 "+(x+1)+"사이").append( 
									$("<input>").attr({"type":"checkbox","name":"passage", "col_number": x}) 
							).append("<br>")
					); 
				}

				for(var y = 1; y <= y_size; y++){
					seatView.append($("<div>").attr("name", "row").attr("row_number", String.fromCharCode(64 + y) ));
				}
				$("div[name='row']").each(function(){
					var row_number = $(this).attr("row_number");
					$(this).append($("<div>").addClass("row_label").html(row_number));
					for(var x = 1; x <= x_size; x++){
						$(this).append($("<div>").addClass("empty").attr({"row_number": row_number,"name" : "seat", "col_number": x, "seat_type": 0}).val(x).html(x));
					}
				});
			});
			

			
			$(imageboardWriteForm).submit(function(){
	 			var seat_json = {};
		 		var list = [];
	 			
				var i = 0;
				$("div[name='row']").each(function(){
					var row_number = $(this).attr("row_number");
					$(this).find("div[name='seat']").each(function(){
						var col_number = $(this).attr("col_number");
						var seat_type_code = $(this).attr("seat_type");
						
			 			var seat = { 	x_index : col_number,
				 						y_index : row_number,
				 						seat_type_code : seat_type_code	};
			 			list[i++] = seat;
					});
				});

				$("input[name='passage']").each(function(){
			 		if($(this).is(":checked")){
				 		var seat = { 	x_index : $(this).attr("col_number")+"",
					 					y_index : "!",
					 					seat_type_code : "0" 							};
			 			list[i++] = seat;
					}
				});
				
				
				seat_json={"seat": list }
				$("input[name='seat_code']").val(JSON.stringify(seat_json));
				
				alert($("input[name='seat_code']").val());
			});
			
		});
	</script>
	<style type="text/css">
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
		.leftSide {
			background: orange;
			width: 100px;
		}
	</style>
</head>
<body>
<jsp:include page="../adminMain/adminTemplate.jsp"/>
<div id = "content" align="center">
	<div id="wrapper">
		<h2>이미지 등록</h2>
		<form name="imageboardWriteForm" method="post" enctype="multipart/form-data" action="/MyCGV/showPlaceWrite.do?theater_code=${param.theater_code}">
			<input type="hidden" name="seat_code">
			<table border="1">
				<tr>
					<td class="leftSide">상영관명</td>
					<td>
						<input type="text" name="show_place_name">
					</td>
				</tr>
				<tr>
					<td class="leftSide">기본가격</td>
					<td>
						<input type="text" name="default_cost">
					</td>
				</tr>
				<tr>
					<td colspan="2" >
						<input type="file" name="img">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label for="x_index">가로 :</label>
						<select name="x_index" id="x_index"></select>
						<label for="y_index">세로 :</label>
						<select name="y_index" id="y_index"></select>
						<input type="button" id="make_seat" value="만들기"> 
					</td>
				</tr>
			</table>
			<div class="screen">스크린</div>
			<div id="seatView"></div>
			<fieldset id="seat_type_field">
                <legend>좌석종류</legend>
				<label><input type="radio" name="seat_type" value="0" checked="checked">빈좌석</label>
				<label><input type="radio" name="seat_type" value="1">장애인석</label>
				<label><input type="radio" name="seat_type" value="2">일반석</label>
				<label><input type="radio" name="seat_type" value="3">우등석</label>
				<label><input type="radio" name="seat_type" value="4">커플석</label>
            </fieldset>
			<fieldset id="passage_field">
                <legend>통로</legend>
            </fieldset>
			<input type="submit" value="등록">
			<input type="reset" value="다시 작성">
		</form>
	</div>
</div>
</body>
</html>