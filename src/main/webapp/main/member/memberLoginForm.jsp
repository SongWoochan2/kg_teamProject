<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<style>

/* ===========================================
   Grouping Class 
============================================ */
#cgvwrap .cgv-ad-wrap .sect-head-ad,
.head, .im-wrap, 
#contents, 
.foot, 
.sect-smuse, 
.sect-cinfo {position:relative; width:980px; margin:0 auto;}
.head h1, .sect-srh, .sect-booking,.sect-phototicket {position:absolute; z-index:1;}
.cf:before,.cf:after                                                    {content: " "; /* 1 */display: table; /* 2 */}
.cf:after                                                               {clear: both;}
.cf                                                                     {*zoom: 1;}

/* Background */
.sect-service .util li > a, 
.sect-service .gnb li > a, 
.lnb > ul > li > a, 
.sect-service a.showtimes, 
.sect-booking > a, 
.sect-phototicket > a, 
.sect-person li > a, 
.line-v, 
.line-dot, 
.sect-smuse li > a, 
.sect-cinfo .share a, 
.sect-cinfo .logo {overflow:hidden; background-image:url(../images/sprite/common_sprite_area_v4_2016.png); background-repeat:no-repeat; text-indent:100%; white-space:nowrap;}
.lnb h2, 
.sect-smuse h2, 
.sect-cinfo h2 {font:0px/0 a; visibility:hidden;}
.sect-service h2, 
.im-wrap .lnb > ul > li > a, 
.sect-srh h2, 
.sect-booking h2, 
.sect-booking > a, 
.sect-phototicket h2, 
.sect-phototicket > a, 
.sect-person h2 {font:0px/0 a;}

/* Display:block */
.sect-service > .util li > a, .sect-service > .gnb li > a, .sect-service a.showtimes, .im-wrap .lnb > ul > li > a, .im-wrap > h2 > a, .im-wrap .ad-partner > a,
.sect-booking > a,.sect-phototicket > a, .sect-person li > a, .sect-common li > a, .ciols-movie li > a, .sect-smuse li > a, .policy li a, .sect-cinfo .share a, .sect-bcrumb li > a,
.sect-ad-external > a, .cols-banner .col-hd > a, .sect-showtimes .info-timetable a, .sect-aside-banner .aside-content-btm > a, .sect-aside-banner > .btn-top > a {display:block;}

#cgvwrap {position:relative; width:100%;min-width:980px}
#cgvwrap #header {background:#fdfcf0 url(../images/common/bg/bg_header.gif) repeat-x 0 0;} /* 20140620 DanielKim Del height:255px; padding-top:80px; background-position:0 80px; */
#cgvwrap #header > .head {position:relative; z-index:100;}
#cgvwrap #header > .head h1 {top:40px; left:0; width:223px; height:85px; padding:18px 0 0 22px; z-index:110;}
#cgvwrap #header > .head h1 > a {display:block;}

/* Header AD Area */
#cgvwrap .cgv-ad-wrap {width:100%; height:80px;} /* 20140620 position:absolute; top:0; left:0; Del */
#cgvwrap .cgv-ad-wrap .sect-head-ad {width:100%; height:80px; margin:0 auto; text-align:center;}
.sect_txt_banner {height:80px;background:#fefcef}
.sect_txt_banner iframe,.sect_txt_banner .inner {display:block;width:980px;height:80px;margin:0 auto}
iframe#TopBanner {margin: 0 auto;display:block}
.adreduce {position:relative;height:80px;margin:0 auto}
.adextend {position: absolute;left: 50%;top: 0px;z-index: 1000;margin: 0 auto;width: 980px;margin-left: -490px;}


/* ===========================================
   Contents Area 
============================================ */
#contaniner {width:100%;}
#contents {clear:both; padding-bottom:50px;}
.linemap-wrap {width:100%; background-color:#f1f0e5; border-bottom:1px solid #cacac0;}
.linemap-wrap .sect-linemap {position:relative; width:980px; height:28px; margin:0 auto;}
.linemap-wrap .sect-linemap > .sect-bcrumb {position:relative;}
.linemap-wrap .sect-linemap > .sect-bcrumb ul > li,
.linemap-wrap .sect-linemap li {float:left;}
.linemap-wrap .sect-linemap > .sect-bcrumb ul > li {margin-left:12px; padding-left:20px; background:url(../images/common/ico/ico_arrow.png) no-repeat 0 50%;}
.linemap-wrap .sect-linemap > .sect-bcrumb ul > li:first-child {margin-left:0; padding-left:0; background:none;}
.linemap-wrap .sect-linemap > .sect-bcrumb ul > li:first-child > a > img {margin-top:5px;}
.linemap-wrap .sect-linemap > .sect-bcrumb ul > li > a,
.linemap-wrap .sect-linemap > .sect-special ul > li > a {display:block; color:#222; font-size:12px; line-height:28px}
.linemap-wrap .sect-linemap > .sect-bcrumb ul > li strong{color:#222; text-decoration:underline; line-height:28px;font-family:'NanumBarunGothicBold';}
.linemap-wrap .sect-linemap > .sect-bcrumb ul > li.last{color:#222; text-decoration:underline; line-height:28px;font-family:'NanumBarunGothicBold';}
*+html .linemap-wrap .sect-linemap > .sect-bcrumb img {margin-top:-4px;}
.linemap-wrap .sect-linemap > .sect-special {overflow:hidden; position:absolute; top:0; right:0;}
.linemap-wrap .sect-linemap > .sect-special ul > li {border-right:1px solid #acaca3;}
.linemap-wrap .sect-linemap > .sect-special ul > li:first-child {border-left:1px solid #acaca3;}
.linemap-wrap .sect-linemap > .sect-special ul > li > a {padding:0 20px; color:#666; font-family:'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif; font-size:11px; text-align:center;}



/* 라운드박스 */
.round , .round > *{ display:inline-block; position:relative;  }
.round {line-height:23px; font-family:'NanumBarunGothicBold'; text-align:center; vertical-align:middle;}
.round > *{ box-sizing:border-box; -moz-box-sizing:border-box; width:100%; /* height:100%; */ padding:0 5px 0;} /* 20140620 Del padding-top:2px !important; */
*+html .round{ white-space:nowrap; }
*+html .round > *{  border:none !important; padding:0; cursor:pointer; }
.round:before, .round:after , .round > *:before, .round > *:after{ content:''; display:block; position:absolute; width:5px; height:5px; background:#fdfcf0 url('../images/sprite/sprite_corner01.png') no-repeat;}
.round.red{ border:2px solid #e71a0f; color:#e71a0f; }
.round.red:before{ left:-2px; top:-2px; background-position:0 0;}
.round.red:after{ left:-2px; bottom:-2px; background-position: 0 -5px;}
.round.red > *:before{ right:-2px; top:-2px; background-position:-5px 0;}
.round.red > *:after{ right:-2px; bottom:-2px; background-position:-5px -5px;}


/* 모서리 둥근 탭메뉴 */
.tab-menu-round{ clear:both; background:url('../images/common/bg/bg_tabmenu_grade.gif') 0 bottom repeat-x;}
.tab-menu-round:after{ content:''; clear:both; display:block;}
*+html .tab-menu-round{ zoom:1;}
.tab-menu-round > li{ float:left; position:relative; line-height:37px; margin-left:1px; background:#898987; color:#fdfcf0; text-align:center; }
.tab-menu-round > li:before, .tab-menu-round > li:after{content:''; position:absolute; top:0; display:block; width:5px; height:5px; background:url('../images/common/bg/bg_tab_corner.png') no-repeat; }
.tab-menu-round > li:before{ left:0; background-position:0 0; }
.tab-menu-round > li:after{ right:0; background-position:-5px 0; }
.tab-menu-round > li:first-child{ margin-left:0;}
.tab-menu-round > li > a{ display:block; color:#ffffff; font-size:13px; font-family:'NanumBarunGothicBold';}
.tab-menu-round > li.on{ background:#e71a0f;}



/* 로그인 */
.wrap-login{ position:relative;padding:30px 30px 0;}
.wrap-login h3{height:auto;margin:0;background:none;line-height:1.2;text-align:left; color:#222222; font-size:15px;}
.wrap-login h3 >  strong{ color:#e71a0f;}
.sect-login{ width:541px; }
.wrap-login .tab-menu-round > li{ width:100px;}
.box-login{padding:70px 0 0 132px; border-bottom:2px solid #898987;padding-top:50px;height: 246px;}
.box-login > p{ font-size:11px;}
.box-login .login{ position:relative;margin-top:15px}
.box-login .login input[type="text"], .box-login .login input[type="password"]{ display:block; width:135px; height:35px; padding:0 5px 0 40px; border:2px solid #b5b5b5; line-height:33px;}
.box-login .login input[type="text"]{ margin-bottom:5px; background:url('../images/sprite/sprite_icon.png') 12px -230px no-repeat;}
.box-login .login input[type="password"]{ background:url('../images/sprite/sprite_icon.png') 12px -261px no-repeat;}

/* 로그인 최종버전 */
.box-login button[type="submit"] > span {display:block;width:258px;height:36px;border:1px solid #f07469; color:#f2f0e5; font-size:15px; font-family:'NanumBarunGothicBold'}
.box-login .login > button[type="submit"] {position:absolute; top:0; left:198px; display:block; width:100px; height:86px; padding:2px; background:#e71a0f; line-height:78px; text-align:center;}
.sect-login > .box-login fieldset {position:relative;}


/*140804 로그인 UI 수정 및 캡챠 시작 */
.box-login .login input[type="text"], .box-login .login input[type="password"] {width:215px}
.box-login button[type="submit"] {width:264px;height:42px;line-height:37px;left:0;position: static;margin-top: 5px;padding:2px; background:#e71a0f; text-align:center;}
.box-login fieldset > .login-option {margin-top: 10px!important;text-align: right;width: 241px;padding-left: 0!important;}
.box-login fieldset > .login-option a {background-position:right 2px!important;}
.sect-login > .box-login fieldset .save-id {position:absolute;top:166px;left:-3px}
.box-login.login_1408 form#form2_capcha {margin-left: 132px;display:none}
.box-login.login_1408 form#form2_capcha .txt_wrap {position: absolute;top:-20px;left: -250px;width: 247px;background:url(http://img.cgv.co.kr/R2014/images/common/ico/login_icon4_03.png) no-repeat 90px 0;text-align: center;line-height: 17px;}
.box-login.login_1408 form#form2_capcha .txt_wrap h3 {color: #e71a0f;text-align: center;font-size:15px;line-height:20px;font-weight: bold;margin:70px 0 10px}

.box-login.login_1408 form#form2_capcha .login {margin-top:-24px}
.box-login.login_1408 form#form2_capcha .captcha {padding: 6px 6px;background: #ebeadf;margin-top: 4px;width: 252px;position:relative}
.box-login.login_1408 form#form2_capcha .captcha .captcha_box a {position:absolute;display:block;font-size:11px;color:#666;left: 195px;padding-left: 14px;}
.box-login.login_1408 form#form2_capcha .captcha .captcha_box a.btn_refresh {background:url(http://img.cgv.co.kr/R2014/images/common/ico/icon_refresh.jpg) no-repeat 0 50%;top: 10px;background-size:11px auto;width: 47px;}
.box-login.login_1408 form#form2_capcha .captcha .captcha_box a.btn_sound {background:url(http://img.cgv.co.kr/R2014/images/common/ico/icon_sound.jpg) no-repeat 0 5px;top: 26px;border-top: 1px solid #898982;padding-top: 4px;
width: 47px;background-size: 11px auto;}
.box-login.login_1408 form#form2_capcha .captcha .input_row label{text-indent: -9999px;line-height: 0;font-size: 0;}
.box-login.login_1408 form#form2_capcha .captcha .captcha_img img {border: 1px solid #bababa;margin-bottom: 2px;}
.box-login.login_1408 form#form2_capcha .captcha input[type='text'] {margin: 0;width: 239px;}
.sect-login > .box-login.login_1408 form#form2_capcha fieldset .save-id {top:203px!important}



/*140804 로그인 UI 수정 및 캡챠 끝 */

/* 로그인 최종배포 후 삭제 */
.box-login fieldset > .login-option label {margin-right:20px; font-size:11px;}
.box-login fieldset > .login-option a {display:inline-block; margin-left:5px; padding-right:8px; background:url('../images/common/bg/bg_arrow03.png') right 1px no-repeat; font-size:11px; text-decoration:underline;}

.box-login.nomember{ height:265px; padding:30px 0 0 0;}
.box-login.nomember .box-btn{ margin-bottom:30px;}
.box-login.nomember .box-btn > strong{ display:inline-block; margin-right:20px; color:#222222; font-size:15px; font-family:'NanumBarunGothic'}
.box-login.nomember .box-operationguide{ padding:20px 0 20px 40px; border:none; border-top:2px solid #e9e9de; background:none;}
.box-login.nomember .box-operationguide dt{ text-align:right;}
.box-login.nomember .box-operationguide dd{ padding:5px 0 0 0; border-left:none; background:url('../images/common/bg/dot_horizontal.gif') 0 0 repeat-x;}
.box-login.nomember .box-operationguide dt + dd{ padding-top:0; background:none;}

.sect-logout{ padding-top:115px; background:url('../images/common/ico/ico_logout.gif') 50% 40px no-repeat; text-align:center;}
.sect-logout h3{ margin-bottom:15px; font-size:25px; font-family:'NanumBarunGothic'; text-align:center;}
.sect-logout .box-btn{ margin-top:35px;}

.sect-loginguide{ margin-top:40px; }
.box-useguide{ height:60px; padding:0 20px;}
.box-useguide > strong:first-child{ padding-left:0; font-size:13px; line-height:62px; color:#222222;}
.box-useguide > span{ display:inline-block; color:#666666; font-size:11px; line-height:62px;width:210px;white-space:nowrap;}
.box-useguide .round{ width:150px;}
.box-useguide strong{ display:inline-block; padding:0 5px 0 18px;}
.box-useguide em{ display:inline-block; padding:0 5px 0 9px; border-left:1px solid #d5d4ca;}
.box-useguide strong + em > .round{ width:130px;}
.box-operationguide{ padding:30px; border:2px solid #d5d4cd; background:#f9f7ec;line-height:1.8;}
.box-operationguide:after{ content:''; display:block; clear:both;}
.box-operationguide > dt{ float:left; color:#222222; font-family:'NanumBarunGothicBold'; }
.box-operationguide > dd{ margin-left:94px; padding-left:25px; border-left:1px solid #c5c4bf;}
.box-passwardguide{ margin-top:15px; padding:30px 25px; background:#edece1;}
.box-passwardguide > dt{ margin-bottom:15px; color:#333333; font-size:17px; font-family:'NanumBarunGothicBold';}
.box-passwardguide > dd{}
.box-passwardguide > dd > i{ display:inline-block; margin-right:5px; font-size:20px; vertical-align:-3px;}
.wrap-result{ text-align:center; color:#333333;}
.wrap-result > .box-result{ display:table-cell; width:700px; height:160px; margin:0 auto; background:#f7f6ea; text-align:center; vertical-align:middle; }
.wrap-result > .box-result > p{ font-size:11px;}
.wrap-result > .box-result > strong{ display:block; margin:15px 0; font-size:15px;}
.wrap-result.notfind{}
.wrap-result.notfind > strong{ font-size:15px; color:#333333;}
.wrap-result.notfind > .box-result{ display:block; height:auto; margin-top:20px; text-align:left;}
.wrap-result.notfind > .box-result li{ margin:5px 0 5px 70px;}
.wrap-result.notfind > .box-result ol{ padding:15px 0;}
.wrap-result.notfind > .box-result ul{ padding:15px 0; background:url('../images/common/bg/dot_horizontal.gif') 0 0 repeat-x;}

.sect-loginad{ position:absolute; right:30px; top:65px; width:350px; height:300px;}
.sect-user{}
.sect-user input[type="text"]{ width:100px;}
.sect-user button[type="submit"]{ display:inline-block;}
.sect-user .tab-menu-round{ margin-bottom:40px;}
.sect-logout .round > *, .sect-user .round > *{ padding:0 20px;}
.sect-logout .box-btn > .round , .sect-user .box-btn > .round{ margin:0 5px;}
.sect-user h3{ margin-bottom:10px;}

.sect-user h3 + p{ margin-bottom:10px;}
.sect-user p{  font-size:11px; color:#222222; line-height:1.8;}
.sect-user p.disc-info{ height:40px; }
.sect-user h4{ height:45px; padding-left:30px; background:#e8e8dd; font-size:15px; color:#222222; line-height:45px;}
.sect-user .wrap-result, .sect-user .box-simple, .sect-user .box-confirm{  padding:40px 30px 30px; border:1px solid #e8e8dd;}
.sect-user table{ border-collapse:collapse; border-top:2px solid #999999; border-bottom:1px solid #aaa9a2; color:#222222; font-size:11px;}
.sect-user table .col01{ width:100px;}
.sect-user table th, .sect-user table td{ padding:15px 0; border-top:1px solid #dfded7; color:#222222; font-size:11px;}
.sect-user table tr:first-child th, .sect-user table tr:first-child td{ border-top:none;}
.sect-user table td > i{ font-size:20px; vertical-align:-4px;}
.sect-user table tr.phone{}
.sect-user table tr.phone .round.red{ margin-left:5px;}
.sect-user table tr.certification{}
.sect-user table tr.certification th, .sect-user table tr.certification td{ border-top:none;  background:url('../images/common/bg/dot_horizontal.gif') 0 0 repeat-x;}
.sect-user table tr.certification td > p{ margin-bottom:5px;}
.sect-user table tr.certification td > strong{ display:inline-block; padding:0 10px;}

sect-user .confirm-type{ padding-top:24px; border-top:2px solid #999999; color:#666666;}
.sect-user .confirm-type h5{ margin-top:20px; color:#333333; font-size:14px;}
.sect-user .confirm-type h5:first-child{ margin-top:0;}
.sect-user .confirm-type h5 + p{ margin-top:5px;}
.sect-user .confirm-type a.round{ margin-top:15px;}
.sect-user .box-btn{ margin-top:25px;}

.cols-enterform{  }
.cols-enterform:after{ content:''; display:block; clear:both;}
*+html .cols-findoption{ zoom:1;}
.col-simple{ float:left; width:50%;}
.col-simple + .col-confirm{float:right; width:50%;}
.col-confirm{float:none; width:100%;}
.col-simple > .box-simple ,.col-confirm > .box-confirm{ height:auto;}
.col-confirm .box-confirm .confirm-type{ margin-top:20px;}
.col-confirm .box-confirm .confirm-type input[type="text"]{ margin-right:10px;}

.cols-enterform.nomember h4 + div{ height:400px;}
.cols-enterform div:first-child > h4 + div{ margin-right:-1px;}
.sect-viewform > .wrap-result { height:auto; padding:70px 110px 70px;}
.sect-viewform > .wrap-result.notfind{ padding-top:80px; background:url('../images/common/ico/ico_exclamation.gif') 50% 40px no-repeat;}
.sect-viewform .wrap-result.password{padding:50px 130px ; text-align:left; background:url('../images/common/ico/ico_lock.gif') 40px 40px no-repeat;}
.sect-viewform .wrap-result.password h3{ font-size:19px;}
.sect-viewform .wrap-result.password .newpassword{ vertical-align:top;}
.sect-viewform .wrap-result.password .newpassword + td > input{ margin-top:5px;}
.sect-passwardchange{ padding-top:30px;}
.sect-passwardchange > h3{ font-size:29px; font-family:'NanumBarunGothic';}
.sect-passwardchange > h3 + p{ line-height:2;}
.sect-passwardchange > h3 + p > strong{ font-size:12px; font-family:'NanumBarunGothic'; text-decoration:underline;}
.sect-passwardchange + p{ padding-top:15px;; border-top:1px solid #cacac0; color:#666666; font-size:12px; line-height:2;}

.box-security{ height:265px; padding-top:30px;border-bottom:2px solid #898987;}
.box-security h3 + p{ margin:10px 0; }
.box-security textarea{ width:519px; height:120px; margin-bottom:10px; background:#f2f0e5;}
.box-security a{ float:right;}
.sect-user.nomember{ margin-top:50px;}
.sect-user.nomember .cols-enterform.nomember h4 + div{ height:415px; padding-top:15px;}


/* 로그인개편 : 171116~ */
.login-renew-wrap {position:relative; margin:60px 0 30px; text-align:center;}
.login-renew-wrap .side_banner {position:absolute;}
.login-renew-wrap .bann1 {left:30px; top:300px;}
.login-renew-wrap .bann2 {right:30px; top:300px;}
.login-renew-wrap > .inner {margin:0 auto; width:700px;}
.login-renew-wrap .login-renew {width:450px; margin:0 auto;}
.login-renew-wrap h3.bartype {position:relative; padding:0 25px 25px; margin:0 0 40px; height:auto; line-height:1.4; font-size:32px; color:#000; background:none; border-bottom:2px solid #000; font-family:'NanumBarunGothic';}
.login-renew {width:100%;}
.login-renew h3 {padding:15px 0; font-size:32px; font-family:'NanumBarunGothic'; color:#000; background:none;}
.login-renew h3:first-child {padding-top:0; margin-top:0;}

.login-renew .inf_txt_bold {margin:20px 0; font-family:'NanumBarunGothicBold'; font-size:16px; color:#000; line-height:1.4;}
.login-renew .inf_txt_bold + .area_input {margin-top:40px;}

.area_input > div {position: relative; font-size: 10px;}
.area_input > div.on .del_input {display:block; opacity:1;}
.area_input > div .del_input {
	display:none; position: absolute; right: 2px; top: 12px; opacity: 0;
	width:20px; height:20px; background:url('http://img.cgv.co.kr/R2014/images/common/ico/icon_delete_input.png') no-repeat 0 0;
}




html,body, #contaniner, #footer {background-color:#fdfcf0;}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em,
font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody,
tfoot, thead, tr, th, td {font-size:100%; margin:0; padding:0; border:0; vertical-align:baseline; word-break:break-all;}
body {line-height:1; color:black; }
ol, ul {list-style:none;}
h1, h2, h3, h4, h5, h6{ font-family:'NanumBarunGothicBold', sans-serif; font-weight:normal}
table {width:100%; border-collapse:separate; border-spacing:0;}
caption, th, td {font-weight:normal; line-height:1.5em; text-align:left; vertical-align:middle;}
blockquote:before, blockquote:after, q:before, q:after {content:'';}
blockquote, q {quotes:'' '';}
button,
input {overflow:visible;}
button::-moz-focus-inner {border:0; padding:0;}
input, select, img {vertical-align:middle;}
textarea {overflow:auto; overflow-x:hidden; vertical-align:top;}
em {font-style:normal;}
strong{font-family:'NanumBarunGothicBold', sans-serif; font-weight:normal;}
i{font-style:normal;}
html,
body {height:100%;}
html {overflow-y:scroll;}

body,
input,
textarea,
button,
table {font-size:12px; line-height:1.2; color:#666; font-family:'NanumBarunGothic', '맑은 고딕', '돋움', Dotum, sans-serif;}
table thead th {font-family:'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;}
legend {font:0/0 a; position:absolute; right:-999em; top:-999em; zoom:1;}

a {color:inherit; text-decoration:none;}
*+ html a {color:#666;}
a:focus,
a:hover {text-decoration:none;}
a:active {background-color:transparent;}


textarea:focus,
select:focus,
button:focus,
[type='checkbox']:focus,
[type='radio']:focus,
[tabindex]:focus,
[href]:focus {outline:3px solid #ead3d7;}

hr {display:none;}

table caption {font:0/0 a; zoom:1;}

input::-webkit-input-placeholder {color:#666;}
input:focus::-webkit-input-placeholder {color:#dcdcdc;}
input::-moz-placeholder {color:#666; opacity:1;}
input:focus::-moz-placeholder {color:#dcdcdc;}


button,
input[type=''],
input[type='reset'] { padding:0;border:0 none; background-color:transparent; vertical-align:middle;}
button,
input[type='submit'],
input[type='button'] {cursor:pointer; margin:0; padding:0;}
input[type='text'],input[type='password'] {display:inline-block; height:25px; line-height:22px; padding-left:10px; border:1px solid #b5b5b5;}

input[type='password'][readonly],
input[type='text'][readonly],
input[type='password'][disabled],
input[type='text'][disabled] {background-color:#e8e8dd;}
button:active {}

.hidden{
	font:0/0 a; 
	eight: 0;
	overflow: hidden;
	position: absolute;
	visibility: hidden;
	width: 0;
	zoom:1;
}

#contaniner{
	margin:100px;
}

/* 회원가입 button */
.join_btn{
  background:red;
  color:#fff;
  border:none;
  position:relative;
  height:35px;
  font-size:0.8em;
  padding:0 1em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.join_btn:hover{
  background:#fff;
  color:red;
}
.join_btn:before,.join_btn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: red;
  transition:400ms ease all;
}
.join_btn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.join_btn:hover:before,.join_btn:hover:after{
  width:0;
  transition:800ms ease all;
}


</style>
<script type="text/javascript" src="/MyCGV/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
(function ($) {
	$(function() {
		$('#member_id').focus();
		
		// 쿠키값을 가져온다.
		var cookie_user_id = getLogin();
		// 쿠키값이 존재하면 id에 쿠키에서 가져온 id를 할당한 뒤 체크박스를 체크상태로 변경
		if(cookie_user_id != "") {
			$("#member_id").val(cookie_user_id);
			$("#save_id").attr("checked", true);
		}
		// 아이디 저장 체크시
		$("#save_id").on("click", function(){
			var isRemember;

			if($(this).is(":checked")) {
			isRemember = 
				confirm("이 PC에 로그인 정보를 저장하시겠습니까?\nPC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");

				if(!isRemember)    
					$(this).attr("checked", false);
			}
		});
		
		// saveLogin : 로그인 정보 저장 : @param id
		function saveLogin(id) {
			if(id != "") {
			// memberId 쿠키에 id 값을 7일간 저장
			setSave("memberId", id, 7);
			}else{
			// memberId 쿠키 삭제
			setSave("memberId", id, -1);
			}
		}
		
		// setSave : Cookie에 member_id를 저장
		// @param name,@param value,@param expiredays
		function setSave(name, value, expiredays) {
			var today = new Date();
			today.setDate( today.getDate() + expiredays );
			document.cookie = name + "=" + escape( value ) 
			+ "; path=/; expires=" + today.toGMTString() + ";"
		}
		// getLogin : 쿠키값을 가져온다.
		// @returns {String}
		function getLogin() {
			// memberId 쿠키에서 id 값을 가져온다.
			var cook = document.cookie + ";";
			var idx = cook.indexOf("memberId", 0);
			var val = "";

			if(idx != -1) {
				cook = cook.substring(idx, cook.length);
				begin = cook.indexOf("=", 0) + 1;
				end = cook.indexOf(";", begin);
				val = unescape(cook.substring(begin, end));
			}
			return val;
		}
		
		
		
        $('#submit').on('click', function () {
        	var memberIdObj = $('#member_id');
        	var memberPwdObj = $('#member_pwd');
        	
			if($("#save_id").is(":checked")){ // 저장 체크시
				saveLogin(memberIdObj.val());
			}else{ // 체크 해제시는 공백
				saveLogin("");
			}
/*             // 아이디 유효성 검사 (영문 대/소문자,숫자만 허용)
            for (i = 0; i < memberIdObj.val().length; i++) {
                ch = memberIdObj.val().charAt(i);
                if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
                    alert("아이디는 영문 대/소문자, 숫자만 입력가능합니다.")
                    memberIdObj.focus();
            		return false;
                }
            }
            if (memberIdObj.val().includes(" ")) {
        		//아이디에 공백 사용하지 않기
                alert("아이디에 공백을 사용할 수 없습니다.");
                memberIdObj.focus();
        		return false;
            } 
            
            
            //아이디 길이 체크 (4~12자)
            if (memberIdObj.val().length<8 || document.f.my_id.value.length>12) {
                alert("아이디를 8 ~ 12자까지 입력해주세요.")
                document.f.my_id.focus()
                document.f.my_id.select()
                return false;
            } */
           
            
        	if(memberIdObj.val()==""){ 
        		alert("아이디를 입력하세요.");
        		memberIdObj.focus();
        		return false;
        	} else if(memberIdObj.val().includes(" ")){
        		alert("입력한 아이디를 다시 확인하세요.");
        		memberIdObj.focus();
        		return false;
        	} else if(memberPwdObj.val()==""){
        		alert("비밀번호를 입력하세요.");
        		memberPwdObj.focus();
        		return false;
        	} else if(memberPwdObj.val().includes(" ")){
        		alert("입력한 비밀번호를 다시 확인하세요.");
        		memberPwdObj.focus();
        		return false;
        	}  else {
        		$.ajax({
            		url: "./memberLogin.do",
            		type: "post",
            		dataType: "html",
            		cache: false,
            		async: false,
            		timeout: 30000,
            		success: function(data) {
            			$("#resultAlert").html(data);
            		},
            		error: function(xhr, textStatus, errorThrown) {
    					
  					}
            	});
        	}
        });
	});
})(jQuery);
</script>
   
<body>
<jsp:include page="/main/main/header.jsp"/>
						<!-- ********************* 비밀번호 5회 오류시 ??? ********************* -->
<div id="contaniner">
	<div id="contents">
    	<div class="wrap-login">
        	<div class="sect-login">
          		<div class="box-login login_1408">
                <h3 class="hidden">회원 로그인</h3>
                    <form id="form2_capcha" name="memberLoginForm" method="post" action="memberLogin.do" novalidate="novalidate" style="display:block;">
                 		<fieldset>
                			<div class="txt_wrap">
                            	<img height="200px" width="200px" src="../image/loginForm/loginMain.png">
                            </div>
                           	<div class="login">
                                <input type="text" title="아이디" id="member_id" name="member_id" data-title="아이디를 " data-message="입력하세요." required="required">
                            	<input type="password" title="패스워드" id="member_pwd" name="member_pwd" data-title="패스워드를 " data-message="입력하세요." required="required">
                            </div>
                            <button type="submit" id="submit" title="로그인">
                            	<span>로그인</span>
                            </button>
                            <input type="checkbox" id="save_id">
							<label for="save_id">아이디 저장</label>
							<br>
							<br>
							<a href="#">아이디 찾기</a> / 
							<a href="#">비밀번호 찾기</a>
						</fieldset>
					</form>
				</div>
        	</div>
        </div>
		<div class="sect-loginguide">
        	<div class="box-useguide">
            	<strong>movieT 회원이 아니신가요?</strong>
              	<span>회원가입하시고 다양한 서비스를 즐기세요!</span>
              	<button class="join_btn" onclick="location.href='memberWriteForm.do'" id="submit">MovieT 회원가입하기</button>
            </div>
        </div>
       	<div class="sect-loginad" style="background:#d2cbbe">
            <div>
            	<img src="../image/loginForm/cinema.jpg" width="350" height="250" frameborder="0"/>
        	</div>
    	</div>
	</div>
</div>

<jsp:include page="/main/main/footer.jsp"/>
<div id="resultAlert"></div>
</body>
</html>