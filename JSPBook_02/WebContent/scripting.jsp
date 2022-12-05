<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2> Sripting Tag</h2>
<!--JSP 선언문  : 값을 만들거나 function 만들때 씀. 보통은 원래 있는거 씀.-->
<%! int count=3;
	String makeItLower(String data){
	return data.toLowerCase();
	}
%>
<!--스트립틀릿  -->
<%
for( int i =1; i <= count ; i++){
	out.println("Java Server Pages " + i + ". <br>");	//out : 내장 객체> 브라우저에 출력
}//end for
%>

</body>
</html>