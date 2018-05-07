<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-detail" id="mycgv_contents">
	    
<form name="aspnetForm" method="post" action="./detail-view.aspx?idx=1039184&amp;page=1&amp;searchtext=" id="aspnetForm" novalidate="novalidate">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTE0MTgyNzY4MGRklfwQJp5TNVuxwfSEGL8aUR1Mj7I=">
</div>

<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="21623BD8">
</div>


<input type="hidden" id="isTemp" name="isTemp" value="N">
    <div class="tit-mycgv">
	    <h3>나의 문의내역</h3>
	</div>
	<div class="tit-mycgv">
	    <h4>1:1 문의</h4>
	</div>
    <div class="tbl-viw">
        <table summary="">
            <caption></caption>
            <thead>
                <tr>
                    <th scope="row" colspan="2">
                        <p>
                            <span class="round red on"><i>답변완료</i></span>
                            <strong><em>칭찬  cgv&nbsp;최고</em></strong>
                        </p>

                        <p>등록일 <em>2018.04.17</em></p>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="2" class="info">
                        <dl class="qna">
                            <dt>문의CGV</dt>
                            <dd><strong>CGV본사</strong></dd>
                            <dt>연락처</dt>
                            <dd><strong class="aj_mobile">010-9489-1081</strong></dd>
                            <dt>첨부파일</dt>
	            		    <dd>
                            
                                <a href="http://img.cgv.co.kr/Support/Qna/2018/0417/2018041716031731.jpg" target="_blank">
                                    <strong>2018041716031731.jpg</strong>
                                </a>
                            
                            </dd>
                            <dt>이메일</dt>
                            <dd><strong class="aj_email">jinhwanea@naver.com</strong></dd>
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="txt-conts">
                            언제나&nbsp;감사합니다
                        </div>
                           
                                <div class="reply"> 
                                    <strong>1차 답변 </strong>
                                    <span><strong>답변일</strong><em>2018.04.17</em></span></div>
                                <div class="box-polaroid">
                                    <div class="box-inner">
                                        안녕하십니까, 고객님.<br>
<br>CGV 고객센터 조동진입니다.<br>
<br><br>
<br>고객님의 문의사항에 답변 드립니다.<br>
<br>소중한 시간 내어 글 남겨주심에 감사말씀 드립니다.<br>
<br>칭찬의 말씀을 남겨주시니 더욱 더 책임감 있게 업무를 해야겠다는 사명감이 듭니다.<br>
<br><br>
<br>늘 CGV를 이용해 주심에 다시한번 감사말씀 드리오며,<br>
<br>앞으로도 쾌적한 영화관람이 될 수 있도록 항상 노력하는 CGV가 되겠습니다.<br>
<br>감사합니다.<br>
<br>CGV 고객센터 조동진 올림
                                        
                                    </div>
                                </div>
                            

                    </td>
                </tr>
                
                    <tr>
                        <th scope="row"><strong>만족도</strong></th>
                       
                        <td id="tdPointArea">
                            
                                    <input type="radio" id="rdoPoint_317" name="rdoPoint" value="317" checked="checked" disabled="disabled"> 
                                    <label for="rdoPoint_317">매우만족</label>
                                
                                    <input type="radio" id="rdoPoint_318" name="rdoPoint" value="318" disabled="disabled"> 
                                    <label for="rdoPoint_318">만족</label>
                                
                                    <input type="radio" id="rdoPoint_319" name="rdoPoint" value="319" disabled="disabled"> 
                                    <label for="rdoPoint_319">보통</label>
                                
                                    <input type="radio" id="rdoPoint_320" name="rdoPoint" value="320" disabled="disabled"> 
                                    <label for="rdoPoint_320">불만족</label>
                                
                                    <input type="radio" id="rdoPoint_321" name="rdoPoint" value="321" disabled="disabled"> 
                                    <label for="rdoPoint_321">매우불만족</label>
                                
                            
                        </td>
                    </tr>
                
            </tbody>
        </table>
    </div>

    <div class="set-btn">
        <p><button type="button" class="round gray" id="btnDelete"><span>삭제</span></button></p>
        <p><a class="round inred" id="update" href="/support/qna/default.aspx?Idx=1039184" style="display: none;"><span>수정</span></a></p>
        <p><a class="round inblack" href="./list.aspx?page=1&amp;searchtext="><span>목록</span></a></p>

    </div>
</form>
<script type="text/javascript">
//<![CDATA[

    (function ($) {
        $(function () {

            var chk = $("#isTemp").val();
            if (chk == "N") {
                $("#update").hide();
            }

            if (chk == "Y") {
                $("#update").show();
            }

            $("#btnCheckReplyPoint").on('click', function () {
                var objPointCode = $("input[name=rdoPoint]:checked");

                if (objPointCode.length < 1) {
                    return alert("답변의 만족도를 선택해 주세요");
                }

                $.ajax({
                    type: "POST",
                    url: "detail-view.aspx/CheckPoint",
                    data: '{ idx: 1039184, pointcode: ' + parseInt(objPointCode.val()) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        alert("고객님의 만족도 평가가 완료되었습니다.");
                        $('input:radio[name=rdoPoint]').attr('disabled', 'true');
                        $('#btnCheckReplyPoint').remove();
                    },
                    error: function (request, error) {
                        alert("code:" + request.status + "\n" + "error:" + error);
                    }
                });
            });

            $('#btnDelete').on('click', function () {
                if (!confirm("선택하신 문의건을 삭제 하시겠습니까?")) {
                    return;
                }

                $('form').submit();
            });


            //$(".aj_mobile").html("ddddd");
            /*************************************************
            * 개인정보로 인해 ajax로 변경
            **************************************************/
            $(function () {
                var params = "{}";
                var currentRequest = $.ajax({
                    type: "GET",
                    url: "https://www.cgv.co.kr/user/membership/jsonpUser.aspx",
                    data: params,
                    contentType: "application/json; charset=utf-8",
                    dataType: "jsonp",
                    jsonp: 'callback',
                    async: false,
                    beforeSend: function () {
                        if (currentRequest != null) {
                            currentRequest.abort();
                        }
                    },
                    success: function (data) {

                        if (data.d.Result == "0000") {
                            $(".aj_mobile").append(data.d.mobile);
                            $(".aj_email").append(data.d.email);
                        }

                        return false;
                    },
                    error: function (xhr, status, err) {
                        //alert("잠시후 이용해주세요");
                        //location.href = location.href;
                        return false;
                    }
                });
            });

        });
    })(jQuery);

//]]>
</script>

	</div>
</body>
</html>