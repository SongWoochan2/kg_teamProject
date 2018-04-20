<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>글보기</title>
	<link rel="stylesheet" type="text/css" href="/MyCGV/css/showPlace/seatView.css" />
	<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var seat_json = ${json};
			var seat_list = seat_json.seat;
			
			var x_size = ${x_size};
			var y_size = ${y_size};
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
			for(var i = 0; i <= seat_list.length; i++){
				var row_number = seat_list[i].y_index;
				var col_number = seat_list[i].x_index;
				if(row_number == "!"){
					$("div[name='row']").each(function(){
						$(this).find("div[col_number='"+col_number+"']").css("margin-right", "20px");
					});
					continue;
				}
			}
		});
	</script>
</head>
<body>
	<div id="wrapper">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td colspan="4">
					<font size="5">상영관명 : ${showPlaceVO.show_place_name }</font>
				</td>
			</tr>
			<tr>
				<td>코드 : ${showPlaceVO.show_place_code }</td>
				<td>좌석수 : ${showPlaceVO.seat_num }</td>
				<td>기본가격 : ${showPlaceVO.default_cost }</td>
			</tr>
			<tr>
				<td colspan="4" height="200" valign="top">
					<img alt="상영관 이미지" src="${showPlaceVO.show_place_photo_addr }">
				</td>
			</tr>
		</table>
	</div>
	<div class="screen">스크린</div>
	<div id="seatView">
	
	</div>
	
	<input type="button" value="뒤로" onclick="history.back(); return false;">
	<c:if test="${admin_id != null }">
		<input type="button" value="수정" onclick="location.href='/MyCGV/showPlaceModifyForm.do?theater_code=${param.theater_code}&sp_code=${showPlaceVO.show_place_code}'">
		<input type="button" value="삭제" onclick="location.href='/MyCGV/showPlaceDelete.do?theater_code=${param.theater_code}&sp_code=${showPlaceVO.show_place_code}'">
	</c:if>
	
</body>
</html>


























