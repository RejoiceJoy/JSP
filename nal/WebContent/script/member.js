// login.jsp
//function loginCheck() {
//		/* 아이디 입력상자 : 이름이 loginfrm인 폼 태그 내부에 존재 */
//		if (document.loginfrm.member_id.value.length == 0) {
//			alert("아이디를 입력하세요!")
// 			document.loginfrm.member_id.focus();
// 			return false;
// 		}
//		
// 		if (document.loginfrm.member_pw.value == "") {
// 			alert("비밀번호를 입력하세요!")
// 			document.loginfrm.member_pw.focus();
// 			return false;
// 		}
// 		return true;
//}

//// 중복체크페이지를 새로운 창으로 띄우기 위한 함수 (insertMemberBizForm.jsp)
//var count=0;
//function idChk() {
//	if (document.frm.member_id.value == "") {
//		alert('아이디를 입력하세요!');
//		document.frm.member_id.focus();
//		return;
//	}
//	/* idchk.jsp 페이지는 idChk.do로 요청하면서 입력받은 회원 아이디를 서블릿에 보내 DB와 비교 */
//	var url = "idchk.do?member_id=" + document.frm.member_id.value;
//	/* 아이디 중복 체크 페이지(idchk.jsp)를 새로운 창에 출력하기 위해 window객체의 open() 메소드 사용 */
//	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450 height=200");
//
//	count++;
//}

//아이디 중복체크 완료 처리를 위한 함수 (idchk.jsp)
function idok() {



//	opener.frm.member_id.value=getElementById("member_id").value;
//	opener.frm.reid.value=getElementById("member_id").value;

	// opener : 창을 열어준 부모창(회원가입 폼)
	/* 회원가입 폼의 아이디 입력란에 중복체크가 끝난 아이디값을 부여 */
//	opener.frm.member_id.value="${member_id}";
	/* reid : 중복체크과정 거쳤는지 확인 위해 회원가입 폼에서 만들어 둔 히든 태그 */
//	opener.frm.reid.value="${member_id}";
	self.close();
}

//// 이메일 도메인 (insertMemberBizForm.jsp)
//function checkEmail() {
//		if (document.frm.emailList.value != "") {
//			document.frm.member_email_domain.value = document.frm.emailList.value;
//		} else {
//			document.frm.member_email_domain.value = "";
//			document.frm.member_email_domain.focus();
//		}
//	}

////회원정보 유효성 체크위한 함수 (insertMemberBizForm.jsp)
//function joinChk() {
//	if (document.frm.member_name.value.length == 0) {
//		alert("이름을 입력하세요!");
//		frm.member_name.focus();
//		return false;
//	}
//	if (document.frm.member_id.value.length == 0) {
//		alert("아이디를 입력하세요!");
//		frm.member_id.focus();
//		return false;
//	}
//	// 아이디에는 영문 소문자와 숫자만 사용가능합니다.
//	var pattern = /\s/g; // 공백체크 (탭, 스페이스)
//	if (document.frm.member_id.value.match(pattern)) {
//		alert("아이디에는 영문 소문자와 숫자만 사용가능합니다.");
//		frm.member_id.focus();
//		return false;
//	}
//	if (document.frm.member_id.value.length < 4) {
//		alert("아이디를 4~12자 사이로 입력하세요!");
//		frm.member_id.focus();
//		return false;
//	}
//	// 아이디 중복 확인
//	if (count==0) {
//		alert("아이디 중복확인을 하세요!");
//		frm.member_id.focus();
//		return false;
//	}
//	if (document.frm.member_pw.value == "") {
//		alert("비밀번호를 입력하세요!");
//		frm.member_pw.focus();
//		return false;
//	}
//	if (document.frm.member_pw.value.length < 8 || document.frm.member_pw.value.length > 20) {
//		alert("8자리 ~ 20자리 이내로 입력해주세요.");
//		frm.member_pw.focus();
//		return false;
//	}
//	// 영문, 숫자, 특수문자 중 2가지 이상 조합하여 8자리 ~ 20자리 이내의 암호 정규식 (2가지 조합)
//	var reg = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,20}$/;
//	if (document.frm.member_pw.value.match(reg) == null) {
//		alert("영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
//		frm.member_pw.focus();
//		return false;
//	}
//	// 공백 입력
//	if (document.frm.member_pw.value.match(pattern)) {
//		alert("비밀번호는 공백 없이 입력해주세요.");
//		frm.member_pw.focus();
//		return false;
//	}
//	if (document.frm.member_pw.value == "") {
//		alert("비밀번호 확인을 입력하세요.");
//		frm.member_pw.focus();
//		return false;
//	}
//	if (document.frm.member_pw.value != document.frm.pwchk.value) {
//		alert("비밀번호와 확인 비밀번호가 다릅니다.");
//		frm.member_pw.focus();
//		return false;
//	}
//	// 이메일
//	//var email_reg = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
//	///^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//	
//	if (document.frm.member_email_id.value == "") {
//		alert("이메일 사용자 아이디를 입력하세요!");
//		frm.member_email_id.focus();
//    	return false;
//	}
//	if (document.frm.member_email_domain.value == "") {
//		alert("이메일 서비스 도메인을 입력하세요!");
//		frm.member_email_domain.focus();
//    	return false;
//	}
//	
//	//document.frm.member_email.value == document.frm.member_email_id.value+"@"+document.frm.member_email_domain.value;
//	
//	//$("#document.frm.member_email").val(document.frm.member_email); 
//	/*if (document.frm.member_email.value.match(email_reg) == null) {
//		alert("email : "+document.frm.member_email.value+"이메일 형식이 올바르지 않습니다.");
//		return false;
//	}*/
//	
//	if (document.frm.phone2.value.length<3 || document.frm.phone3.value.length!=4) {
//		alert("연락처를 입력하세요!");
//		return false;
//	}
//	return true;
//}

