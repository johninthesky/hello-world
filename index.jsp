<%@page import="kr.jeoun.memo.vo.MemoVO"%>
<%@page import="kr.jeoun.memo.vo.PageList"%>
<%@page import="kr.jeoun.memo.service.MemoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="getParam.jsp" %>
<%
	PageList<MemoVO> pageList = MemoService.getInstance().selectList(currentPage, pageSize, blockSize);
	request.setAttribute("pageList", pageList);
	pageContext.forward("list.jsp");
%>