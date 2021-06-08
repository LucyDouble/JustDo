<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
    text-align: center;
    width: 800px;
    margin: auto;
}
.button {
  display: inline-block;
  border-radius: 5px;
  background-color: #6A60A9;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 15px;
  /* padding: 20px; */
  width: 70px;
  height: 40px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  float: right;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '!';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 10px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}


/* 
.btn {
background-color: #6A60A9;
color: white;
width: 70px;
text-align: center;
float: right;
margin-left: 10px;
}
.btn:hover{
    background-color: #DEDCEE;
} */
</style>
<body>
    <p>공지사항 게시판</p>
    
    <table class="table">
        <thead>
        <tr>
            <th>No.</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>            
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
            <tr>
                <td>2</td>
                <td>테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
            <tr>
                <td>3</td>
                <td>테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
            <tr>
                <td>4</td>
                <td>테스트입니다/테스트입니다/테스트입니다/테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
            <tr>
                <td>5</td>
                <td>테스트입니다</td>
                <td>운영자</td>
                <td>2021-06-04</td>
            </tr>
        </tbody>
    </table>
    <button class="button" style="vertical-align:middle"><span>글쓰기</span></button>
    <button class="button" style="vertical-align:middle"><span>삭제 </span></button>
</body>
</html>