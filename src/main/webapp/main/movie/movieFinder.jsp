<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/movie/movieFinder.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="moviefind">
		<div id="pagenevi">
			<span class="glyphicon glyphicon-home"></span>
			<a href = "#">홈</a> > 영화 > <b>무비파인더</b>
		</div>
		<div id="moviefinder">
			<table>
				<tr>
					<th colspan="2"><div id = "finder-title">영화가 궁금하다면 영화를 검색해봐라</div></th>
				</tr>
				<tr>
					<th>영화검색</th>
					<td>
						<select name="movie_research" id = "movie_research">
							<option value="all">전체
							<option value="movie_name">영화제목
							<option value="movie_actor">주연배우
							<option value="movie_director">감독
						</select>
						<input type = "text" placeholder="검색할 키워드를 입력해주세요." id = "movie_keyword" >
					</td>
				</tr>
				<tr>
					<th>장르</th>
					<td>
						<input type = "checkbox" name = "movie_type" value = "전체"> 전체&emsp;
						<input type = "checkbox" name = "movie_type" > SF&emsp;
						<input type = "checkbox" name = "movie_type" > 스릴러&emsp;
						<input type = "checkbox" name = "movie_type" > 호러&emsp;
						<input type = "checkbox" name = "movie_type" > 액션&emsp;
						<input type = "checkbox" name = "movie_type" > 범죄&emsp;
						<input type = "checkbox" name = "movie_type" > 느와르&emsp;
						<input type = "checkbox" name = "movie_type" > 드라마&emsp;<br>
						<input type = "checkbox" name = "movie_type" > 에로&emsp;
						<input type = "checkbox" name = "movie_type" > 멜로&emsp;
						<input type = "checkbox" name = "movie_type" > 코미디&emsp;
						<input type = "checkbox" name = "movie_type" > 가족&emsp;
						<input type = "checkbox" name = "movie_type" > 판타지&emsp;
						<input type = "checkbox" name = "movie_type" > 전쟁&emsp;
						<input type = "checkbox" name = "movie_type" > 스포츠&emsp;
						<input type = "checkbox" name = "movie_type" > 다큐&emsp;
					</td>
				</tr>
				<tr>
					<th>제작국가</th>
					<td>
						<input type = "checkbox" name = "make_nation" > 전체&emsp;
						<input type = "checkbox" name = "make_nation" > 한국&emsp;
						<input type = "checkbox" name = "make_nation" > 미국&emsp;
						<input type = "checkbox" name = "make_nation" > 일본&emsp;
						<input type = "checkbox" name = "make_nation" > 중국&emsp;
						<input type = "checkbox" name = "make_nation" > 홍콩&emsp;
						<input type = "checkbox" name = "make_nation" > 프랑스&emsp;
						<input type = "checkbox" name = "make_nation" > 영국&emsp;
						<input type = "checkbox" name = "make_nation" > 독일&emsp;
						<input type = "checkbox" name = "make_nation" > 인도&emsp;
						<input type = "checkbox" name = "make_nation" > 기타&emsp;
					</td>
				</tr>
				<tr>
					<th>관람등급</th>
					<td>
						<input type = "checkbox" name = "movie_show_grade"> 전체이용가&emsp;
						<input type = "checkbox" name = "movie_show_grade"> 7세 시청가&emsp;
						<input type = "checkbox" name = "movie_show_grade"> 12세 이용가&emsp;
						<input type = "checkbox" name = "movie_show_grade"> 15세 이용가&emsp;
						<input type = "checkbox" name = "movie_show_grade"> 청소년 이용불가&emsp;
						<input type = "checkbox" name = "movie_show_grade"> 제한 상영가&emsp;
					</td>
				</tr>
				<tr>
					<th colspan="2" >
						<div id = "finder-submit">
						 <a href="#" class="btn btn-info btn-lg">
    				      <span class="glyphicon glyphicon-search"></span> 영화검색
       					 </a>
						</div>
					</th>
				</tr>
			</table>
		</div>

		<div id = "findresult">
			<div id = "result-title">
			<hr class = "hr-title">
			아래의 선택조건에 해당하는 영화가 <font>총 6,371건</font> 검색되었습니다.
			</div>
			<div id = "findinfoform">
				<div id = "findinfo">
				<table>
					<tr>
						<td>
							<ul id = "title">
								<li>장르 : </li>
								<li>제작국가 : </li>
								<li>관람등급 : </li>
							</ul>
						</td>
						<td>
							<ul id = "content">
								<li>공포</li>
								<li>미국 </li>
								<li>청소년 관람불가 </li>
							</ul>
						</td>
					</tr>						
				</table>
				
				</div>
			</div>
			<div id = "findcontentform">
				<div id = "findcontent">
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a>
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					<div id = "findentity">
						<div id = "entity-poster">
							<img src = "../../image/storage/moviephoto/img_1.jpg">
						</div>
						<div id = "entity-title">
							리브 어게인
						</div>
						<div id = "entity-reserve">
							예매율&emsp; 0.0% 
						</div>
						<div id = "entity-opendate">
							2018.5.15 개봉 <font>D-3</font>
						</div>
						<div id = "entity-like">
<!-- 							<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart"></span></a> -->
         					<a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-heart-empty"></span></a><b>20,201명 </b>
							<a href="#" id = "reserve-btn" class="btn btn-info btn-lg">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
					
				</div>
			</div>
			<div id = "findpagingform">
				<div id ="findpaging">
					<a href="#">[이전]</a>
					<a href="#">[1]</a>
					<a href="#">[2]</a>
					<a href="#">[3]</a>
					<a href="#">[다음]</a>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>