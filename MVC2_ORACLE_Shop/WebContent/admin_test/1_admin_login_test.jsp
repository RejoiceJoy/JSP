<%@page import="com.nonage.dao.WorkerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%
	WorkerDAO workerDAO = WorkerDAO.getInstance();
	int result = workerDAO.workerCheck("admin","admin");
	out.print(result +"<hr>"); //로그인 성공
	
	result = workerDAO.workerCheck("admin","1234");
	out.print(result +"<hr>"); //비번실패
	
	result = workerDAO.workerCheck("test","1234");
	out.print(result +"<hr>"); //아이디 없음

%>
</body></html>