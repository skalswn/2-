<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>      
      
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>스프링 웹 MVC01</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Spring Board</div>
    <div class="panel-body">
    	<table class="table table-bordered">
    		<tr>
    			<td>제목</td>
    			<td>${vo.title}</td>
    		</tr>
    		<tr>
    			<td>내용</td>
    			<td>${fn:replace(vo.content,"\\n","<br>")}</td>
    		</tr>
    		<tr>
    			<td>작성일</td>
    			<td>${vo.indate}</td>
    		</tr>
    		<tr>
    		<td colspan="2" align="center">
    		<button class="btn btn-primary btn-sm" onClick="location.href='http://localhost:8081/web/boardreplace.do'">수정</button>
    		<button class="btn btn-danger btn-sm" onClick="location.href='http://localhost:8081/web/boarddelete.do'">삭제</button>
    		<button class="btn btn-warning btn-sm" onClick="location.href='http://localhost:8081/web/boardList.do'">돌아가기</button>
    		</td>
    		</tr>
    	</table>	
    </div>
    <div class="panel-footer">빅데이터 분석 서비스 개발자 과정(나민주)</div>

  </div>
</div>

</body>
</html>
