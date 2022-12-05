<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>Welcome</title>
</head>
<body>
	<h1>Hello JSP!!</h1>
	Hello! Java Server Pages.
	<P>  The time on the server is 
	<%= java.time.LocalDate.now() %> </P>
</body>
</html>