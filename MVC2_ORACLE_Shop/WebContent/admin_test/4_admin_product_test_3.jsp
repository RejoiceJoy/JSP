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
	ProductDAO productDAO = ProductDAO.getInstance();
	ArrayList<ProductVO> data1 =
			productDAO.listProduct(2, "");
	request.setAttribute("data",data1);
%>
<c:forEach var="product" items="${data}">
					<hr>
					${product.pseq} :
					${product.name} :
					${product.price1} :	
					${product.price2} :	
					${product.price3} :						
					${product.content} :
					${product.useyn} :
					${product.bestyn} :					
					<hr>				
		</c:forEach>					
</body>
</html>