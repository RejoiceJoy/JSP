<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%
		int a = 10;
		int b = 20;
		int c = 30;
	%>
	<%=a + b + c%>
	<h1> <%= a + b + c %> </h1>
	<a href="<%= a + b + c %>"> 20 </a>
</body>
</html>