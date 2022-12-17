<%@page import="java.util.List" %>
<%@page import="java.sql.Connection"%>
<%@page import="sec03.brd08.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    BoardDAO dao = BoardDAO.getInstance();
	out.println("D연동 성공");
	out.println("<br>");
	List<ArticleVO> list = dao.selectAllArticles();
	
	for(ArticleVO vo : list){
		out.println("<br>");
		out.println(vo.getArticleNO());
		out.println(vo.getParentNO());
		out.println(vo.getTitle());
		out.println(vo.getContent());
		out.println(vo.getImageFileName());
		out.println(vo.getId());
		out.println(vo.getWriteDate());		
		out.println("<br>");
	}//end for
	
%>
</body> 
</html>