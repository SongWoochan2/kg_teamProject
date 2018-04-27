<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
    $(function () {

        $('#btn_search').on('click', function () {
            var arr = $("#startdate").val().split('-');
            var dt = new Date(arr[0], arr[1], arr[2]);
            var dt_v = new Date(arr[0], arr[1], arr[2]);

           
            dt_v.setDate(dt.getDate() + 90);
            var Denddate = dt_v.getFullYear() + '-' + dt_v.getMonth() + '-' + dt_v.getDate();
            //  location.href = "./pointlist.aspx?startdate=" + $("#startdate").val() + "&enddate=" + $("#enddate").val();     
            location.href = "./pointlist.aspx?startdate=" + $("#startdate").val() + "&enddate=" + Denddate;
           
        });

        $('#period_wrap').datePeriod({
            'start': $('#startdate'),
            'end': $('#enddate'),
            'data': [
                { 'title': '2주일', 'data-period': 2, 'data-type': 'w' },
                { 'title': '1개월', 'data-period': 1, 'data-type': 'm' },
                { 'title': '3개월', 'data-period': 3, 'data-type': 'm' },

            ]
        });

    });
})(jQuery);
</script>
</head>
<body>
	<jsp:include page="../main/main/header.jsp"></jsp:include>
	<div id="mypageBody">
	<jsp:include page="./myInfoWrap.jsp"></jsp:include>
		<div id="my-content-wrap">
			<jsp:include page="./myContentAside.jsp"></jsp:include>
			<div id="content-detail">
			    <div class="tit-mypage">
				    <h3>MoveIt 포인트</h3>
				</div>
			    <div class="tit-mypage">
				    <h4>MoveIt 포인트 적립 및 사용내역</h4>
				</div>

			    <div class="tbl-breakdown">
			        <table>
			            <caption>MoveIt 포인트 상세 내역</caption>
			            <colgroup>
			                <col span="2" width="50%">
			            </colgroup>
			            <thead>
			                <tr>
				                <th scope="col">구분</th>
				                <th scope="col">내용</th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr class="tooltip_list">
			                	<th scope="row">
									<strong>MoveIt 사용가능 포인트</strong>
									
								</th>
			
			                	<td>${memberDTO.saving_point}</td>
			                </tr>
			            </tbody>
			        </table>
			        <p class="common_p">※ MoveIt VIP 선정은 매표/매점 구매 포인트 합산 기준으로 적용됩니다.</p>
			    </div>

<form name="myPointList" method="post" action="myPointListPeriod.do" id="myPointList" novalidate="novalidate">
    <div class="box-polaroid">
        <div class="box-inner">
            <strong class="period">조회기간</strong>
            <span id="period_wrap">
            	<button data-period="2" data-type="w" class="round gray"><span>2주일</span></button>
            	<button data-period="1" data-type="m" class="round gray"><span>1개월</span></button>
            	<button data-period="3" data-type="m" class="round gray"><span>3개월</span></button>
            </span>
            <p>
                <label for="startdate">시작일 입력</label>
                <input type="text" id="startdate" name="startdate" value="2018-03-26" 
                datepicker="datepicker" date="date" class="hasDatepicker" readonly="readonly">
                <button type="button" class="ui-datepicker-trigger" title="월이동:PageUp/PageDown, 일이동:Ctrl+방향키">
                <span>시작일 선택</span></button> ~
                <label for="enddate">종료일 입력</label>
                <input type="text" id="enddate" name="enddate" value="2018-04-26" 
                datepicker="datepicker" date="date" class="hasDatepicker" readonly="readonly">
                <button type="button" class="ui-datepicker-trigger" title="월이동:PageUp/PageDown, 일이동:Ctrl+방향키">
                <span>종료일 선택</span></button>
                <button type="button" id="btn_search" class="round inblack"><span>조회하기</span></button>
            </p>
        </div>
    </div>
</form>
	<div class="tbl-data">
		<table summary="구매 구분, 결제 금액, 적립일, 적립 포인트 표기">
			<colgroup>
				<col width="18%">
				<col width="18%">
				<col width="18%">
				<col width="18%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">구매 구분</th>
					<th scope="col">결제 금액</th>
					<th scope="col">적립일</th>
					<th scope="col">적립</th>
				</tr>
			</thead>
			<tbody>  
                <tr>
                    <td colspan="4" class="nodata">내역이 존재하지 않습니다.</td>
                </tr>	
			</tbody>
		</table>
	</div>
	<div class="paging">
	</div>
</div>
</div>
</div>
	<jsp:include page="../main/main/footer.jsp"></jsp:include>
</body>
</html>