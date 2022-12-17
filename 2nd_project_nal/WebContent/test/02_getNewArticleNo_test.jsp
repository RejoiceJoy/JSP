<%@page import="java.sql.Connection"%>
<%@page import="model.*"%>
<%@page import= "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    BoardDAO dao = BoardDAO.getInstance();
	out.println("DB연동 성공");
	int result = dao.getListCount("string", "string");
%>
전체글수<%= result %>
</body> </html>