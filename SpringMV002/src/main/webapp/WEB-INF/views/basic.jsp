<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>      
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
  <script type="text/javascript">
  	$(document).ready(function(){
  		//alert("제이쿼리 시작");
  		loadlist();
  	});
  	function loadlist(){
  		$.ajax({
  			url: "${cpath}/boardList.Ajax",
  			type: "get",
  			dataType: "json",
  			success: listview,
  			error: function(){alert("error");}
  		});
  	}
  	function listview(data){
  		//alert(data);
  		var blist="<table class='table table-hover table-bordered'>";
  		blist+="<tr>"
  		blist+="<td>번호</td>";
  		blist+="<td>제목</td>";
  		blist+="<td>작성자</td>";
  		blist+="<td>작성일</td>";
  		blist+="<td>조회수</td>";
  		blist+="<td>수정</td>";
  		blist+="<td>삭제</td>";
  		blist+="</tr>";
  		$.each(data,function(index,obj){
  			blist+="<tr>";
  		  	blist+="<td>"+(index+1)+"</td>";
  		  	blist+="<td id = 't"+obj.idx+"'><a onclick='boardview("+obj.idx+")'>"+obj.title+"</td>";
  		  	blist+="<td id = 'w"+obj.idx+"'>"+obj.writer+"</td>";
  		  	blist+="<td>"+obj.indate+"</td>";
  		  	blist+="<td>"+obj.count+"</td>";
  		    blist+="<td id='u"+obj.idx+"'>"
  		    blist+="<button type='button' class='btn btn-success btn-sm change' onclick='goupdate("+obj.idx+")'>수정</button>";
  		   /*        	 blist+="<td id='u"+obj.idx+"'><button class='btn btn-info btn-sm' onclick='goUpdate("+obj.idx+")'>수정</button></td>";
  */
  		    blist+="</td>"
  		    blist+="<td>"
  		    blist+="<button type='button' class='btn btn-warning btn-sm delete' onclick='godelete("+obj.idx+")'>삭제</button>";
  		    blist+="</td>"
  		    blist+="</tr>";
  		 	blist+="<tr class="+obj.idx+" style='display:none'>";
  		 	blist+="<td>내용</td>";
  		 	blist+="<form>"
  		 	blist+="<td colspan='6'><textarea rows'7' class='form-control' id='c"+obj.idx+"'>"+obj.content+"</textarea>";
  		 	blist+="<br/>";
  		 	blist+="<button type='button' class='btn btn-success btn-sm change' onclick='gochange("+obj.idx+")'>수정하기</button> &nbsp;";
  			blist+="<input type='reset' class='btn btn-warning btn-sm' value='취소하기'>&nbsp&nbsp;";
  			/* "<button type='reset' class='btn btn-warning btn-sm'>취소하기</button>&nbsp&nbsp;"; */
  			/*foreach 문에서 리셋은 작동하지 않으니 버튼의 방식을 활용  */
  			blist+="<button type='button' class='btn btn-danger btn-sm back' onclick='boardview("+obj.idx+")'>닫기</button>";
  			blist+="</form>"
  			blist+="</td>";
  			blist+="</tr>";
  		});
  		blist+="<tr>";
  		blist+="<td colspan='5'>"
  		blist+="<button class='btn btn-primary btn-sm' onClick='goform()'>글쓰기</button></td>";
  		blist+="</tr>";
  		blist+="</table>";
  		$(".blist").html(blist);
  	}
  	function goform(){
  		if($(".insertfrom").css("display")=="block"){
  			 //jQuery('.insertfrom').css("display", "none");
  			$(".insertfrom").slideUp(); 
  		}else{
  			//jQuery(".insertfrom").css("display","block");
  			$(".insertfrom").slideDown();
  		}
  	}
  	function goinsert(){
  		//var title=$("#title").val();
  		//var content=$("#content").val();
  		//var writer=$("#writer").val();
  		var fdata=$("#frm").serialize();
  		$.ajax({
  			url:"${cpath}/boardinsert.Ajax",
  			type:"post",
  			data:fdata,
  			success:loadlist,
  			error: function(){alert("에러");}
  		});
  		//$("#title").val("");
  		//$("#content").val("");
  		//$("#writer").val("");
  		$(".cancel").trigger("click")
  		$(".insertfrom").css("display","none");
  	}
  
  	function boardview(idx){
  		if($("."+idx).css("display")=="none"){
 			 //jQuery('.insertfrom').css("display", "none");
  			$("."+idx).css("display","table-row");
 		}else{
 			//jQuery(".insertfrom").css("display","block");
 			$("."+idx).css("display","none");
 		}
  		
  	}
  
  	function godelete(idx){
  	if (confirm("정말로 삭제하시겠습니까?")==true){
  		alert("삭제 되었습니다.")
  		$.ajax({
  			url:"${cpath}/boarddelete.Ajax",
  			type: "get",
  			data: {"idx":idx},
  			success:loadlist, 
  			error: function(){alert("에러");}
  		});
  	}else{
  		loadlist();
  	}
  	}
  	
  	function gochange(idx){
  		var content=$("#c"+idx).val();
  		$.ajax({
  			url:"${cpath}/boardreplace.Ajax",
  			type: "post",
  			data: {"idx":idx,"content":content},
  			success:loadlist, 
  			error: function(){alert("에러");}
  		});
  	}
  	function goupdate(idx){
  		var title=$("#t"+idx).text();
  		var newTitle="<input type='text' id='tt"+idx+"' class='from-control' value='"+title+"'>";
  		$("#t"+idx).html(newTitle);
  		var writer=$("#w"+idx).text();
  		var newWriter="<input type='text' id='ww"+idx+"' class='from-control' value='"+writer+"'>";
  		$("#w"+idx).html(newWriter);
  		var newUpdate="<button class='btn btn-success btn-sm' onclick='update("+idx+")'>수정_하기</button>";
  		$("#u"+idx).html(newUpdate);
  		};
  	function update(idx){
  		var title=$("#tt"+idx).val();
  		var writer=$("#ww"+idx).val();
  		$.ajax({
  			url:"${cpath}/boardupdate.Ajax",
  			type: "post",
  			data: {"idx":idx,"title":title,"writer":writer},
  			success:loadlist, 
  			error: function(){alert("에러");}
  		});
  		
  	}
  </script>
</head>
<body>
<div class="container">
  <h2>스프링 웹 MVC02(제이쿼리, 에이젝스, 제이슨)</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Spring Board</div>
    <!--1.게시판 목록  -->
    <div class="panel-body blist"></div>
    <!--2.게시판 글쓰기 -->
    <div class="panel-body insertfrom" style="display: none;">
   <form id="frm" class="form-horizontal" method="post">
  <!--2-1제목 -->
  	<div class="form-group">
    <label class="control-label col-sm-2" for="title">제목:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요">
    </div>
  	</div>
  <!--2-2작성자  -->
  	<div class="form-group">
    <label class="control-label col-sm-2" for="writer">작성자:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="writer" id="writer" placeholder="작성자 이름">
    </div>
  	</div>
  <!--2-3내용 -->
  <div class="form-group">
  <label class="control-label col-sm-2" for="content" >내용:</label>
  <div class="col-sm-10">
  <textarea class="form-control" rows="10" name="content" id="content" placeholder="내용을 입력하세요"></textarea>
	</div>
	</div>
	<!--2-4 제출하기  -->
 <div class="form-group">
   <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-success btn-sm" onclick="goinsert()">글쓰기</button>
      <button type="reset" class="btn btn-warning btn-sm cancel">취소</button>
    </div>
	</div>
     </form>
     </div>
     <!--3. 게시판 보기  -->
    <!--  <div class="panel-body bview" style="display: none;"></div> -->	
     <!--4.  -->
    <div class="panel-footer">빅데이터 분석 서비스 개발자 과정(나민주)</div>

  </div>
</div>
</body>
</html>
