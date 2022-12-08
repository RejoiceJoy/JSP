<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>


<!-- 이클립스 server 폴더에  context.xml 내용확인-->
<%
  Connection con=null;
 PreparedStatement pstmt;
 DataSource dataFactory;
  try{	
	  
	  Context ctx = new InitialContext();
		Context envContext = (Context) ctx.lookup("java:/comp/env");
		dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		System.out.println(" JDBC Data Sources JNDI Resource Factory");
	
		out.println("제대로 DBCP 연결되었습니다.");
	}catch(Exception e){ 
		e.printStackTrace();
		out.println("연결에 실패하였습니다.");
	}
%>
