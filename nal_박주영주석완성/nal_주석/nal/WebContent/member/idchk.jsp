<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중복체크 팝업</title>
<link href="css1/popup.css" rel="stylesheet">
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
<form action="idchk.do" method="get" name="frm">
	<h4 class="popTit">아이디 중복확인</h4>
	<!--아이디 <input type=text name="member_id">
			 <중복체크> 버튼 클릭 시 idChk.do가 요청되어 다시 아이디 중복체크 진행 
			<input type=submit value="중복체크"> -->
		<!-- 서블릿에서 넘겨준 result 값이 1일 경우 중복된 아이디 존재 -->
		<c:if test="${result == 1 }">
			<script type="text/javascript">
				//<!-- 회원가입 폼에서 입력받은 ID 지움 -->
				opener.document.joinfrm.member_id.value="";
			</script>
		
			<div class="idcheckTxt">
				<div class="idcheckTxtInfo">
					입력하신 아이디(
					<span class="blue bold">${member_id}</span>
					)는 이미 사용중입니다. 다른 아이디를 입력하세요!
				</div>	
			</div>
			<div class="pop_idcheckBtn">
				<input type="button" value="확인" class="cancel" onclick="idok()">
			</div>	
		
		</c:if>
		
		<!-- 서블릿에서 넘겨준 result 값이 -1인 경우 중복된 아이디가 없음 -->
		<c:if test="${result == -1 }">
			<div class="idcheckTxt">
				<div class="idcheckTxtInfo">
					입력하신 아이디(
					<span class="blue bold">${member_id}</span>
					)는 사용이 가능합니다. 아래의 확인 버튼을 누르세요!
				</div>
			</div>
			<!-- <사용>버튼이 클릭되면 자바스크립트 함수 idok() 호출 -->
			<div class="pop_idcheckBtn">
				<input type="button" value="확인" class="cancel" onclick="idok()">
			</div>		
		</c:if>
</form>
</body>
</html>