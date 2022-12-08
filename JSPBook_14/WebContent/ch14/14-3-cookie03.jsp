<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();

		for (int i = 0; i < cookies.length; i++) {
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}//end for
		response.sendRedirect("14-2-cookie02.jsp");
	%>
</body>
</html>