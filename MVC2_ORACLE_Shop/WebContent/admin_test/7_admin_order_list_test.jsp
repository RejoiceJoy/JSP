<%@page import="com.nonage.dto.OrderVO"%>
<%@page import="com.nonage.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%
	OrderDAO orderDAO = OrderDAO.getInstance();
	ArrayList<OrderVO> data1 = orderDAO.listOrder("김나리");
	request.setAttribute("data",data1);
%>
<c:forEach var="orders" items="${data}">		
		<hr>${orders.odseq} :
		${orders.oseq} :
		${orders.id} :
		${orders.indate} :
		${orders.mname} :
		${orders.zipNum} : <!-- 대소문자 주의 -->
		${orders.address} :
		${orders.phone} :
		${orders.pseq} :
		${orders.pname} :
		${orders.quantity} :
		${orders.price2} :
		${orders.result} <hr>	
</c:forEach>				
</body></html>