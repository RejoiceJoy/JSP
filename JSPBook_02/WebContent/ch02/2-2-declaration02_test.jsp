<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%!int sum(int a, int b) {
		return a + b;
	}%>
	<%
	//주석
	out.print("안녕?");
	%>
	<br>
	<%
		out.println("2 + 3 = " + sum(2, 3));
	%>
</body>
</html>