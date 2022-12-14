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
	QnaVO qnaVO = new QnaVO();
	qnaVO.setQseq(22);
	qnaVO.setReply("답변완료");
	qnaDAO.updateQna(qnaVO);
	ArrayList<QnaVO> data1 = qnaDAO.listAllQna();
    request.setAttribute("data", data1);
%>
<c:forEach var="Qna" items="${data}">
		<hr> ${Qna.qseq}
		${Qna.subject} :
		${Qna.content} :
		${Qna.reply} :
		${Qna.id} :
		${Qna.rep} :
		${Qna.indate} :		
</c:forEach> 
</body></html>