<%@page import="com.nonage.dto.AddressVO"%>
<%@page import="com.nonage.dao.AddressDAO"%>
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
AddressDAO dao = AddressDAO.getInstance();
ArrayList<AddressVO> data	   =	dao.selectAddressByDong("역삼2동");
request.setAttribute("data1", data);
%>	
<c:forEach var="address" items="${data1}">
			${address.bunji}<hr>
			${address.zipCode}<hr>  <!-- 대소문자 구분 주의 -->
			${address.dong}<hr>	
			${address.gugun}<hr>
			${address.zipNum}<hr>								
</c:forEach>
</body>
</html>