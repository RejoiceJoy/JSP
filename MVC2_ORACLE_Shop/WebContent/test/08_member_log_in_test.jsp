<%@page import="com.nonage.dto.MemberVO"%>
<%@page import="com.nonage.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
MemberDAO dao = MemberDAO.getInstance();
MemberVO data	   =	dao.getMember("one");
request.setAttribute("member", data);
%>	
	${member.id}<hr>
	${member.pwd}<hr>
	${member.name}<hr>
	${member.email}<hr>
	${member.zipNum}<hr>
	${member.address}<hr>
	${member.phone}<hr>
	${member.useyn}<hr>
	${member.indate}<hr>	
</body>
</html>