<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>마이페이지>회원가입>본인확인(실명인증)</title>
	

<script type="text/javascript">

    $(function(){
        fnCurrentMenuCheck();
    });

    function ipck(){
        window.open("/main/ipChkPopup.do","acDbipPopup","width=336, height=250, scrollbars=0, resizable=0");
        //푸터쪽 관련사이트 컨트롤러
    }

</script>

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
	













<script>
	$(document).ready(function () {
	
	});
	
	function Initialize(){
		document.getElementById("ContentBody").focus();
	}
	
	//휴대폰 인증
	function sciCert(){
		// 휴대폰 인증 팝업창 호출
		var sci_window=window.open('','sciCertWindow', 'width=430, height=560, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200' );
		
		if(sci_window == null){
			alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
		}
		document.sciCertForm.action = 'https://www.nanet.go.kr/member/sciCertPopup.do';// 가상식별 실명확인서비스 URL
		document.sciCertForm.target = 'sciCertWindow';
		document.sciCertForm.submit();
	}
	
	//실명인증
	function openCBAWindow(){
		var CBA_window = window.open('', 'IPINWindow', 'width=455, height=555, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200' );

		if(CBA_window == null){ 
			alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
		}
		document.sciCertIpinForm.action = 'https://www.nanet.go.kr/member/sciCertIpinPopup.do';
		document.sciCertIpinForm.target = 'IPINWindow';
		document.sciCertIpinForm.submit();
	}
	
	function resultPage(param) {
		$("#retInfo").val(param);
		$("#memberVO").attr("action", "/member/insertMemberIpinForm.do").submit();
	}
	
</script>
<form name="sciCertForm" method="post" action="">
    <input type="hidden" name="id"       value = "SNAQ001" />
    <input type="hidden" name="srvNo"    value = "001001" />
    <input type="hidden" name="certGb"   value = "H" />
	<input type="hidden" name="retUrl"   value = "31https://www.nanet.go.kr/member/insertMemberBizForm.do" /> 
</form>

<form name="sciCertIpinForm" method="post" action="">
    <input type="hidden" name="id"       value = "NAQ002" />
    <input type="hidden" name="srvNo"   value = "001002" />
	<input type="hidden" name="retUrl"   value = "23https://www.nanet.go.kr/member/sciCertIpinResult.do" /> 
</form>
<form id="memberVO" action="/member/insertMemberForm2.do" method="post">
	<input type="hidden" name="retInfo"    id="retInfo"   value = "" />
</form>


<form action="insertMemberForm2.do" method="get" name="frm">
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
							<img src="images/bg/bg_membershipStep2.png" alt="STEP01 이용약관 동의 > STEP02 본인확인(실명인증)(현재 페이지) > STEP03 회원정보 입력 > STEP04 가입완료" style="width:100%;">
							<br>
						<div class="membershipStep2 pcTable">
                        <a href="insertMemberForm2.do">
                        	<img src="images/bg/bg_membershipStep2.png" alt="STEP01 이용약관 동의 > STEP02 본인확인(실명인증)(현재 페이지) > STEP03 회원정보 입력 > STEP04 가입완료" style="width:100%;">
                        </a>						
						</div>
						
						<div class="step0001 mobile">
							<img src="images/bg/bg_membershipStep2.png" alt="STEP01 이용약관 동의 > STEP02 본인확인(실명인증)(현재 페이지) > STEP03 회원정보 입력 > STEP04 가입완료" style="width:100%;">
						
<!--						<ul>
								<li class="stepList001">
									<div class="step01">이용약관 동의</div>
									<div class="down">단계1</div>
								</li>
								<li class="stepList002">
									<div class="step01 on">본인확인(실명인증)</div>
									<div class="down">단계2</div>
								</li>
								<li class="stepList003">
									<div class="step01">회원정보 입력</div>
									<div class="down">단계3</div>
								</li>
								<li class="stepList004">
									<div class="step01">가입완료</div>
									<div class="down">단계4</div>
								</li>
							</ul>
  -->							
						</div>

						<!-- 여기까지 콘텐츠 e -->
					</div>
					
						<p class="membershipStepTxt">본인확인(실명인증)</p>
						<div class="loginNemoBox">
							<div class="login03">
								<div class="loginNextRuning" style="border-right: 1px solid #ccc;">
									<div class="blueBtnN1"><a href="insertMemberBizForm.do" title="새창열림">휴대폰 인증하기</a></div>
								</div>
							</div>
							<div class="login03">
								<div class="loginNextRuning">
									<div class="blueBtnN1"><a href="insertMemberBizForm.do" title="새창열림">아이핀 인증하기</a></div><!-- /member/insertMemberForm3.do -->
								</div>
							</div>
						</div>
											
				</div>
			</div>
		</div>
	</div>
</div>
</form>
	





<!-- [start] 접속 로그 -->
<script type="text/javascript">

    //컨텐츠 경로 구분 값(전체페이지 공통)
    var _TRK_CP = "";
    var TEXT = "";
    $('.location li').each(function(index, item){
        if(index > 0){
            if(window.location.href.indexOf('monthLibView.do') > -1){
                TEXT = '월간 국회도서관';
            }else{
                TEXT = $(item).find('a').text();
            }
            _TRK_CP += "^"+TEXT;
        }
    });






    



    // 연령 추출
    function getAges(birthday){
        var ages = new Date().getFullYear() - Number(birthday.substr(0,4)) + 1;

        if(ages <= 9){
            return "A";
        }else if(ages <= 19){
            return "B";
        }else if(ages <= 29){
            return "C";
        }else if(ages <= 39){
            return "D";
        }else if(ages <= 49){
            return "E";
        }else if(ages <= 59){
            return "F";
        }else if(ages <= 69){
            return "G";
        }else if(ages >= 70){
            return "H";
        }else{
            return "";
        }
    }
</script>


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