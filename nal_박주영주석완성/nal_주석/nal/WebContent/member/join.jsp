<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지>회원가입</title>
<!-- 입력 폼을 수행하기 위함 >> joinChk(), idChk() 함수가 member.js에 정의됨 -->
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
<h2>회원 가입</h2>
*표시는 필수 입력사항 입니다.
	<!-- aciton 속성 값이 "join.do"이기 때문에 <확인>버튼 클릭 시 "join.do" 요청 -->
	<form action="join.do" method="post" name="frm">
		<table>
			<tr>
				<td>* 아이디    </td>
				<td>
					<input type="text" name="member_id" size="20">
					<!-- <input type="hidden" name="reid" size="20">  -->
					<!-- unique 제약조건이 걸린 id 중복확인을 위해 idChk() 함수 호출 -->
					<input type="button" value="중복확인" onclick="idChk()">
				</td>
			</tr>
			<tr>
				<td>* 이름     </td>
				<td><input type="text" name="member_name" size="20"></td>
			</tr>
			<tr>
				<td>* 생년월일   </td>
				<td><input type="text" name="member_birthdate" size="20"></td>
				<td> 생년월일 YYYYMMDD 형태로 입력해주세요</td>
			</tr>
			<tr>
				<td>* 비밀번호   </td>
				<td><input type="password" name="member_pw" size="20"></td>
				<td> 8~20자의 비밀번호는 영문,숫자,특수문자 중 2종류 이상을 조합</td>
			</tr>
			<tr>
				<td width="80">* 비밀번호 확인</td>
				<td><input type="password" name="pwchk" size="20"></td>
				<td> 비밀번호를 한번 더 입력하세요.
			</tr>
			<tr>
				<td>* 이메일    </td>
				<td>
				<input type="text" name="member_email_id" id="member_email" size="20" maxlength="18"> @
				<input type="text" name="member_email_domain" id="member_email" size="20" maxlength="18">
				<select name="emailList" onchange="return checkEmail()">
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="lycos.co.kr">lycos.co.kr</option>
					<option value="korea.com">korea.com</option>
					<option value="empal.com">empal.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option>
					<option value="yahoo.com">yahoo.com</option>
					<option value="ymail.com">ymail.com</option>
					<option value="live.com">live.com</option>
					<option value="aol.com">aol.com</option>
					<option value="msn.com">msn.com</option>
					<option value="me.com">me.com</option>
					<option value="icloud.com">icloud.com</option>
					<option value="rocketmail.com">rocketmail.com</option>
					<option value="qq.com">qq.com</option>
					<option value="link.com">link.com</option>
				</select>
				<!--  <input type="hidden" name="member_email" value="">-->
				</td>
			</tr>
			<tr>
				<td>* 연락처    </td>
				<td>
				<input type="text" name="phone1" id="member_phone" size="10" maxlength="3" value="010"> -
				<input type="text" name="phone2" id="member_phone" size="10" maxlength="4"> -
				<input type="text" name="phone3" id="member_phone" size="10" maxlength="4">
				</td>
				<!--  <td><input type="text" name="member_phone" size="20"></td>-->
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="확인" onclick="return joinChk()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소">
				</td>
			</tr>
			<tr><td colspan="2">${message }</td></tr>
		</table>
	</form>
</body>
</html>