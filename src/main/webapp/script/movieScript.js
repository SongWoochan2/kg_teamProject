/**
 * 
 * 
 */

	$(function(){

		
		$("a.photoview").click(function() {
			// 배경 레이어를 화면에 표시한다.
			$("#glayLayer").fadeIn(300);
			// 이미지 레이어를 화면에 표시한다.
			$("#overLayer").fadeIn(200);
			
			$("#overLayer").html("<img src='" + $(this).attr("href") + "' />");
			// 링크의 페이지 이동 중단.
			return false;
		});
		
		$("#glayLayer,#overLayer").click(function(){
			// 배경 레이어의 숨김
			$("#glayLayer").fadeOut(300);
			
			// 이미지 레이어의 숨김
			$("#overLayer").fadeOut(200);
		});
		
		$("#review-insert").fadeOut(0);
		$("#reviewInsert").click(function(){
			// 배경 레이어를 화면에 표시한다.
			$("#review-insert").toggle(300);
		});
		
		
		
		$("#insert-score").text(10);
		
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
			for(var i = 1; i<=5; i++){
				if($("#"+i).val() == '★'){$("#insert-score").text(i*2);$("#evaluat_score").val(i*2);}
				else if($("#1").val() == '☆'){$("#insert-score").text(1);$("#evaluat_score").val(1);
				}
			}
		};
		
	});