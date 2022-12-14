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
	CartVO cartVO = new  CartVO();	
	
	  cartVO.setId("one"); //김나리
	  cartVO.setPseq(2); //롱부츠
      cartVO.setQuantity(2);
    
	  dao.insertCart(cartVO);
	  out.print("입력완료");
%>
</body></html>