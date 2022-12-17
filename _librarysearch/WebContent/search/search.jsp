<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="book.*"%>
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
	$(function() {
		$("#showbookinfo").click(function() {
			$.ajax({
				type:"post",	//post 방식으로 전송
				async:false,	//동기식으로 처리
				url:"${contextPath}/search",			//전송할 서블릿 지정
				success:function (data, textStatus){	//전송과 응답이 성공했을 경우 작업 설정
					var jsoninfo = JSON.parse(data);	//서블릿에서 가져온 데이터를 받음
					var bookinfo = "책 정보<br>";
					bookinfo += "================<br>";
					for(var i in jasoninfo.books) {
						bookinfo += "제목: " + jsoninfo.books[i].book_title + "<br>";
						bookinfo += "작가: " + jsoninfo.books[i].author + "<br>";
						bookinfo += "출판사: " + jsoninfo.books[i].publishing + "<br>";
						bookinfo += "서가위치: " + jsoninfo.books[i].room_name + "<br>";
						bookinfo += "분류 기호: " + jsoninfo.books[i].book_sorting + "<br>";
						bookinfo += "모양: " + jsoninfo.books[i].shape + "<br>";
						bookinfo += "isbn: " + jsoninfo.books[i].isbn + "<br><br><br>";
					} //end for
					$("#output").html(bookinfo);
				}, //end success function
				error: function (data, textStatus) {
					alert("에러가 발생했습니다.");
				}//end error
			}); //end ajax
		});//end showbookinfo function
	});//end function
</script>
</head>
<body>
	<a id="showbookinfo" style = "cursor:pointer">책 정보 보기</a><br><br>
	<div id="output"></div>

 <%
	BookDAO bookDAO = BookDAO.getInstance();
	bookDAO.showbookinfo();
%>
<%= bookDAO.showBookTitle() %> 

</body>
</html>