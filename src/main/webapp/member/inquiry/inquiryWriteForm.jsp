<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	});
</script>
<style type="text/css">

	div{
		border: 1px solid black;
	}
	#star{
		color: red;
	}
	#id{
		width: 450px;
	}

	/* 탭 버튼의 초기화 및 레이어 띄우기 > 내용영역과 1px 겹쳐야 한다 */
	ul{
		list-style: none; position: relative; z-index: 100;
	}
	#side,#main{
		float: left;
	}
	
	/* 개별 버튼에 대한 기본 크기와 가로정렬 */
	ul #inquiry li{
		width: 100px; float: left;
	}
	
	/* float 속성 해제 처리 */
	ul:after{
		content: ''; display: block; float: none; clear: both;
	}
</style>
</head>
<body>
	<!-- Contents Start -->
	<div id="cols-content">
		<!-- <h2>고객센터 메뉴</h2> -->
		<div id="side">
			<ul>
				<li id=""><a href="">고객센터 메인</a></li>
				<li id=""><a href="">자주찾는 질문 </a></li>
				<li id=""><a href="">공지/뉴스</a></li>
				<li id=""><a href="">이메일 문의<i></i></a></li>					
			</ul>
		</div>
		<div id="main">
			<div id="email_list_area">
				<div id="customer_top">						
					<p id="stit">자주찾는 질문에서 원하는 답변을 찾지 못하셨군요 <br> 
						불편사항이나 문의사항을 남겨주시면 최대한 신속하게답변 드리겠습니다.
					</p>
				</div>
				<form	id="form" name="inquiryWriteForm" method="post" action="inquiryWrite.do" enctype="multipart/form-data">
					<fieldset>
						<legend>
							<h2>이메일 문의</h2>
						</legend>
						<div id="tbl_area">
							<p id="tbl_info_txt">체크(<span id="star">*</span>)된 항목은 필수 입력 사항입니다.</p>
							<table cellspacing="0" cellpadding="0" border="1">
								<tbody>
									<!--  <tr>
										<th>임시 아이디</th>
										<td colspan="3"><input type="text"name="inquiry_id" value="jinhwanea">
										</td>
									</tr> -->
									<tr>
										<th>이름</th>
										<td colspan="3"><input type="text"name="member_name" value="${memberDTO.member_name }" ></td>
									</tr>
									<tr>
										<th>휴대전화</th>
										<td colspan="3"><input type="text"name="member_phone" value="${memberDTO.member_phone }" ></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td colspan="3"><input type="text"name="member_email" value="${memberDTO.member_email }" ></td>
									</tr>
									<tr id="check_info">
										<td colspan="4">
											<strong>※&nbsp;&nbsp;문의에 대한 빠른 답변을 위해&nbsp;회원 가입 시 입력하신 연락처를 확인해주세요.</strong>
											 <a href=""><span>수정</span></a>
										 </td>
									</tr>
									<tr>
										<th scope="row">문의 유형<span id="star">*</span></th>
										<td colspan="3">
											<input type="radio" name="inquiry_type" value="문의" checked="checked" ><label>문의</label>
											<input type="radio" name="inquiry_type" value="불만"><label>불만</label>
											<input type="radio" name="inquiry_type" value="칭찬"><label>칭찬</label>
											<input type="radio" name="inquiry_type" value="제안"><label>제안</label>
										</td>
									</tr>
									<tr>
										<th>제목<span id="star">*</span></th>
										<td colspan="3"><input type="text" id="title" placeholder="제목을 입력해주세요" name="inquiry_title">
										</td>
									</tr>
									<tr>
										<th>내용<span id="star">*</span></th>
										<td colspan="3">
											<textarea cols="60" rows="5" id="content" name="inquiry_content"
											style="height: 94px;" placeholder="내용을 입력해주세요"></textarea>
										</td>
									</tr>
									<tr>
										<th><label for="file">첨부파일</label></th>
										<td colspan="3"><input type="file" id="file"name="inquiry_file" size="51">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="qna_email">
							<button style="width: 80px" type="submit" >
								<span>등록하기</span>
							</button>
							<button style="width: 80px" type="reset" >
								<span>취소</span>
							</button>
						</div>				
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>