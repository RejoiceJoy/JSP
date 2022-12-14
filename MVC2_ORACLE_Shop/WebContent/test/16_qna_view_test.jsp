<%@page import="com.nonage.dto.QnaVO"%>
<%@page import="com.nonage.dao.QnaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%
	QnaDAO qnaDAO = QnaDAO.getInstance();      
	QnaVO data1 = qnaDAO.getQna(1);
    request.setAttribute("Qna", data1);
%>
		${Qna.qseq}<hr>
		${Qna.subject}<hr>
		${Qna.content}<hr>
		${Qna.reply}<hr>
		${Qna.id}<hr>
		${Qna.rep}<hr>
		${Qna.indate}<hr>		
</body></html>