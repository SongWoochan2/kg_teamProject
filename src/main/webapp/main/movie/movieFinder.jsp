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
		
		
		
		function movie_type_f(){
			typecnt = 0;
			$(".movie_type").each(function(){
				if($(this).is(":checked")){
					idxVal = $(this).attr("value");
					typecnt++;
					movie_type.push(idxVal);
				}
			});
		}
		function make_nation_f(){
			typecnt = 0;
			$(".make_nation").each(function(){
				if($(this).is(":checked")){
					idxVal = $(this).attr("value");
					typecnt++;
					make_nation.push(idxVal);
				}
			});
		}
		function movie_show_grade_f(){
			typecnt = 0;
			$(".movie_show_grade").each(function(){
				if($(this).is(":checked")){
					idxVal = $(this).attr("value");
					typecnt++;
					movie_show_grade.push(idxVal);
				}
			});
		}
		
		var movie_search = $("#movie_search").val();
		var movie_keyword = $("#movie_keyword").val();
		var idxVal = "";
		var typecnt = 0;
		var movie_show_grade = [];
		var movie_type = [];
		var make_nation = [];
		var pg = ${moviePage.pg};
		movie_type_f();
		make_nation_f();
		movie_show_grade_f();
		
		
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
		
		$(".previousbtn").click(function(){
			var params = $('#movieFinder').serialize();
			$.ajax({
				url : "/MyCGV/main/movie/movieFinder_result.do", // 나중에 사이트 url로 바뀜
				type : "post", // 최종적으로 서버에 요청함
				dataType : "html",
				timeout : 30000, // 30초 (단위는 ms)
				data : params,
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(html){
					$("#find_result_wrap").empty().append(html);
				
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
				}
	 		});
		});
		$(document).on("click", ".movebtn", function(){
			
			var params = $('#movieFinder').serialize();
			$.ajax({
				url : "/MyCGV/main/movie/movieFinder_result.do", // 나중에 사이트 url로 바뀜
				type : "post", // 최종적으로 서버에 요청함
				dataType : "html",
				timeout : 30000, // 30초 (단위는 ms)
				data : params,
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(html){
					$("#find_result_wrap").empty().append(html);
				
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
				}
	 		});
		});
		
		$(".nextbtn").click(function(){
			alert(movie_show_grade);
			var params = $('#movieFinder').serialize();
			$.ajax({
				url : "/MyCGV/main/movie/movieFinder_result.do", // 나중에 사이트 url로 바뀜
				type : "post", // 최종적으로 서버에 요청함
				dataType : "html",
				timeout : 30000, // 30초 (단위는 ms)
				data : params,
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(html){
					$("#find_result_wrap").empty().append(html);
				
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
				}
	 		});
			
		});
		
		
		
		$("#movieFinder").submit(function(){
			var params = $('#movieFinder').serialize();

			$.ajax({
				url : "/MyCGV/main/movie/movieFinder_result.do", // 나중에 사이트 url로 바뀜
				type : "post", // 최종적으로 서버에 요청함
				dataType : "html",
				timeout : 30000, // 30초 (단위는 ms)
				data : params,
				cache : false,
				// 파일 읽기에 성공한 경우
				success : function(html){
					$("#find_result_wrap").empty().append(html);
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus +"(HTTP-)" + xhr.status + " / " + errorThrown);
				}
	 		});
			return false;
		});
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
			<form action = "movieFinder.do?pg=1" method="post" name ="movieFinder" id="movieFinder">
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
		<div id="find_result_wrap">
			<jsp:include page="../movie/Finder_nevi.jsp"/>
		</div>

		</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>