<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script>
	    $(function(){
	        $(".DatePicker").datepicker({});
	    });
	</script>
    <title>Datepicker</title>
</head>
<body>
Date:<input type="text" class="DatePicker">
</body>
</html>




	<script type="text/x-jquery-tmpl" id="itemTemplate">
			<div class="movie_box">
				<label for="movie_code">
				<input type="radio" name="movie_code" value="\${movie_code}">
				<div class="movie_name"><h3>\${movie_name}</h3></div><br>
				<div class="movie_director">감독 : \${movie_director}</div><br>
				<div class="movie_recycle_time">상영시간 : \${movie_recycle_time}분</div><br>
				<div class="movie_open_date">개봉일 : \${movie_open_date}</div><br>
				</label>
			</div>
	</script>