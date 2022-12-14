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
ArrayList<ProductVO> data1	   =	dao.listBestProduct();
request.setAttribute("data", data1);
%>
	<c:forEach var="best_pro_view" items="${data}">
					${best_pro_view.pseq}<hr>
					${best_pro_view.name}<hr>
					${best_pro_view.price2}<hr>		
					${best_pro_view.image}<hr>
	</c:forEach>
</body>
</html>