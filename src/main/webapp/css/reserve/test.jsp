<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

input[type="radio"] {
	border:1px solid red;
    display:none;
}

input[type="radio"] + label {
    color:#f2f2f2;
    font-family:Arial, sans-serif;
}

input[type="radio"] + label span {
    display:inline-block;
    width:109px;
    height:190px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -38px top no-repeat;
    cursor:pointer;
}

input[type="radio"]:checked + label span {
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -57px top no-repeat;
}

/* ### ### ### 08 */
</style>
</head>
<body>
 <input type="radio" id="r1" name="rr" />
    <label for="r1"><span></span>Radio Button 1</label>
    <p>
    <input type="radio" id="r2" name="rr" />
    <label for="r2"><span></span>Radio Button 2</label>
</body>
</html>