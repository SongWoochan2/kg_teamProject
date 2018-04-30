<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/movie/movieReview.css" />
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js?v=1"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#review-insert").fadeOut(0);
		$("#reviewInsert").click(function(){
			// 배경 레이어를 화면에 표시한다.
			$("#review-insert").toggle(300);
		});
		
		$("#1").click(function(){
			var n = 1; score(n);
		});

		$("#2").click(function(){
			var n = 2; score(n);
		});

		$("#3").click(function(){
			var n = 3; score(n);
		});

		$("#4").click(function(){
			var n = 4; score(n);
		});

		$("#5").click(function(){
			var n = 5; score(n);
		});
		
		var score = function(n){
			if($("#"+n).val() == '★'){
				for(var i = n; i<=5; i++){$("#"+i).val('☆');}
			}else if($("#"+n).val() == '☆'){
				for(var i = 1; i<=n; i++){$("#"+i).val('★');}}
		};
		
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id = "movieReview">
		<div id = "review-title">
			평점
		</div>
		<div id="review-all">
			<div id="review-movie">
				<button type="button" class="btn btn-default btn-sm"  id = "leftbtn">
         				<span class="glyphicon glyphicon-triangle-left"></span>
       			</button>
				<div id = "entity">
					<div id = "entity-poster">
						<img src = "../../image/storage/moviephoto/memento1.jpg">
					</div>
					<div id = "entity-name">
						<a href = "#">메맨토</a>
					</div>
					<div id = "entity-reserve">
						<font>예매율</font> 0.0%
					</div>
					<div id = "entity-opendate">
						2016.5.23 개봉
					</div>
					<div id = "entity-request">
						<button>예매</button>
					</div>
				</div>
				<div id = "entity">
					<div id = "entity-poster">
						<img src = "../../image/storage/moviephoto/memento1.jpg">
					</div>
					<div id = "entity-name">
						<a href = "#">메맨토</a>
					</div>
					<div id = "entity-reserve">
						<font>예매율</font> 0.0%
					</div>
					<div id = "entity-opendate">
						2016.5.23 개봉
					</div>
					<div id = "entity-request">
						<button>예매</button>
					</div>
				</div>
				<div id = "entity">
					<div id = "entity-poster">
						<img src = "../../image/storage/moviephoto/memento1.jpg">
					</div>
					<div id = "entity-name">
						<a href = "#">메맨토</a>
					</div>
					<div id = "entity-reserve">
						<font>예매율</font> 0.0%
					</div>
					<div id = "entity-opendate">
						2016.5.23 개봉
					</div>
					<div id = "entity-request">
						<button>예매</button>
					</div>
				</div>
				<div id = "entity">
					<div id = "entity-poster">
						<img src = "../../image/storage/moviephoto/memento1.jpg">
					</div>
					<div id = "entity-name">
						<a href = "#">메맨토</a>
					</div>
					<div id = "entity-reserve">
						<font>예매율</font> 0.0%
					</div>
					<div id = "entity-opendate">
						2016.5.23 개봉
					</div>
					<div id = "entity-request">
						<button>예매</button>
					</div>
				</div>
				<button type="button" class="btn btn-default btn-sm"  id = "rightbtn">
          			<span class="glyphicon glyphicon-triangle-right"></span>
        		</button>
			</div>
			<div id="review">
				<div id = "left">실관람객평점 ▶</div><div id="right">영화를 보시고 평점을 남겨주세요. <a class="btn btn-info btn-lg" id="reviewInsert">평점 작성</a></div>
				<div id="review-insert">
					<div id="review-score">
						<input type = "button" class="btn btn-info btn-lg" id = "1" value = "★">
						<input type = "button" class="btn btn-info btn-lg" id = "2" value = "★">
						<input type = "button" class="btn btn-info btn-lg" id = "3" value = "★">
						<input type = "button" class="btn btn-info btn-lg" id = "4" value = "★">
						<input type = "button" class="btn btn-info btn-lg" id = "5" value = "★">
						&emsp;&nbsp;<button type = "submit" class="btn btn-info btn-lg">리뷰 등록</button>
					</div>
					<div id="review-content">
						<label for="comment">Comment:</label>
  						<textarea class="form-control" rows="5" id="comment" style="resize: none;" maxlength="500"></textarea>
					</div>
				</div>
				<div id="review-content">
					<div id = "score">
						★ ★ ★ ★ ☆
					</div>
					<div id = "id">
						으아아아아아
					</div>
					<div id = "content">
						핵 노잼이였습니다.
					</div>
					<div id = "date">
						2018.5.12
					</div>
					<div id = "like">
						<a href="#">
      					   <span class="glyphicon glyphicon-thumbs-up"></span>
        				</a> 125
					</div>
				</div>
				<div id="review-content">
					<div id = "score">
						★ ★ ★ ★ ☆
					</div>
					<div id = "id">
						으아아아아아
					</div>
					<div id = "content">
						핵 노잼이였습니다.
					</div>
					<div id = "date">
						2018.5.12
					</div>
					<div id = "like">
						<a href="#">
      					   <span class="glyphicon glyphicon-thumbs-up"></span>
        				</a> 125
					</div>
				</div><div id="review-content">
					<div id = "score">
						★ ★ ★ ★ ☆
					</div>
					<div id = "id">
						으아아아아아
					</div>
					<div id = "content">
						핵 노잼이였습니다.
					</div>
					<div id = "date">
						2018.5.12
					</div>
					<div id = "like">
						<a href="#">
      					   <span class="glyphicon glyphicon-thumbs-up"></span>
        				</a> 125
					</div>
				</div><div id="review-content">
					<div id = "score">
						★ ★ ★ ★ ☆
					</div>
					<div id = "id">
						으아아아아아
					</div>
					<div id = "content">
						핵 노잼이였습니다.
					</div>
					<div id = "date">
						2018.5.12
					</div>
					<div id = "like">
						<a href="#">
      					   <span class="glyphicon glyphicon-thumbs-up"></span>
        				</a> 125
					</div>
				</div><div id="review-content">
					<div id = "score">
						★ ★ ★ ★ ☆
					</div>
					<div id = "id">
						으아아아아아
					</div>
					<div id = "content">
						핵 노잼이였습니다.
					</div>
					<div id = "date">
						2018.5.12
					</div>
					<div id = "like">
						<a href="#">
      					   <span class="glyphicon glyphicon-thumbs-up"></span>
        				</a> 125
					</div>
				</div><div id="review-content">
					<div id = "score">
						★ ★ ★ ★ ☆
					</div>
					<div id = "id">
						으아아아아아
					</div>
					<div id = "content">
						핵 노잼이였습니다.
					</div>
					<div id = "date">
						2018.5.12
					</div>
					<div id = "like">
						<a href="#">
      					   <span class="glyphicon glyphicon-thumbs-up"></span>
        				</a> 125
					</div>
				</div>
			</div>
			<div id="review-paging">
				<a href="#">[이전]</a> <a href="#">[1]</a> <a href="#">[다음]</a>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>