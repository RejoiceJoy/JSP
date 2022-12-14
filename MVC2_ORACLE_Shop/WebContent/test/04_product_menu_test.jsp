<%@page import="com.nonage.dto.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nonage.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
ProductDAO dao = ProductDAO.getInstance();
ArrayList<ProductVO> data	   =	dao.listKindProduct("1");
request.setAttribute("data1", data);
%>	
<c:forEach var="product" items="${data1}">
			${product.pseq}<hr>
			${product.name}<hr>
			${product.price2}<hr>		
			${product.image}<hr>					
</c:forEach>
</body>
</html>