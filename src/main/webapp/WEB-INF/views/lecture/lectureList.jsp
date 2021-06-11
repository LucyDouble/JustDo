<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<style>
	@font-face {
    src : url("resources/fonts/SCDream4.otf");
    font-family: SCDream4;
    }
     body {
        margin: 0px;
        padding: 0px;
        width: 800px;
        margin: auto;
        font-family: SCDream4;
    }
     .table th {
    font-size: 18px;
    color: #fff;
    line-height: 1.4;
    background-color: #6A60A9;
    }
    .table td {
    font-size: 15px;
    color: black;
    line-height: 1.4;
    }
    .table .table tr:nth-child(even) {
    background-color: #f8f6ff;
    }
    .table {
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -moz-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -webkit-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -o-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    -ms-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
    }
    .cont {
    	border-bottom: 1px;
    	border-bottom-style: solid;
    	border-bottom-color: black;
    	margin-bottom: 50px;
    }
    .content1 {
    	margin: 30px;
    	
    }
    h2 {
    	
    }
</style>
</head>
<body>
<div>
	<section>
		<div class="cont">
			<article class="content1">
				<h2>강의정보</h2>
			</article>
		</div>
		<div>
			<article>
				<form>
					<table class="table">
						<thead>
							<tr>
								<th>NO</th>
								<th>분반</th>
								<th>강의명</th>
								<th>주야</th>
								<th>교직원</th>
								<th>인원제한</th>
								<th>수강인원</th>
								<th>&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>32</td>
								<td>아아아아아아아아</td>
								<td>오전반</td>
								<td>아아아</td>
								<td>30</td>
								<td>0</td>
								<td><input type="checkbox"></td>
							</tr>
						</tbody>
					</table>
					<input type="button" value="등록">
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</form>
			</article>
		</div>
	</section>
</div>

</body>
</html>