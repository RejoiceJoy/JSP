<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="main.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="java.util.*"%>
<% 
	ArrayList<BookVO> infoArr = (ArrayList) request.getAttribute("infoArr");
	int count = (int)request.getAttribute("count");
	
%>




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
			var putkeyword = $("#putkeyword").val();
			if(putkeyword == '') {
				alert("검색어를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"post",	//post 방식으로 전송
				async:false,	//동기식으로 처리
				url:"${contextPath}/search.do",			//전송할 서블릿 지정
				data: {keyword: putkeyword},
				success:function (data, textStatus){	//전송과 응답이 성공했을 경우 작업 설정
					console.log(data);
					var jsoninfo = JSON.parse(data);	//서블릿에서 가져온 데이터를 받음
					var bookinfo = "<ol>";
					for(var i in jsoninfo.books) {
						bookinfo += "<li><fieldset><p><h4>";
						bookinfo += jsoninfo.books[i].book_title + "/";
						bookinfo += jsoninfo.books[i].author + "</h4></p><p>";
						bookinfo += jsoninfo.books[i].publishing + " | ";
						bookinfo += jsoninfo.books[i].room_name + " | ";
						bookinfo += jsoninfo.books[i].book_sorting + " | ";
						bookinfo += jsoninfo.books[i].shape + " | ";
						bookinfo += jsoninfo.books[i].isbn + "</p></fieldset></li>";
					} //end for
					bookinfo += "</ol>"
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
	<input type = "text" id = "putkeyword" />
	<a id="showbookinfo" style = "cursor:pointer">검색</a><br><br>
	<div id="output">
	
		<c:choose>
			<c:when test="${(count == 0) && (infoArr==null)}">
				<tr>
					<td>책이 없습니다.</td>					
				</tr>
			</c:when>
			<c:when test="${(count == 0) && (infoArr != null)}">
				<ol>
				<c:forEach var="list" items="${infoArr}">
					
					<li><fieldset><p><h4>
						${list.book_title} / 
				<%-- 		<td><a href="./BoardViewAction.do?articleno=${list.articleno}&pagenum=<%=pagenum%>">${list.title}</a></td> --%>
						${list.author}</h4></p>
						<p>${list.publishing} |
						${list.room_name}</p></fieldset></li>
					
									
				</c:forEach>
				</ol>				
			</c:when>
			

			
		</c:choose>
	
	</div>
</body>
</html>