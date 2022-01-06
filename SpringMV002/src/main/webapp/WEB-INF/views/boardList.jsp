<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>            
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
    <h1>게시판 목록</h1>
    <table border="1" class="table table-hover table-bordered">
	<tr>
	<td>번호</td>
	<td>제목</td>
	<td>작성자</td>
	<td>작성일</td>
	<td>조회수</td>
	</tr>
	<c:forEach  var="vo" items="${list}">
	<tr>
	<td>${vo.idx}</td>
	<td><a href="boardview.do/${vo.idx}">${vo.title}</a></td>
	<td>${vo.writer}</td>
	<td>${vo.indate}</td>
	<td>${vo.count}</td>
	</tr>
	</c:forEach>
	<tr>
	<td colspan="5"><button class="btn btn-primary btn-sm" onClick="location.href='${cpath}/boardInsert.do'">글쓰기</button></td>
	</tr>
	</table>
    </div>
    <div class="panel-footer">빅데이터 분석 서비스 개발자 과정(나민주)</div>

  </div>
</div>

</body>
</html>
