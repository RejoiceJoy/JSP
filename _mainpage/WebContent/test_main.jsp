<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="main.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<!--크롬에서 실행-->
<head>
<meta charset="UTF-8">
<title>책 검색</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	function pushSearch() {
		$("#mainsearch").attr("method", "post");
		$("#mainsearch").attr("action", "./main.do").submit();
	}
</script>

</head>
<body>
	<form id = "mainsearch" action = "main.do" method = "post">
		<input type = "text" id = "mainkey" name = "mainkey" />
		<input type="submit" title="검색" >
	</form>
	<a onclick = "pushSearch();"><img src="resource/images/btn_search_white.png" alt="검색"></a>	
	<a href="javascript:pushSearch();"><img src="resource/images/btn_search_white.png" alt="검색"></a>



   
</body>
</html>