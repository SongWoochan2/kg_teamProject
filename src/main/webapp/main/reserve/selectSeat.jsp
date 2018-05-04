<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/MyCGV/plugins/tmpl/jquery.tmpl.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/MyCGV/css/reserve/seatView.css" />
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
				#frame_top_right .inner_top{
					font-size: 15px;
					font-weight: bold;
					width: 100%;
					height: 40%;
					float: left;
				}
				#frame_top_right .inner_middle{
					font-size: 10px;
					width: 100%;
					height: 20%;
					float: left;
					line-height: 20px;
				}
				#frame_top_right .inner_bottom{
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
				#bottom_right .inner_top{
					border: 1px solid gray;
					width: 100%;
					height: 60%;
					float: left;
				}
				#bottom_right .inner_top img{
					width: 100%;
					height: 100%;
				}
				#bottom_right .inner_middle{
					border: 1px solid gray;
					width: 100%;
					height: 30%;
					float: left;
					overflow-y: auto; 
				}
				#bottom_right .inner_bottom{
					border: 1px solid gray;
					width: 100%;
					height: 10%;
					float: left;
				}
					#bottom_right .inner_bottom form{
						width: 100%;
						height: 100%;
					}
					#bottom_right .inner_bottom input{
						width: 100%;
						height: 100%;
					}	
		
		
	</style>
	<script type="text/javascript">
		$(function(){
			var seat_json = ${json};
			var seat_list = seat_json.seat;
			var reserved_list = seat_json.reserved;
			var seat_num = seat_json.seat_num;
			
			$("#frame_top_right #inner_middle").append("( " + (seat_num-reserved_list.length) + "석 / " + seat_num + "석 ) ");
			
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
				var add_cost = seat_list[i].add_cost;
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
									"seat_type": seat_type_code, 
									"add_cost": add_cost	}
							).val(col_number).html(col_number));
			}
			for(var y = 1; y <= y_size; y++){
				var row_number = String.fromCharCode(64 + y);
				var seat_div = $("<div>").addClass("row_label").html(row_number);
				var row_label = $("div[name='row'][row_number='"+row_number+"']").append(seat_div);
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
			for(var i = 0; i < reserved_list.length; i++){
				var row_number = reserved_list[i].y_index;
				var col_number = reserved_list[i].x_index;
				var rSeat = $("div[name='seat'][row_number='"+row_number+"'][col_number='"+col_number+"']");
				rSeat.removeClass().addClass("reserved").attr("seat_type", 100);
			}
			
			
			
			
			$("input[name='total_seat_num']").off("click");
			$("input[name='total_seat_num']").click(function(){
				if($(this).val() < chooseCount()){
					alert("선택된 좌석보다 적습니다.");
					$("#total_seat_num"+chooseCount()).prop("checked", true);
				}
			});

			//$("div[name='seat']").off("click");
			
			
			$("#reservingForm").off("click");
			$("#reservingForm").submit(function(){
				if(chooseCount() < $("input[name='total_seat_num']:checked").val()){
					alert("인원 수와 좌석 수가 맞지 않습니다.");
					return false;
				}
				
				var result = confirm("결제하시겠습니까?");
				if(result){
					reservingFormSubmit();
					return false;
				}
			});
			
		});
		

	    function reservingFormSubmit(){
	        var formData = $("#reservingForm").serialize();
	        $.ajax({
	            cache : false,
	            url : "${pageContext.request.contextPath}/reserving.do", // 요기에
	            type : 'POST', 
	            dataType : "json",
	            data : formData, 
	            async : false,
	            success : function(json) {
	                alert(JSON.stringify(json));
	                if(json.su == 0){
	                	alert("이미 예약된 좌석입니다.");
	    				getSeatSelector(last_select);
	    				$("#my_popup_shadow").show(0);
	    				$("#my_popup_div").show(0);
	                }else if(json.su == 1){
	                	alert("예매 성공!");
	                	$("#my_popup_shadow").hide(0);
	    				$("#my_popup_div #popup_main").empty();
	    				$("#my_popup_div").hide(0);
	    				getShowList();
	                }
	            }, // success 
	            error : function(xhr, status) {
	                alert(xhr + " : " + status);
	            }
	        }); // $.ajax */
	    }
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
				<div class="inner_top">
					${showInfo.movie_name }
				</div>
				<div class="inner_middle">
					${showInfo.theater_name } | ${showInfo.show_place_name } | 
				</div>
				<div class="inner_bottom">
					${showInfo.show_date } ${showInfo.show_time }시 ${showInfo.show_minute }분 ~ (${showInfo.movie_recycle_time }분 )
				</div>
			</div>
		</div>
		
		<div id="frame_bottom">
			<div id="bottom_left">
				<div id="setting_zone_top">
					<div class="info_box">
						<div name="seat" choose='y'></div>선택좌석
					</div>
					<div class="info_box">
						<div name="seat" class="easy"></div>장애인석
					</div>
					<div class="info_box">
						<div name="seat" class="basic"></div>일반석
					</div>
					<div class="info_box">
						<div name="seat" class="good"></div>우등석
					</div>
					<div class="info_box">
						<div name="seat" class="couple"></div>커플석
					</div>
					<div class="info_box">
						<div name="seat" class="reserved"></div>예매완료
					</div>
				</div>
				<div id="setting_zone_center">
					<div class="screen">스크린</div>
					<div id="seatView"></div>
				</div>
			</div>
			<div id="bottom_right">
				<div class="inner_top">
					<img alt="영화이미지" src="/MyCGV/image/storage/moviephoto/${showInfo.movie_photo_addr }">
				</div>
				<div class="inner_middle">
					<strong>총 가격 : </strong>
				</div>
				<div class="inner_bottom">
					<form id="reservingForm" name="reservingForm" method="post" action="#">
						<input type="hidden" name="time_add_cost" value="${time_add_cost + showInfo.default_cost }">
						<input type="hidden" name="show_present_code" value="${showInfo.show_present_code }">
						<input type="hidden" name="show_place_code" value="${showInfo.show_place_code }">
						<input type="hidden" name="seat1" x_index="" y_index="" cost="" value="">
						<input type="hidden" name="seat2" x_index="" y_index="" cost="" value="">
						<input type="hidden" name="seat3" x_index="" y_index="" cost="" value="">
						<input type="hidden" name="seat4" x_index="" y_index="" cost="" value="">
						<input type="hidden" name="seat5" x_index="" y_index="" cost="" value="">
						<input type="hidden" name="seat6" x_index="" y_index="" cost="" value="">
						<input type="hidden" name="seat7" x_index="" y_index="" cost="" value="">
						<input type="hidden" name="seat8" x_index="" y_index="" cost="" value="">
						<input type="submit" id="reserve_submit" value="결제하기">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

























