<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="book.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookInfo_test</title>
</head>
<body>

<%
	BookDAO bookDAO = BookDAO.getInstance();
	bookDAO.showbookinfo();

%>
<%= bookDAO.showBookTitle() %>

</body>
</html>