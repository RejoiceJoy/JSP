<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%!int data = 50;%>
	<%
		out.println("Value of the variable is:" + data);
	%>
</body>
</html>