<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ibatis만든 메모장</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script type="text/javascript">
	$(function(){
		$("#saveBtn").click(function(){
			$("#pdsform").submit();
	});
</script>
<style type="text/css">
	body{padding:5px;margin:auto;}
	#memoDiv,#titleDiv { border: 1px solid #ccc; padding: 10px; border-radius: 10px;margin-bottom: 10px;}
	#pageinfo { padding: 5px; margin-bottom: 5px; text-align: right;}
	#pageMove { padding: 5px; margin-bottom: 5px; text-align: center;}
	#memoListDiv {border: 1px solid #ccc; padding: 5px; margin-bottom: 10px;}
	#memoform{border: 1px solid #ccc; padding: 5px; border-radius: 10px;margin-bottom: 10px;}
	#name{width:13%;float: left;margin: 0px 5px 5px 0px;}
	#password{width:13%;float: left;margin: 0px 5px 5px 0px;}
	#memo {width:65%; margin: 0px 5px 5px 0px;}
</style>	
</head>
<body>
	<div id="memoDiv">
		<div id="titleDiv">허접메모장 Ver 0.9999</div>
		<div id="pageinfo">
			전체 : ${pageList.totalCount }개
			<c:if test="${pageList.totalCount>0 }">
				(${pageList.currentPage }/${pageList.totalPage }Page)
			</c:if>
		</div>
		<div id="memoListDiv">
			<c:forEach var="vo" items="${pageList.list }" varStatus="status">
				<div style="border-bottom : 1px solid gray;margin-bottom: 5px;">
					${vo.idx }. 
					<c:out value="${vo.name }"/> 님이 
					(<fmt:formatDate value="${vo.wdate }" type="date" dateStyle="short"/>) 남길글 : 
					<c:out value="${vo.memo }"/> 
				</div>
			</c:forEach>
		</div>
		<div id="pageMove">
			<%-- 시작 페이지 번호가 1보다 크다면 이전 페이지가 존재한다. --%>
			<c:if test="${pageList.startPage>1 }">
					[<a href="?p=${pageList.startPage-1 }&s=${pageSize }&b=${blockSize }">이전</a>] 	
			</c:if>
			<%-- 페이지 목록 --%>
			<c:forEach var="i" begin="${pageList.startPage }" end="${pageList.endPage }" >
				<c:if test="${i==currentPage }">
					[${i }] 
				</c:if>
				<c:if test="${i!=currentPage }">
					[<a href="?p=${i }&s=${pageSize }&b=${blockSize }">${i }</a>] 
				</c:if>
			</c:forEach>
			<%-- 끝 페이지 번호가 전체페이지 보다 적다면 다음 페이지가 존재한다. --%>
			<c:if test="${pageList.endPage<pageList.totalPage }">
					[<a href="?p=${pageList.endPage+1 }&s=${pageSize }&b=${blockSize }">다음</a>] 	
			</c:if>			
		</div>
		<div>
			<!-- 글쓰기 -->
			<form action="insertOk.jsp" method="post" id="memoform">
				<input type="hidden" name="s" value="${pageSize }">
				<input type="hidden" name="b" value="${blockSize }">
			   	<input type="text" class="form-control" id="name" name="name" placeholder="이름" required="required">
		    	<input type="password" class="form-control" id="password" name="password" placeholder="암호" required="required">
		    	<input type="text" class="form-control" id="memo" name="memo" placeholder="내용을 넣으세요." required="required">
		    	<div style="text-align: right;">
					<button type="button" class="btn btn-success" id="saveBtn"> 저장하기 </button>
				</div>
			</form>	
		</div>
	</div>
</body>
</html>