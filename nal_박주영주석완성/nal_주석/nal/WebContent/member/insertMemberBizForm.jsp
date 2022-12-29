<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="script/member.js">
</script>

<title>마이페이지>회원가입>회원정보입력</title>

	

<div class="wrap">
    <div class="inner">
        <!-- 왼쪽메뉴 -->
        <div class="leftMenu" id="subMenu">
            <ul class="side-menu">
                <li data-url="/loginForm.do, /snsLoginProc.do">
                    <a href="login.do">로그인</a>
                </li>
                <li data-url="/member/insertMemberForm1.do, /member/insertMemberForm2.do, /member/insertMemberForm3.do, /member/insertMemberForm4.do,
                                /member/insertMemberForm5.do, /member/insertMemberForm6.do, /member/selectMember.do, /member/insertMemberFormKid1.do, /member/insertMemberFormKid2.do">
                   <a href="selectMember.do">회원가입</a>  <!-- 14세미만 선택화면 20211026 -->
<!--                     <a href="/member/insertMemberForm1.do">회원가입</a> -->
                </li>
                <li data-url="/member/searchIdPwdForm.do, /member/searchPwdForm.do, /member/searchIdPwdProc.do, /member/searchIdPwdProc.do">
                    <a href="searchIdPwdForm.do">아이디/비밀번호 찾기</a>
                </li>


                <li data-url="/member/mobilePassForm.do, /member/studentPassForm.do, /member/insertPassForm.do, /member/mobileBizForm.do">
                    <a href="#">열람증</a>
                    <ul>
                        <li data-url="/member/mobilePassForm.do, /member/insertPassForm.do"><a href="/member/mobilePassForm.do">모바일 간편열람증</a></li>
<!--                         <li data-url="/member/studentPassForm.do"> -->
<!--                             <a href="/member/studentPassForm.do">학생증 시범사업</a> -->
<!--                         </li> -->
                    </ul>
                </li>

            </ul>
        </div><!-- //왼쪽메뉴 -->
    </div>
	


<!-- 휴대폰 인증 
<form name="sciCertForm" method="post" action="">
    <input type="hidden" name="id"       value = "SNAQ001" />
    <input type="hidden" name="srvNo"    value = "001001" />
    <input type="hidden" name="certGb"   value = "H" />
	<input type="hidden" name="retUrl"   value = "31https://www.nanet.go.kr/member/insertMemberBizForm.do" />
</form>
-->

<form id="memberVO" action="insertMemberBizForm.do" method="post" name="joinfrm">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script> -->
<script>
// 중복체크페이지를 새로운 창으로 띄우기 위한 함수
var count=0;
function idChk() {
	if (joinfrm.member_id.value == "") {
		alert('아이디를 입력하세요!');
		joinfrm.member_id.focus();
		return;
	}
	/* idchk.jsp 페이지는 idChk.do로 요청하면서 입력받은 회원 아이디를 서블릿에 보내 DB와 비교 */
	var url = "idchk.do?member_id=" + joinfrm.member_id.value;
	/* 아이디 중복 체크 페이지(idchk.jsp)를 새로운 창에 출력하기 위해 window객체의 open() 메소드 사용 */
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=340 height=370");

	count++;
}

//이메일 도메인
function checkEmail() {
		if (joinfrm.emailList.value != "") {
			joinfrm.member_email_domain.value = joinfrm.emailList.value;
		} else {
			joinfrm.member_email_domain.value = "";
			joinfrm.member_email_domain.focus();
		}
}

// 주소창
function doroAddressPopup() {
 	daum.postcode.load(function(){
    new daum.Postcode( {
        oncomplete : function(data) {  	
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullAddr = ''; // 최종 주소 변수
           var extraAddr = ''; // 조합형 주소 변수
           
           // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               fullAddr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if (data.userSelectedType === 'R') {
                //법정동명이 있을 경우 추가한다.
                if (data.bname !== '') {
                     extraAddr += data.bname;
                }

                // 건물명이 있을 경우 추가한다.
                if (data.buildingName !== '') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
            }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("zipCode").value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById("address").value = fullAddr;

             // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addressDetail').focus();		
			
        }
    }).open();
 	});
}

//회원정보 유효성 체크위한 함수 (insertMemberBizForm.jsp)
function joinChk() {
	if (joinfrm.member_id.value.length == 0) {
		alert("아이디를 입력하세요!");
		joinfrm.member_id.focus();
		return false;
	}
	// 아이디에는 영문 소문자와 숫자만 사용가능합니다.
	var pattern = /\s/g; // 공백체크 (탭, 스페이스)
	if (joinfrm.member_id.value.match(pattern)) {
		alert("아이디에는 영문 소문자와 숫자만 사용가능합니다.");
		joinfrm.member_id.focus();
		return false;
	}
	if (joinfrm.member_id.value.length < 4) {
		alert("아이디를 4~12자 사이로 입력하세요!");
		joinfrm.member_id.focus();
		return false;
	}
	// 아이디 중복 확인
	if (count==0) {
		alert("아이디 중복확인을 하세요!");
		joinfrm.member_id.focus();
		return false;
	}
	if (joinfrm.member_name.value.length == 0) {
		alert("이름을 입력하세요!");
		joinfrm.member_name.focus();
		return false;
	}
	if (joinfrm.member_birthdate.value == "") {
		alert("생년월일을 입력하세요!");
		joinfrm.member_birthdate.focus();
		return false;
	}
	if (joinfrm.member_pw.value == "") {
		alert("비밀번호를 입력하세요!");
		joinfrm.member_pw.focus();
		return false;
	}
	if (joinfrm.member_pw.value.length < 8 || joinfrm.member_pw.value.length > 20) {
		alert("8자리 ~ 20자리 이내로 입력해주세요.");
		joinfrm.member_pw.focus();
		return false;
	}
	// 영문, 숫자, 특수문자 중 2가지 이상 조합하여 8자리 ~ 20자리 이내의 암호 정규식 (2가지 조합)
	var reg = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,20}$/;
	if (joinfrm.member_pw.value.match(reg) == null) {
		alert("영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
		joinfrm.member_pw.focus();
		return false;
	}
	// 공백 입력
	if (joinfrm.member_pw.value.match(pattern)) {
		alert("비밀번호는 공백 없이 입력해주세요.");
		joinfrm.member_pw.focus();
		return false;
	}
	if (joinfrm.pwchk.value == "") {
		alert("비밀번호 확인을 입력하세요.");
		joinfrm.pwchk.focus();
		return false;
	}
	if (joinfrm.member_pw.value != joinfrm.pwchk.value) {
		alert("비밀번호와 확인 비밀번호가 다릅니다.");
		joinfrm.pwchk.focus();
		return false;
	}
	// 이메일
	//var email_reg = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	///^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if (joinfrm.member_email_id.value == "") {
		alert("이메일 사용자 아이디를 입력하세요!");
		joinfrm.member_email_id.focus();
    	return false;
	}
	if (joinfrm.member_email_domain.value == "") {
		alert("이메일 서비스 도메인을 입력하세요!");
		joinfrm.member_email_domain.focus();
    	return false;
	}
	
	//document.frm.member_email.value == document.frm.member_email_id.value+"@"+document.frm.member_email_domain.value;
	
	//$("#document.frm.member_email").val(document.frm.member_email); 
	/*if (document.frm.member_email.value.match(email_reg) == null) {
		alert("email : "+document.frm.member_email.value+"이메일 형식이 올바르지 않습니다.");
		return false;
	}*/
	
	if (joinfrm.phone2.value.length<3 || joinfrm.phone3.value.length!=4) {
		alert("연락처를 입력하세요!");
		return false;
	}
	
	return true;
}
</script>
	
	<div class="contentsContainer">
		<div class="subTitle">
			<div class="inner">
				<h2>마이페이지</h2>
				<div class="location">
					<ol>
						<li class="home"><img src="images/img/icon_home.png" alt="홈"/></li>
						<li>마이페이지</li>
						<li>회원가입</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="inner">
			<div class="contents" id="bodyWrap">
				<h3 class="title">회원가입</h3>

				<div class="subContents">
					<div class="body">
						<!-- 여기서부터 콘텐츠 s -->
						<div class="bodyBox01">
						<img src="images/bg/bg_membershipStep3.png" alt="STEP01 이용약관 동의 > STEP02 본인확인(실명인증) > STEP03 회원정보 입력  (현재 페이지) > STEP04 가입완료" style="width:100%;">
 						<br>
							<p class="membershipStepTxt" id="membershipStepTxt2" style="display:none;">본인확인</p>
							<div id="certification2" class="certificationWrap" style="display:none;">
								<div class="foreignerNumber">
									<div class="certificationSubWrap">
										<div class=certification_contentWrap>
											<div class="contentTxt_2line">휴대폰 인증</div>
											<div class="blueBtnN"><a href="javascript:sciCert();" title="새창열림">인증하기</a></div>
										</div>
									</div>
								</div>
							</div>

							<div class="membershipStep3 pcTable">
                        		<a href="/member/insertMemberForm3.do">
                        			<img src="images/bg/bg_membershipStep3.png" alt="STEP01 이용약관 동의 > STEP02 본인확인(실명인증) > STEP03 회원정보 입력  (현재 페이지) > STEP04 가입완료" style="width:100%;">
                        		</a>							
							</div>
							<div class="step0001 mobile">
								<img src="images/bg/bg_membershipStep3.png" alt="STEP01 이용약관 동의 > STEP02 본인확인(실명인증) > STEP03 회원정보 입력  (현재 페이지) > STEP04 가입완료" style="width:100%;">
<!--								<ul>
									<li class="stepList001">
										<div class="step01">이용약관 동의</div>
										<div class="down">단계1</div>
									</li>
									<li class="stepList002">
										<div class="step01">본인확인(실명인증)</div>
										<div class="down">단계2</div>
									</li>
									<li class="stepList003">
										<div class="step01 on">회원정보 입력</div>
										<div class="down">단계3</div>
									</li>
									<li class="stepList004">
										<div class="step01">가입완료</div>
										<div class="down">단계4</div>
									</li>
								</ul>
  -->								
							</div>
							<!-- <div class="textWrap">
                                <div class="conTxt"><p class="txt01">※ 쌍따옴표("), 홀따옴표('), 세미콜론(;), 느낌표(!) 등 특수문자는 사용하실 수 없습니다</p></div>
                            </div> -->

						</div><!-- //bodyBox01 -->
						
						
													<div class="infoTxt0009 overflowH">
								<h4 class="bgNo pL0 fl">기본정보 입력</h4>
								<div class="star fr">* <span class="color04">표시는 필수 입력사항 입니다.</span></div>
							</div>
							<div class="tableBox">
								<table class="normalTable table">
									<caption>개인정보수정 테이블로 아이디, 이름, 생년월일, 비밀번호, 비밀번호확인, 이메일, 주소, 연락처, 알림톡수신동의, 직업군으로 구성
									</caption>
									<colgroup>
										<col style="width:25%;"/>
										<col style="width:75%;"/>
									</colgroup>
									<tr>
										<th scope="row"><span class="star">*</span><span
												class="txt dB lh30 alignLeft pL10 fl"><label for="member_id">아이디</label></span></th>
										<td class="end">
											<div class="divDefine fl inputBoxDefine formRelateive">
												<span class="idInputBoxWrap">
												<input id="member_id" name="member_id" title="아이디입력란" type="text" value=""/>
												</span>
												<span class="fl pL10 dB btnInputBoxWrap">
												<input class="searchBtn wA padding" type="button" value="중복확인"
														onclick="return idChk()"  style="color:#fff;" title="새창열림" />											
														
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="star">*</span><span
												class="txt dB lh30 alignLeft pL10 fl"><label for="name">이름</label></span></th>
										<td class="end">
											<div class="divDefine fl inputBoxDefine idInputBoxWrap1">
												
													<input id="member_name" name="member_name" title="이름입력란" type="text" value=""/>
												
												
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="star">*</span><span
												class="txt dB lh30 alignLeft pL10 fl">
												
													생년월일

												</span>
												
												</th>
										<td class="end">
											<div class="overflowH ml10">
												<!-- 인증 했을 경우 -->
												
												<div class="divDefine fl inputBoxDefine idInputBoxWrap1">
													<input id="member_birthdate" name="member_birthdate" title="생년월일란" style="border: 0" type="text" value=""/>
														 YYYYMMDD 형태로 입력해주세요.
												</div>
												
												<!-- 인증 건너뛴 경우 -->
												
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="star">*</span><span
												class="txt dB lh30 alignLeft pL10 fl"><label for="password">비밀번호</label></span></th>
										<td class="end">
											<div class="divDefine fl inputBoxDefine idInputBoxWrap1">
												<input id="member_pw" name="member_pw" title="비밀번호입력란" type="password" value="" maxlength="20"/>
											</div>
											<div class="infoTxtWrap">8~20자의 비밀번호는 영문, 숫자, 특수문자 중 2종류 이상을 조합</div>
											<!-- 문자(<span class="txtred">#, %, ^, &, + 특수문자 제외</span>),  -->
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="star">*</span>
										<span class="txt dB lh30 alignLeft pL10 fl"><label for="enPassword">비밀번호 확인</label></span></th>
										<td class="end">
											<div class="divDefine fl inputBoxDefine idInputBoxWrap1">
												<input id="pwchk" name="pwchk" title="비밀번호확인입력란" type="password" value="" maxlength="20"/>
											</div>
											<div class="infoTxtWrap">비밀번호를 한번 더 입력하세요.</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="star">*</span><span
												class="txt dB lh30 alignLeft pL10 fl"><label for="email">이메일</label></span></th>
										<td class="end">
											<div class="emailBoxWrap">
												<span class="boxEmailEndInput">
												<input id="member_email" name="member_email_id" title="이메일 앞자리" type="text" size="20" maxlength="18" value=""/></span>
												<span class="boxEmailMool">@</span>
												<span class="boxEmailEndInput">
												<input id="member_email" name="member_email_domain" title="이메일 도메인" type="text" size="20" maxlength="18" value=""/></span>
												<!-- 웹접근성 처리 시작 -->
												<div id="selDiv">
									<span class="boxEmailEnd">
										<select id="emailList" name="emailList" title="이메일 도메인 선택"
												onchange="return checkEmail()"><!-- 웹접근성 처리 시작 -->
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
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
									</span>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span
												class="txt dB lh30 alignLeft pL10 fl"><label for="address">주소</label></span></th>
										<td class="end">
											<div class="fullBox">
								<span class="banBoxInput">			
									<input id="zipCode" name="zipCode" title="우편번호 입력란" readonly="readonly" type="text" value=""/>
								</span>
												<span class="blueBtn">
									<input id="joinaddress" type="button" value="주소검색" onclick="return doroAddressPopup()" title="새창열림"/>
								</span>
											</div>
											<div class="fullBox pt0">
											<input id="address" name="address" title="주소입력란" readonly="readonly" type="text" value=""/></div>
											<div class="fullBox pt0">
											<input id="addressDetail" name="addressDetail" title="나머지 주소입력란" type="text" value=""/></div>
											
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="star">*</span><span
												class="txt dB lh30 alignLeft pL10 fl"><label for="tel1">연락처</label></span></th>
										<td class="end">
											<div class="phoneBoxWrap">
										
											
								<span class="boxPhoneStart">
									<select id="phone1" name="phone1" title="연락처 앞자리 선택"
											>
											<option value="010">010</option>
											<option value="011"
													>011</option>
											<option value="016"
													>016</option>
											<option value="017"
													>017</option>
											<option value="018"
													>018</option>
											<option value="019"
													>019</option>
											<option value="02"
													>02</option>
											<option value="031"
													>031</option>
											<option value="032"
													>032</option>
											<option value="033"
													>033</option>
											<option value="041"
													>041</option>
											<option value="042"
													>042</option>
											<option value="043"
													>043</option>
											<option value="044"
													>044</option>
											<option value="051"
													>051</option>
											<option value="052"
													>052</option>
											<option value="053"
													>053</option>
											<option value="054"
													>054</option>
											<option value="055"
													>055</option>
											<option value="061"
													>061</option>
											<option value="062"
													>062</option>
											<option value="063"
													>063</option>
											<option value="064"
													>064</option>
									</select>
								</span>
												<span class="phoneMool">-</span>
												<span class="boxPhoneCenter">

									<input type="text" name="phone2" id="member_phone" title="핸드폰 중간자리" maxlength="4"
										   value=""
										   />
								</span>
												<span class="phoneMool">-</span>
												<span class="boxPhoneEnd">

									<input type="text" name="phone3" id="member_phone" maxlength="4" title="핸드폰 끝자리"
										   value=""
										   />
								</span>
											</div>
										</td>
									</tr>
									
								</table>
							</div>

							
					</div><!-- //body -->
					
 							<div class="joinbtn" style="display: flex; justify-content: center;">
									<input type="submit" value="   확인   " onclick="return joinChk()">
									<input type="button" value="   취소   " onclick="location.href='index.jsp' ">
							
<!-- 								<ul class="m_mb10"> -->
<!--  									<li class="mr10"><a href="javascript:joinChk();">확인</a></li> -->
<!-- 									<li><a href="/main.do">취소</a></li> -->
<!-- 								</ul> -->
 							</div>
							<!-- 여기까지 콘텐츠 e -->
												
				</div><!-- //contentBody -->
			</div>
		</div>
	</div>

</form>


    <script type='text/javascript' src="/js/bs_trk.js"></script>

<script type="text/javascript" defer='defer'>/* CLICKZONE SCRIPT V.V.4 *//*X*//* COPYRIGHT 2002-2017 BIZSPRING INC. *//*X*//* DO NOT MODIFY THIS SCRIPT. *//*X*/


    var _CZN = "29"; //운영서버 : 10

</script>
<script type='text/javascript' defer="defer" src="https://webstat.nanet.go.kr/InsightTrk/js/InsightClickZone.js"></script>
<!-- [end] 접속 로그 -->



<form name="footerForm" method="post">
    <input type="hidden" name="deviceType" value="mob"/>
</form>


<%@ include file="../footer.jsp" %>   