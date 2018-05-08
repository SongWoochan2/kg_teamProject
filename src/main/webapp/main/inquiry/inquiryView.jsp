<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>글보기</title>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypage.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/myContentAside.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypageHome.css" />
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
	$(function() {
		$("#content-aside > ul > li:eq(5)").attr("class", "on");
        $('#btnDelete').on('click', function () {
            if (!confirm("문의건을 삭제하시겠습니까?"))
                return false;
			var inquiryCode = $("#inquiryCode").val();
			$.ajax({
				url: "/MyCGV/main/inquiry/inquiryDelete.do?inquiry_code="+inquiryCode,
        		type: "get",
        		dataType: "html",
        		cache: false,
        		timeout: 30000,
        		success: function(data) {
        			$("#resultAlert").html(data);
        		},
        		error: function(xhr, textStatus, errorThrown) {
					$("div.tbl-form").html("<div>" + textStatus 
							  + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
					}
        	});
			return false;
        });
	});
})(jQuery);
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
	<div id="mypageBody">
		<jsp:include page="/main/mypage/myInfoWrap.jsp"></jsp:include>
		<div id="my-content-wrap">
			<jsp:include page="/main/mypage/myContentAside.jsp"></jsp:include>
			<div id="content-detail">
			    <div class="tit-mypage" style="height: 50px;line-height: 40px;">
				    <h3>나의 문의내역</h3>
				</div>
				<div class="tit-mypage" style="float:left;height: 40px;line-height: 40px">
				    <h4>1:1 문의</h4>
				</div>
	<input type="hidden" id="inquiryCode" value="${inquiryDTO.inquiry_code}">
    <div class="tbl-viw">
        <table summary="">
            <thead style="line-height: 50px;">
                <tr>
                    <th scope="row" colspan="2">
                        <p>
                            <c:if test="${inquiryDTO.inquiry_status == 0}">
	                            <span class="round gray" style="font-weight: bold;color:gray;">
	                            	답변 미완료
	                            </span>
	                        </c:if>						
							<c:if test="${inquiryDTO.inquiry_status > 0}">
								<span class="round red on" style="font-weight: bold;color:red;">
									답변 완료
								</span>
							</c:if>
                            <strong>${inquiryDTO.inquiry_type }  ${inquiryDTO.inquiry_title }</strong>
                        </p>

                        <p style="float: right;">등록일 <em>${inquiryDTO.inquiry_date}</em></p>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="2" class="info">
                        <dl class="qna">
                            <dt>문의 MovieT</dt>
                            <dd><strong>MovieT본사</strong></dd>
                            <dt>연락처</dt>
                            <dd><strong class="aj_mobile">${memberDTO.member_phone}</strong></dd>
                            <dt>첨부파일</dt>
	            		    <dd>                   
								<c:if test="${inquiryDTO.inquiry_file != null}">
									<a href="../../image/inquiry/${inquiryDTO.inquiry_file }">${inquiryDTO.inquiry_file }</a>
								</c:if>
								<c:if test="${inquiryDTO.inquiry_file == null}">
									<span>없음</span>
								</c:if>                       
                            </dd>
                            <dt>이메일</dt>
                            <dd><strong class="aj_email">${memberDTO.member_email}</strong></dd>
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="txt-conts">
                            ${inquiryDTO.inquiry_content}
                        </div>
                           <c:if test="${inquiryDTO.inquiry_status>0 }"> 
                                <div class="reply">                              	
                                    <strong>답변 제목&nbsp;&nbsp;${answerDTO.answer_title}</strong>
                                    <span><strong>답변일</strong><em>${answerDTO.answer_date}</em></span></div>
                                <div class="box-polaroid">
                                    <div class="box-inner">
										${answerDTO.answer_content}
		                             </div>
                                </div>
                           </c:if>
                    </td>
                </tr>             
            </tbody>
        </table>
    </div>

    <div class="set-btn" style="height: 60px;padding: 10px;">
        <p><input type="button" class="round-gray" id="btnDelete" value="삭제"></p>
        <p><a class="round-inblack" href="inquiryListMember.do?pg=${param.pg}"><span>목록</span></a></p>
	</div>
			</div> 
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
<div id="resultAlert"></div>	

</body>
</html>


























