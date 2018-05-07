<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/movie/movieFinder.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<script type="text/javascript">
	$(function(){
		$("#type_check").prop("checked",true);
		$("#nation_check").prop("checked",true);
		$(".movie_type").prop("checked",true);
		$(".make_nation").prop("checked",true);
		$("#grade_check").prop("checked",true);
		$(".movie_show_grade").prop("checked",true);
		
// 		 $("input[name=movie_type]").each(function(idx){   
	         
// 		        // 해당 체크박스의 Value 가져오기
// 		        var value = $(this).val();
		 
// 		        var eqValue = $("input[name=movie_type]:eq(" + idx + ")").val() ;
		         
// 		        console.log(value + ":" + eqValue) ;
		         
// 		});

		var movie_search = $("#movie_search").val();
		var movie_keyword = $("#movie_keyword").val();
// 		var movie_type = $(".movie_type").val();
// 		var make_nation = $(".make_nation").val();
// 		var movie_show_grade = $(".movie_show_grade").val();
		var pg = ${moviePage.pg};
		alert(pg);
		
		$("#type_check").change(function(){
			var is_check = $(this).is(":checked");	
			$(".movie_type").prop("checked",is_check);
		});
		$(".movie_type").change(function(){
			var is_check = $(this).is(":checked");	
			$("#type_check").prop("checked",false);
		});
		$("#nation_check").change(function(){
			var is_check = $(this).is(":checked");	
			$(".make_nation").prop("checked",is_check);
		});
		$(".make_nation").change(function(){
			var is_check = $(this).is(":checked");	
			$("#nation_check").prop("checked",false);
		});
		$("#grade_check").change(function(){
			var is_check = $(this).is(":checked");	
			$(".movie_show_grade").prop("checked",is_check);
		});
		$(".movie_show_grade").change(function(){
			var is_check = $(this).is(":checked");	
			$("#grade_check").prop("checked",false);
		});
		
// 		$("#previousbtn").click(function(){
			
// 		});
		
		$("#moviebtn").click(function(){
			alert($("#moviebtn").val());
		});
		
// 		$("#nextbtn").click(function(){
// 			$.ajax({
// 				url : "/MyCGV/main/movie/movieFinder.do", // 나중에 사이트 url로 바뀜
// 				type : "post", // 최종적으로 서버에 요청함
// 				dataType : "json",
// 				timeout : 30000, // 30초 (단위는 ms)
// 				data : {
// 					"movie_search" : movie_search,
// 					"movie_keyword" : movie_keyword,
// 					"movie_type" : movie_type,
// 					"make_nation" : make_nation,
// 					"movie_show_grade" : movie_show_grade,
// 					"pg" : 
					
// 				},
// 				cache : false,
// 				// 파일 읽기에 성공한 경우
// 				success : function(json){
					
					
// 				},
// 				error : function(xhr, textStatus, errorThrown){
// 					alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
// 				}
// 	 		});
			
// 		});
		
	});
</script>

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="moviefind">
		<div id="pagenevi">
			<span class="glyphicon glyphicon-home"></span>
			<a href = "../main/movieMain.do">홈</a> > 영화 > <b>무비파인더</b>
		</div>
		<div id="moviefinder">
			<form action = "movieFinder.do?pg=1" method="post" name ="movieFinder">
			<table>
				<tr>
					<th colspan="2"><div id = "finder-title">영화가 궁금하다면 영화를 검색해봐라</div>
					</th>
				</tr>
				<tr>
					<th>영화검색</th>
					<td>
						<select name="movie_search" id = "movie_search">
							<option value="all">전체
							<option value="movie_name">영화제목
							<option value="movie_actor">주연배우
							<option value="movie_director">감독
						</select>
						<input type = "text" placeholder="검색할 키워드를 입력해주세요." name = "movie_keyword" id="movie_keyword" >
					</td>
				</tr>
				<tr>
					<th>장르</th>
					<td>
						<input type = "checkbox" value = "전체" id = "type_check"> 전체&emsp;
						<input type = "checkbox" name = "movie_type" value = "SF" class = "movie_type"> SF&emsp;
						<input type = "checkbox" name = "movie_type" value = "스릴러" class = "movie_type"> 스릴러&emsp;
						<input type = "checkbox" name = "movie_type" value = "호러" class = "movie_type"> 호러&emsp;
						<input type = "checkbox" name = "movie_type" value = "액션" class = "movie_type"> 액션&emsp;
						<input type = "checkbox" name = "movie_type" value = "범죄" class = "movie_type"> 범죄&emsp;
						<input type = "checkbox" name = "movie_type" value = "느와르" class = "movie_type"> 느와르&emsp;
						<input type = "checkbox" name = "movie_type" value = "드라마" class = "movie_type"> 드라마&emsp;<br>
						<input type = "checkbox" name = "movie_type" value = "에로" class = "movie_type"> 에로&emsp;
						<input type = "checkbox" name = "movie_type" value = "멜로" class = "movie_type"> 멜로&emsp;
						<input type = "checkbox" name = "movie_type" value = "코미디" class = "movie_type"> 코미디&emsp;
						<input type = "checkbox" name = "movie_type" value = "가족" class = "movie_type"> 가족&emsp;
						<input type = "checkbox" name = "movie_type" value = "판타지" class = "movie_type"> 판타지&emsp;
						<input type = "checkbox" name = "movie_type" value = "전쟁" class = "movie_type"> 전쟁&emsp;
						<input type = "checkbox" name = "movie_type" value = "스포츠" class = "movie_type"> 스포츠&emsp;
						<input type = "checkbox" name = "movie_type" value = "다큐" class = "movie_type"> 다큐&emsp;
					</td>
				</tr>
				<tr>
					<th>제작국가</th>
					<td>
						<input type = "checkbox" value = "전체" id = "nation_check"> 전체&emsp;
						<input type = "checkbox" name = "make_nation" value = "한국" class = "make_nation"> 한국&emsp;
						<input type = "checkbox" name = "make_nation" value = "미국" class = "make_nation"> 미국&emsp;
						<input type = "checkbox" name = "make_nation" value = "일본" class = "make_nation"> 일본&emsp;
						<input type = "checkbox" name = "make_nation" value = "중국" class = "make_nation"> 중국&emsp;
						<input type = "checkbox" name = "make_nation" value = "홍콩" class = "make_nation"> 홍콩&emsp;
						<input type = "checkbox" name = "make_nation" value = "프랑스" class = "make_nation"> 프랑스&emsp;
						<input type = "checkbox" name = "make_nation" value = "영국" class = "make_nation"> 영국&emsp;
						<input type = "checkbox" name = "make_nation" value = "독일" class = "make_nation"> 독일&emsp;
						<input type = "checkbox" name = "make_nation" value = "인도" class = "make_nation"> 인도&emsp;
						<input type = "checkbox" name = "make_nation" value = "기타" class = "make_nation"> 기타&emsp;
					</td>
				</tr>
				<tr>
					<th>관람등급</th>
					<td>
						<input type = "checkbox" id = "grade_check" value="전체"> 전체&emsp;
						<input type = "checkbox" name = "movie_show_grade" class = "movie_show_grade" value="전체이용가"> 전체이용가&emsp;
						<input type = "checkbox" name = "movie_show_grade" class = "movie_show_grade" value="7세 시청가"> 7세 시청가&emsp;
						<input type = "checkbox" name = "movie_show_grade" class = "movie_show_grade" value="12세 이용가"> 12세 이용가&emsp;
						<input type = "checkbox" name = "movie_show_grade" class = "movie_show_grade" value="15세 이용가"> 15세 이용가&emsp;
						<input type = "checkbox" name = "movie_show_grade" class = "movie_show_grade" value="청소년 이용불가"> 청소년 이용불가&emsp;
						<input type = "checkbox" name = "movie_show_grade" class = "movie_show_grade" value="제한 상영가"> 제한 상영가&emsp;
					</td>
				</tr>
				<tr>
					<th colspan="2" >
						<div id = "finder-submit">
							<button type = "submit" class="btn btn-info btn-lg">
    				      		<span class="glyphicon glyphicon-search"></span> 영화검색
							</button>
						</div>
					</th>
				</tr>
			</table>
			</form>
		</div>

		<div id = "findresult">
			<div id = "result-title">
			<hr class = "hr-title">
			아래의 선택조건에 해당하는 영화가 <font>총 ${moviePage.totalA }건</font> 검색되었습니다.
			</div>
			<div id = "findinfoform">
				<div id = "findinfo">
				<table>
					<tr>
						<td>
							<ul id = "title">
								<li>키워드 : </li>
								<li>장르 : </li>
								<li>제작국가 : </li>
								<li>관람등급 : </li>
							</ul>
						</td>
						<td>
							<ul id = "content">
								<li>
									<c:if test="${requestScope.movie_keyword == null}">
										전체
									</c:if>
									<c:if test="${requestScope.movie_keyword != null}">
										<c:forEach var = "movie_type" items="${requestScope.movie_keyword }">
											${movie_keyword }
										</c:forEach>
									</c:if>
								</li>
								<li>
									<c:if test="${requestScope.movie_type == null}">
										전체
									</c:if>
									<c:if test="${requestScope.movie_type != null}">
										<c:forEach var = "movie_type" items="${requestScope.movie_type }">
											${movie_type }
										</c:forEach>
									</c:if>
								</li>
								<li>
									<c:if test="${requestScope.make_nation == null}">
										전체
									</c:if>
									<c:if test="${requestScope.make_nation != null}">
										<c:forEach var = "make_nation" items="${requestScope.make_nation }">
											${make_nation }
										</c:forEach>
									</c:if>
								</li>
								<li>
									<c:if test="${requestScope.movie_show_grade == null}">
										전체
									</c:if>
									<c:if test="${requestScope.movie_show_grade != null}">
										<c:forEach var = "movie_show_grade" items="${requestScope.movie_show_grade }">
											${movie_show_grade }
										</c:forEach>
									</c:if>
								</li>
							</ul>
						</td>
					</tr>						
				</table>
				
				</div>
			</div>
			<div id = "findcontentform">
				<div id = "findcontent">
				<c:forEach var ="find_list" items="${requestScope.find_list }">
					<div id = "findentity">
						<div id = "entity-poster">
						<c:forEach var ="poster_map" items="${requestScope.poster_map }" >
							<c:if test="${poster_map.key == find_list.movie_code }">
								<img src = "../../image/storage/moviephoto/${poster_map.value }">
							</c:if>
						</c:forEach>
						</div>
						<div id = "entity-title">
							<a href = "movieDetailView.do?movie_code=${find_list.movie_code }&photo_pg=1&trailer_pg=1">
							${find_list.movie_name }
							( 
							<c:if test="${find_list.movie_evaluat_num == 0}">
								평점 없음
							</c:if>
							<c:if test="${find_list.movie_evaluat_num != 0}">
								평점 : ${fn:substring( ''+(find_list.acc_evaluat_score / find_list.movie_evaluat_num),0,4) } 점
							</c:if>)
							</a>
						</div>
						<div id = "entity-reserverate">
							예매율&emsp; 
							<c:forEach var="reserve_rate_map" items="${requestScope.reserve_rate_map }">
								<c:if test="${find_list.movie_code == reserve_rate_map.key }">
								${fn:substring( ''+(reserve_rate_map.value),0,4) } %
								</c:if>
							</c:forEach>
						</div>
						<div id = "entity-opendate">
							${find_list.movie_open_date }
						</div>
						<div id = "entity-reserve">
							<a href="../../reserve.do?movie_code=${find_list.movie_code }" id = "reserve-btn" class="btn btn-info btn-lg" href = "movieDetailView.do?movie_code=${find_list.movie_code }">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<div id = "findpagingform">
				<div id ="findpaging">
					<c:if test="${moviePage.startPage>1 }">
						[<a id="paging" id="previousbtn">이전</a>]
					</c:if> 
					<c:forEach var="i" begin="${moviePage.startPage}" end="${moviePage.endPage}" step="1">
					<c:if test="${moviePage.startPage==i }">
						[<a id="currentPaging" id="movebtn">${i }</a>]
					</c:if>
					<c:if test="${moviePage.startPage!=i }">
						[<a id="paging" id="movebtn">${i }</a>]
					</c:if>
					<!-- el표현식에는 자바코드가 들어갈수없음 -->
					</c:forEach>
					<c:if test="${moviePage.endPage<moviePage.totalPage}">
						[<a id="paging" id="nextbtn">다음</a>]
					</c:if> <!-- el표현식에는 자바코드가 들어갈수없음 -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>