<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 보기</title>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//링크를 클릭한 경우
		$("a.modal").click(function(){
			//배경 레이어를 화면에 표시한다.
			$("#glayLayer").fadeIn(300);
			//이미지 레이어를 화면에 표시한다.
			$("#overLayer").fadeIn(200);
			
			$("#overLayer").html("<img src='"+$(this).attr("href")+"'/>");
			//링크페이지 이동중단.
			return false;
		});
		//(화면에 표시된) 배경 레이어를 클릭한 경우
		$("#glayLayer,#overLayer").click(function(){
			//배경 레이어의 숨김
			$("#glayLayer").fadeOut(300);
			
			//이미지 레이어의 숨김
			$("#overLayer").fadeOut(200);
		});	
	});
</script>
<style type="text/css">
	div#glayLayer{
		display: none; position: fixed; left: 0; top: 0;
		height: 100%; width: 100%; background: black;
		filter: alpha(opacity=60); opacity: 0.60;
	}
	/* 이미지가 표현될 레이어를 화면 중앙에 배치> 기본적으로 표시되지 않도록 설정 */
	#overLayer{
		display: none; position: fixed;
		top: 50%; left: 50%;
		margin-top: -244px; margin-left: -325px;
	}
</style>
</head>
<body>
	<div id='glayLayer'></div><div id='overLayer'></div>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td colspan="3">
				<font size="5">${inquiryDTO.inquiry_title }</font>
			</td>
		</tr>
		<tr>
			<td>글번호 : ${inquiryDTO.inquiry_code }</td>
			<td>문의 종류 : ${inquiryDTO.inquiry_type }</td>
		</tr>
		<tr>
			<td colspan="3">
				첨부 파일 : <a href="../../image/inquiry/${inquiryDTO.inquiry_file}" class="modal">
				${inquiryDTO.inquiry_file }</a>
			</td>
		</tr>
		<tr>
			<td colspan="3" height="200" valign="top">
				<pre>${inquiryDTO.inquiry_content }</pre>
			</td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='inquiryList.do?pg=${param.pg}'">
	<input type="button" value="삭제" onclick="location.href='inquiryDelete.do?inquiry_code=${inquiryDTO.inquiry_code}'">
	<br><br>
	<input type="button" value="메인으로" onclick="location.href='/MyCGV/admin/clientCenter/clientCenterMain.jsp'">
	<input type="button" value="뒤로" onclick="history.back(); return false;">
</body>
</html>
