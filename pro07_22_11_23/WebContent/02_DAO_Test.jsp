<%@page import="java.util.*"%>
<%@page import="sec02.ex02.MemberDAO"%>
<%@page import="sec02.ex02.*"%>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*"%>

<%
  Connection con=null;
  try{	
	  MemberDAO  dao= new MemberDAO();
	 
	  List<MemberVO> list = dao.listMembers();
	  
	  for(MemberVO i : list)		  
	  {
		  out.println(i.getName());
	  }//end for
	  
		out.println("제대로 연결되었습니다.");
	}catch(Exception e){ 
		e.printStackTrace();
		out.println("연결에 실패하였습니다.");
	}
%>
