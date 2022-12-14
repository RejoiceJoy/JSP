<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>

<article>
<h1>로그인 성공</h1>	
${workerId}<hr>
<h4 style="color:red">${message}</h4>
<a href="NonageServlet?command=admin_logout">로그 아웃</a>
</article>

<%@ include file="/admin/footer.jsp"%>
</body>
</html>