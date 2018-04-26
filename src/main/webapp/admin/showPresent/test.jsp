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
	    	var today = new Date();
	    	var yy = today.getFullYear();
	    	var mm = today.getMonth();
	    	var dd = today.getDate();
	    	for(var i = 0; i < 30; i++){
	    		var date = new Date(yy, mm, dd+i);
		    	var yy2 = date.getFullYear();
		    	var mm2 = date.getMonth();
		    	var dd2 = date.getDate();
	    		alert(yy2 +"/"+ mm2 +"/"+ dd2);
	    		
	    	}
	    	
	    	
	    });
	</script>
    <title>Datepicker</title>
</head>
<body>
Date:<input type="text" class="DatePicker">
<div name="test"></div>
</body>
</html>


