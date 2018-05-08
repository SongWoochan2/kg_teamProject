<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>목록 보기</title>
	<style type="text/css">
		#subjextA:link { color:black; text-decoration: none;}
		#subjextA:visited { color:black; text-decoration: none;}
		#subjextA:hover { color:green; text-decoration: underline;}
		#subjextA:achive { color:black; text-decoration: none;}
		#currentPaging { color:red; text-decoration: underline;}
		#paging { color: blue; text-decoration: none;}
	</style>
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypage.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/myContentAside.css" />
<link rel="stylesheet" type="text/css" href="/MyCGV/css/mypage/mypageHome.css" />
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
	$(function() {
		$("#content-aside > ul > li:eq(5)").attr("class", "on");
		
/*         $('#chkAllItem').checkboxGroup({
            parent: function () { return $('#items'); },
            selector: 'input[name=chkItem]'
        });

        $('#btnDelete').on('click', function () {
            if ($("input[name=chkItem]:checked").length < 1) {
                alert("삭제할 문의건을 먼저 선택해 주세요.");
                return false;
            }

            if (!confirm("선택하신 문의건을 삭제하시겠습니까?"))
                return false;

            //$('form').submit();
        }); */
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
				<div class="tit-mypage" style="float:left;height: 40px;">
				    <h4>1:1 문의</h4>
				</div>
			    <div class="set-btn" style="float: right;height: 40px;padding-right: 20px;">
			        <p class="del" style="font-size: 15px;">             
			            총&nbsp;<strong class="txt-red"> ${totalA} </strong>건
			           <!--  <button type="button" id="btnDelete" class="round-black"><span>선택삭제</span></button> -->
			        </p>
			    </div>
    <div class="tbl-data">
        <table>
		    <colgroup>
		        <col width="10%">
		        <col width="15%">
		        <col width="*">
		        <col width="20%">
		        <col width="15%">
		    </colgroup>
            <thead>
                <tr>
                    <th scope="col"><!-- <input type="checkbox" id="chkAllItem" name="chkAllItem"> -->
                    <label for="chkAllItem">번호</label></th>
                    <th scope="col">유형</th>
                    <th scope="col">제목</th>
                    <th scope="col">등록일</th>
                    <th scope="col">상태</th>
                </tr>
            </thead>
            <tbody id="items">  
                
            	<c:if test="${empty list}">
            		<tr>
            			<td colspan="7" class="nodata">
							 고객님의 상담 내역이 존재하지 않습니다.
                    	</td>
            		</tr>
            	</c:if>
            	<c:if test="${not empty list}">
                <c:forEach var="inquiryDTO" items="${list}" varStatus="status">
                        <tr>
                            <td>
                                <%-- <input type="checkbox" name="chkItem" value="${inquiryDTO.inquiry_code}" id="chkItem${inquiryDTO.inquiry_code}"> --%>
                                <label for="chkItem${inquiryDTO.inquiry_code}"><em>${status.index+1}</em></label>
                            </td>
                            <td>${inquiryDTO.inquiry_type}</td>
                            <td>
                                <a id="titleA" href="inquiryView.do?inquiry_code=${inquiryDTO.inquiry_code}&pg=${param.pg}">
									${inquiryDTO.inquiry_title}
								</a>
                            </td>
                            <td><em>${inquiryDTO.inquiry_date}</em></td>
                            <td>
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
                            </td>   
                        </tr>
                </c:forEach>   

                </c:if>             
            </tbody>
        </table>
        	                <div class="paging">
					<c:if test="${startPage > 3 }">
						<a id="paging" href="inquiryListMember.do?pg=${startPage-1}">이전</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${i == param.pg }">
							<a id="currentPaging" href="inquiryListMember.do?pg=${i }">${i }</a>
						</c:if>
						<c:if test="${i != param.pg }">
							<a id="paging" href="inquiryListMember.do?pg=${i }">${i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < totalP }">
						<a id="paging" href="inquiryListMember.do?pg=${endPage+1}">다음</a>
					</c:if>
					</div>
    </div>


    <div class="sect-my-reserve-qna">
        <div class="box-polaroid">
	        <div class="box-inner-qna">
	            <a href="/MyCGV/admin/qna/qnaList.do?pg=1" class="round-gray-on"></a>    
	        </div>
	        <div class="box-inner-words">
	           	<a href="/MyCGV/main/inquiry/inquiryWriteForm.do?pg=1" class="round-gray-on"></a>
	        </div>
	    </div>
    </div>
			</div> 
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
<div id="resultAlert"></div>
</body>
</html>























