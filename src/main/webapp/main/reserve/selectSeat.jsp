<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/tmpl/jquery.tmpl.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/MyCGV/css/showPlace/seatView.css" />
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
		div{
			box-sizing: border-box;
		}
		#seat_select_frame{
			background-color:#FFFFF6;
			border: 1px solid gray;
			width: 100%;
			height: 100%;
			margin: 0 auto;
		}
		#seat_select_frame #frame_title{
			border: 1px solid white;
			background-color: #111111;
			text-align: center;
			color: white;
			font-weight: bold;
			width: 100%;
			height: 5%;
		}
		#seat_select_frame #frame_top{
				border: 1px solid gray;
			width: 100%;
			height: 15%;
		}
			#frame_top #frame_top_left{
				border: 1px solid gray;
				width: 50%;
				height: 100%;
				float: left;
				line-height: 70px;
			}
		
			    #frame_top_left label {
				    cursor: pointer;
				    width: 30px;
				    height: 30px;
				    margin-bottom: 0;
				    padding: 3px 7px;
			    }
			
			    #frame_top_left input[type="radio"] {
			      	display: none;
				    width: 100%;
				    height: 100%;
			    }
			
			    #frame_top_left input[type="radio"]+label {
					background-color:#FFFFF6;
					border: 2px solid black;
				    width: 100%;
				    height: 100%;
			    }
			
			   #frame_top_left input[type="radio"]:checked+label {
			      	background-color: black;
					border: 1px solid #FFFFF6;
			      	color: #FFFFF6;
				    width: 100%;
				    height: 100%;
		   		}
			#frame_top #frame_top_right{
				border: 1px solid gray;
				padding: 10px;
				width: 50%;
				height: 100%;
				float: left;
			}
				#frame_top_right #inner_top{
					font-size: 15px;
					font-weight: bold;
					width: 100%;
					height: 40%;
					float: left;
				}
				#frame_top_right #inner_middle{
					font-size: 10px;
					width: 100%;
					height: 20%;
					float: left;
					line-height: 20px;
				}
				#frame_top_right #inner_bottom{
					font-size: 15px;
					font-weight: bold;
					width: 100%;
					height: 40%;
					float: left;
					line-height: 40px;
				}
		
		#seat_select_frame #frame_bottom{
			border: 1px solid gray;
			width: 100%;
			height: 80%;
			float: left;
		}
			#frame_bottom #bottom_left{
				border: 1px solid gray;
				padding: 10px;
				width: 70%;
				height: 100%;
				float: left;
			}
			#frame_bottom #bottom_right{
				border: 1px solid gray;
				width: 30%;
				height: 100%;
				float: left;
			}
				#bottom_right #inner_top{
					border: 1px solid gray;
					width: 100%;
					height: 60%;
					float: left;
				}
				#bottom_right #inner_top img{
					width: 100%;
					height: 100%;
				}
				#bottom_right #inner_middle{
					border: 1px solid gray;
					width: 100%;
					height: 25%;
					float: left;
				}
				#bottom_right #inner_bottom{
					border: 1px solid gray;
					width: 100%;
					height: 15%;
					float: left;
				}
					#bottom_right #inner_bottom input{
						width: 100%;
						height: 100%;
					}	
		
		
		
		
		
		
	</style>
	<script type="text/javascript">
		$(function(){
			var seat_json = ${json};
			var seat_list = seat_json.seat;
			
			var x_size = seat_json.x_size;
			var y_size = seat_json.y_size;
			var seatView = $("#seatView").empty();

			for(var y = 1; y <= y_size; y++){
				var row_number = String.fromCharCode(64 + y);
				var seat_div = $("<div>").addClass("row_label").html(row_number);
				var row_label = $("<div>").attr({"name":"row", "row_number":row_number}).append(seat_div);
				seatView.append(row_label);
			}
			for(var i = 0; i < seat_list.length; i++){
				var row_number = seat_list[i].y_index;
				var col_number = seat_list[i].x_index;
				var seat_type_code = seat_list[i].seat_type_code;
				var seat_type = null;
				
				if(row_number == "!"){ continue;}
				
				if(seat_type_code == "0"){
					seat_type = "empty";
				} else if(seat_type_code == "1"){
					seat_type = "easy";
				} else if(seat_type_code == "2"){
					seat_type = "basic";
				} else if(seat_type_code == "3"){
					seat_type = "good";
				} else if(seat_type_code == "4"){
					seat_type = "couple";
				}
				$("div[name='row'][row_number='"+row_number+"']").append(
						$("<div>").addClass(seat_type).attr(
								{ 	"row_number": row_number,
									"name" : "seat", 
									"col_number": col_number, 
									"seat_type": seat_type_code	}
							).val(col_number).html(col_number));
			}
			for(var i = 0; i < seat_list.length; i++){
				var row_number = seat_list[i].y_index;
				var col_number = seat_list[i].x_index;
				if(row_number == "!"){
					$("div[name='row']").each(function(){
						$(this).find("div[col_number='"+col_number+"']").css("margin-right", "20px");
					});
					continue;
				}
			}
			
			var reserved_list = seat_json.reserved;

			for(var i = 0; i < reserved_list.length; i++){
				var row_number = reserved_list[i].y_index;
				var col_number = reserved_list[i].x_index;
				//alert(JSON.stringify(reserved_list));
				//alert(row_number+ " / " + col_number);
				var rSeat = $("div[name='seat'][row_number='"+row_number+"'][col_number='"+col_number+"']");
				rSeat.removeClass().addClass("reserved").attr("seat_type", 100);
				
			}
			
			
			
			
			
		});
	</script>
</head>
<body>
	<div id="seat_select_frame">
		<div id="frame_title">인원 / 좌석</div>
		<div id="frame_top">
			<div id="frame_top_left">
					<label for="total_seat_num"> 인원 : </label>
					<input type="radio" id="total_seat_num0" name="total_seat_num" value="0" checked="checked"><label for="total_seat_num0">0</label>
					<input type="radio" id="total_seat_num1" name="total_seat_num" value="1"><label for="total_seat_num1">1</label>
					<input type="radio" id="total_seat_num2" name="total_seat_num" value="2"><label for="total_seat_num2">2</label>
					<input type="radio" id="total_seat_num3" name="total_seat_num" value="3"><label for="total_seat_num3">3</label>
					<input type="radio" id="total_seat_num4" name="total_seat_num" value="4"><label for="total_seat_num4">4</label>
					<input type="radio" id="total_seat_num5" name="total_seat_num" value="5"><label for="total_seat_num5">5</label>
					<input type="radio" id="total_seat_num6" name="total_seat_num" value="6"><label for="total_seat_num6">6</label>
					<input type="radio" id="total_seat_num7" name="total_seat_num" value="7"><label for="total_seat_num7">7</label>
					<input type="radio" id="total_seat_num8" name="total_seat_num" value="8"><label for="total_seat_num8">8</label>
			</div>
			<div id="frame_top_right">
				<div id="inner_top">
					${showInfo.movie_name }
				</div>
				<div id="inner_middle">
					${showInfo.theater_name } | ${showInfo.show_place_name } | (남은 좌석 / 총 좌석)
				</div>
				<div id="inner_bottom">
					${showInfo.show_date } ${showInfo.show_time }시 ${showInfo.show_minute }분  시작 (${showInfo.movie_recycle_time }분 )
				</div>
			</div>
		</div>
		
		<div id="frame_bottom">
			<div id="bottom_left">
			
				<div class="screen">스크린</div>
				<div id="seatView"></div>
				
			</div>
			<div id="bottom_right">
				<div id="inner_top">
					<img alt="영화이미지" src="/MyCGV/image/storage/moviephoto/${showInfo.movie_photo_addr }">
				</div>
				<div id="inner_middle">
					${showInfo.movie_name }
				</div>
				<div id="inner_bottom">
					<input type="button" value="결제하기">
				</div>
			</div>
		</div>
	</div>
</body>
</html>

























