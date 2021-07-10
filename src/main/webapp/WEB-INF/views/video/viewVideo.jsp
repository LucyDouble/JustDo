<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JD 교육원</title>
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/fonts.css">
<link rel="stylesheet" href="resources/css/common/header.css">
<link rel="stylesheet" href="resources/css/videoList.css"/>
<link rel="stylesheet" href="resources/css/common/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<style>
	.viewVideo_tile{
		border-top: 1px solid #222;
		border-bottom: 1px solid #dae0e9;
		height: 70px;
		padding: 0 20px;
		line-height: 70px;
	}
	.viewVideo_tile_left{
		float: left;
		color: #222;
		font-size: 16px;
	}
	.viewVideo_tile_right{
		float: right;
		color: #222;
		font-size: 13px;
	}
	.viewVideo_cont{
		text-align: left;
		font-size: 20px;
	}
	.viewVideo_main{
		padding: 20px 0;
	}
</style>
</head>
<body>
	<div class="wrapper"><jsp:include page="../common/header.jsp"></jsp:include></div>
		<form id="timefrm">
		<input type="hidden" id="nowTime" name="nowTime">
		</form>
		<div class="ln_page">
			<p class="ln_title v_title">학습동영상</p>
			<div class="viewVideo_tile">
				<p class="viewVideo_tile_left">${view.video_title}</p>
				<p class="viewVideo_tile_right">${view.video_date}</p>
			</div>
			<div class="viewVideo_main">
				<video id="LVideo" controls="controls" height="600" width="1000" poster="${view.video_image}">
				<source src="${view.video_path}" type="video/mp4">
			</video>
			</div>
			<div class="viewVideo_cont">${view.video_content}
			</div>
		</div>
	<script>
		var video = document.getElementById("LVideo");
		
		var playtime = "";
		
		video.addEventListener('timeupdate', function gg(){
			// 현재 재생 시간 (초 단위 절삭)
			var playtime = Math.floor(video.currentTime);
				// ajax update db where 
				// where  현재 진행률이 70% 다시 들어와서 볼때 현재보다 낮을땐 업데이트 안되다가 현재진행률 보다 높아졌을때 업데이트 
				$.ajax({
					url:"Addprogress",
					type:"post",
					data: {
						progress : playtime
					},
					success:function(data){
						
					},
					error : function(){
						
					}
				});
			}, false);
		
		
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>