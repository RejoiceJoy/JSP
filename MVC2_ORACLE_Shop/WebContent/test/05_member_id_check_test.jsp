<%@page import="java.sql.Connection"%>
<%@page import="com.nonage.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<% 
	MemberDAO dao = MemberDAO.getInstance();
	int re = dao.confirmID("one"); //기본 가입 아이디
	out.println(re +"<hr>");
	
	re = dao.confirmID("test"); //미가입 아이디
	out.println(re +"<hr>");
%>
</body>
</html>