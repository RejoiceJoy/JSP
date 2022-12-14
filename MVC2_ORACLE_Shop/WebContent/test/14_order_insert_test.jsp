
<%@page import="com.nonage.dao.OrderDAO"%>
<%@page import="com.nonage.dto.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nonage.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%

CartDAO cartDAO = CartDAO.getInstance();
ArrayList<CartVO> cartList = cartDAO.listCart("one");
OrderDAO orderDAO = OrderDAO.getInstance();      
int maxOseq = orderDAO.insertOrder(cartList, "one");
out.println("cart table 과 cart Detail 테이블 입력");
%>
</body></html>