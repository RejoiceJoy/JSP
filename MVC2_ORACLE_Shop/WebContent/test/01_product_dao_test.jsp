<%@page import="java.util.ArrayList"%>
<%@page import="com.nonage.dao.ProductDAO"%>
<%@page import="com.nonage.dto.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%

ProductDAO dao = ProductDAO.getInstance();
ArrayList<ProductVO> data1	   =	dao.listNewProduct();
request.setAttribute("data", data1);
%>
	<c:forEach var="new_pro_view" items="${data}">
					${new_pro_view.pseq}<hr>
					${new_pro_view.name}<hr>
					${new_pro_view.price2}<hr>		
					${new_pro_view.image}<hr>
	</c:forEach>
</body>
</html>