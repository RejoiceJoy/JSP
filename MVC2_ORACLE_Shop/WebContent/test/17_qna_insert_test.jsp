<%@page import="com.nonage.dao.QnaDAO"%>
<%@page import="com.nonage.dto.QnaVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%
	QnaVO qnaVO = new QnaVO();
	qnaVO.setSubject("테스트3");
	qnaVO.setContent("질문내용3");      
	
	QnaDAO qnaDAO = QnaDAO.getInstance();
	qnaDAO.insertqna(qnaVO, "one");      
	out.print("입력완료");
%>
</body></html>