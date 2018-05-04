<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/clientcenter/clientcenterMenu.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/clientcenter/clientCenterMeneAdd.css" />

<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#form").submit(function() {
			if (!$("#title").val()) {
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			}
			if (!$("#content").val()) {
				alert("내용을 입력하세요.");
				$("#content").focus();
				return false;
			}
		});
	
		$(".clientcenter_menu li").click(function(){
			$(this).addClass("selected");
			$(".clientcenter_menu li").not(this).removeClass("selected");
		});
	});

</script>
<style type="text/css">
	#star{
		color: red;
	}
	
	#inq_top_title{
		font-size: 23;
		font-weight: 900;
	}
	#can_btn,#in_btn{
		float: left;
		width: 50%;
		margin-top: 10px;
	}
	#inq_table {
		border-top: 1px solid black;
	}
	#inq_table th,td{
		height : 50px;
		width: 500px;
		border-bottom: 1px solid black;
	}
	#modi_btn {
		width: 50px;
	}
	
</style>
</head>
<body>
	<jsp:include page="/main/main/header.jsp"/>
	<div id="cont">
		<div id="cont_left">
			<div class="left_menubar">
				<ul class="clientcenter_menu">
					<li  id=""><a href="/MyCGV/clientCenter/clientCenterMain.jsp" ><strong>고객센터 메인</strong></a></li>
					<li  id=""><a href="/MyCGV/admin/qna/qnaList.do?pg=1"><strong>자주찾는 질문</strong> </a></li>
					<li  id=""><a href="/MyCGV/admin/noticeItem/noticeItemList.do?pg=1"><strong>공지/뉴스</strong></a></li>
					<li class="selected"  id=""><a href="/MyCGV/main/inquiry/inquiryWriteForm.do?pg=1"><strong>이메일 문의</strong></a></li>				
				</ul>
			</div>
		</div>
		<div id="cont_right">
			<div id="inq_top">
				<div id="inq_top_title">
					이메일 문의
				</div>
				<div id="inq_top_ment">
					<br>
					자주찾는 질문에서 원하는 답변을 찾지 못하셨군요 <br> 
					불편사항이나 문의사항을 남겨주시면 최대한 신속하게답변 드리겠습니다.
					<br><br>
				</div>
			</div>
			<div id="inq_bottum">
				<form id="form" name="inquiryWriteForm" method="post" action="inquiryWrite.do" enctype="multipart/form-data">
					<table id="inq_table"  cellspacing="0" cellpadding="0"> <!-- width="100%" -->
						<tr>
							<td colspan="2" align="right" bgcolor="#c9c9c9">
								체크(<span id="star">*</span>)된 항목은 필수 입력 사항입니다.
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td><label>${memberDTO.member_name }</label></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td><label>${memberDTO.member_phone }</label></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><label>${memberDTO.member_email }</label></td>
						</tr>
						<tr>
							<td colspan="2" >
								<strong>※&nbsp;&nbsp;문의에 대한 빠른 답변을 위해&nbsp;회원 가입 시 입력하신 연락처를 확인해주세요.</strong>
								 <input id="modi_btn" type="button" value="수정" onclick="">
							 </td>
						</tr>
						<tr>
							<th scope="row">문의 유형<span id="star">*</span></th>
							<td>
								<input type="radio" name="inquiry_type" value="문의" checked="checked" ><label>문의</label>
								<input type="radio" name="inquiry_type" value="불만"><label>불만</label>
								<input type="radio" name="inquiry_type" value="칭찬"><label>칭찬</label>
								<input type="radio" name="inquiry_type" value="제안"><label>제안</label>
							</td>
						</tr>
						<tr>
							<th>제목<span id="star">*</span></th>
							<td><input size="88" type="text" id="title" placeholder="제목을 입력해주세요" name="inquiry_title">
							</td>
						</tr>
						<tr>
							<th>내용<span id="star">*</span></th>
							<td>
								<textarea cols="90" rows="5" id="content" name="inquiry_content"
								style="height: 94px;" placeholder="내용을 입력해주세요"></textarea>
							</td>
						</tr>
						<tr>
							<th><label for="file">첨부파일</label></th>
							<td><input type="file" id="file"name="inquiry_file" size="51">
							</td>
						</tr>
					</table>
					<div>
						<div id="can_btn">
							<button style="border: 0; background: transparent;"  type="reset" >
								<img src="../../image/type/취소.png"  alt="취소"/>
							</button>
						</div>
						<div id="in_btn" align="right">
							<button style="border: 0; background: transparent;" type="submit">
								<img src="../../image/type/저장하기-red.png" alt="저장하기"/>
							</button>
						</div>
					</div>	
 				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/main/main/footer.jsp"/>
</body>
</html>