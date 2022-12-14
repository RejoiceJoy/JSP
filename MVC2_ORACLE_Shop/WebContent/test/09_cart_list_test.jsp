<%@page import="com.nonage.dto.CartVO"%>
<%@page import="com.nonage.dao.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%
CartDAO dao = CartDAO.getInstance();
ArrayList<CartVO> data1	   =	dao.listCart("one");
request.setAttribute("data", data1);
%>
<c:forEach var="cart" items="${data}">
		${cart.cseq}<hr>
		${cart.id}<hr>
		${cart.pseq}<hr>
		${cart.mname}<hr>
		${cart.pname}<hr>
		${cart.quantity}<hr>
		${cart.indate}<hr>
		${cart.price2}<hr>
</c:forEach>
</body></html>