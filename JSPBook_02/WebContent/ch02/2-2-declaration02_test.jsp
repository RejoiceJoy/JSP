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
	//μ£Όμ
	out.print("μλ?");
	%>
	<br>
	<%
		out.println("2 + 3 = " + sum(2, 3));
	%>
</body>
</html>