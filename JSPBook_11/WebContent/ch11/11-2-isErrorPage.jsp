<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="isErrorPage_error.jsp"%>
<html>
<head>
<title>Exception</title>
</head>
<body>
<!-- 결과 확인은 크롬 브라우져 362page -->
name 파라미터 : <%=request.getParameter("name").toUpperCase()%>
</body>
</html>