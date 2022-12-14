<%@page import="com.nonage.dto.MemberVO"%>
<%@page import="com.nonage.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%
	MemberDAO dao = MemberDAO.getInstance();
	ArrayList<MemberVO> data=	dao.listMember("나리");
	request.setAttribute("data1", data);
%>	
<c:forEach var="member" items="${data1}">
	<hr>${member.id}
	${member.pwd} :
	${member.name} :
	${member.email} :
	${member.zipNum} :
	${member.address} :
	${member.phone} :
	${member.useyn} :
	${member.indate} :	
</c:forEach>
</body>
</html>