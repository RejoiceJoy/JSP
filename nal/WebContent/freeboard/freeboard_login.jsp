<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_nal_copy 로그인</title>
</head>
<body>
	<% session.setAttribute("loginUser", "member01");
	%>
	<h1 class="title"><a href="http://localhost:8080/_nal/freeBoardList.do">글쓰려고 로그인하기!!</a></h1>
</body>
</html>