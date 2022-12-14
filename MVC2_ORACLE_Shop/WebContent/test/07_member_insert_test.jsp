<%@page import="com.nonage.dto.MemberVO"%>
<%@page import="com.nonage.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
	MemberVO member = new MemberVO();
	member.setId("test");
	member.setPwd("1234");
	member.setName("test");
	member.setZipNum("133-110");
	member.setAddress("서울시 ");
	member.setPhone("010-123-1234");
	MemberDAO dao = MemberDAO.getInstance();
	dao.insertMember(member);
	out.print("입력 완료");
%>
</body>
</html>