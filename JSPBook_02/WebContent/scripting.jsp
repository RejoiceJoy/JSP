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
<!--JSP ����  : ���� ����ų� function ���鶧 ��. ������ ���� �ִ°� ��.-->
<%! int count=3;
	String makeItLower(String data){
	return data.toLowerCase();
	}
%>
<!--��Ʈ��Ʋ��  -->
<%
for( int i =1; i <= count ; i++){
	out.println("Java Server Pages " + i + ". <br>");	//out : ���� ��ü> �������� ���
}//end for
%>

</body>
</html>