<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>마이페이지>회원가입>이용약관동의</title>
	

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
                <li data-url="/login.do, /snsLoginProc.do">
                    <a href="login.do">로그인</a>
                </li>
                <li data-url="/member/insertMemberForm1.do, /member/insertMemberForm2.do, /member/insertMemberForm3.do, /member/insertMemberForm4.do,
                                /member/insertMemberForm5.do, /member/insertMemberForm6.do, /member/selectMember.do, /member/insertMemberFormKid1.do, /member/insertMemberFormKid2.do">
                   <a href="selectMember.do">회원가입</a>  <!-- 14세미만 선택화면 20211026 -->
<!--                     <a href="/insertMemberForm1.do">회원가입</a> -->
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
	













<script type="text/javascript">
//<![CDATA[
   $(document).ready(function () {
	   
		$('#yakanOK').click(function(){
			if($("#yakanOK").is(":checked")){
				$("#yakanOK").prop("checked", true);
			}else{
				$("#yakanOK").prop("checked", false);
			}
		});	   
   });
   
   function memberYakwanCk(){
	   if($("#yakanOK").is(":checked")){
		   location.href="/member/insertMemberForm2.do";
	   }else{
		   alert("이용약관에 동의합니다를 체크하세요!");
	   }
   }
           
//]]>           
</script>


<form action="insertMemberForm1.do" method="get" name="frm">
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
						<img src="images/bg/bg_membershipStep.png" alt="STEP01 이용약관 동의  (현재 페이지) > STEP02 본인확인(실명인증) > STEP03 회원정보 입력  > STEP04 가입완료" style="width:100%;">
						<br>
                        <div class="membershipStep pcTable">
                        <a href="insertMemberForm1.do">
                        	<img src="images/bg/bg_membershipStep.png" alt="STEP01 이용약관 동의  (현재 페이지) > STEP02 본인확인(실명인증) > STEP03 회원정보 입력  > STEP04 가입완료" style="width:100%;">
                        	
                        	                        </a>
<!--                             <ul> -->
<!--                                 <li class="stepList01"> -->
<!--                                     <div class="step01">STEP01</div> -->
<!--                                     <div class="stepTxt">이용약관 동의(현재페이지)</div> -->
<!--                                 </li> -->
<!--                                 <li class="stepList02"> -->
<!--                                     <div class="step01">STEP02</div> -->
<!--                                     <div class="stepTxt">본인확인(실명인증)</div> -->
<!--                                 </li> -->
<!--                                 <li class="stepList03"> -->
<!--                                     <div class="step01">STEP03</div> -->
<!--                                     <div class="stepTxt">회원정보 입력</div> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <div class="step01">STEP04</div> -->
<!--                                     <div class="stepTxt">가입완료</div> -->
<!--                                 </li> -->
<!--                             </ul>                           -->
                        </div>
                        <div class="step0001 mobile">                                             	
	                     <ul>
                                <li class="stepList001">
                                    <div class="step01 on">이용약관 동의</div>
                                    <div class="down">단계1</div>
                                </li>
                                <li class="stepList002">
                                    <div class="step01">본인확인(실명인증)</div>
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
    
                        </div>
                        <p class="membershipStepTxt">이용약관 확인</p>
                        <div class="yakan" tabindex="0">
                            <p class="yakanTxt yakanTxt01">국회도서관 정보시스템 이용약관</p>
                            <p class="yakanTxt yakanTxt02">제1장 총칙</p>
                            <p class="yakanTxt yakanTxt03">제1조(목적)</p>
                            <p class="yakanTxt yakanTxt04">① 국회도서관 정보시스템 이용약관(이하 "본 약관"이라 합니다)은 이용자가 국회도서관(이하 "도서관"이라
                                합니다)에서 제공하는 서비스를 이용함에 있어 도서관과 이용자의 권리, 의무, 책임사항과 그 밖에 필요한 사항을 규정함을 목적으로 합니다.</p>

                            <p class="yakanTxt yakanTxt02">제2조(정의)</p>
                            <p class="yakanTxt yakanTxt04">① 본 약관에서 사용하는 용어의 뜻은 다음과 같습니다.</p>
                            <p class="yakanTxt yakanTxt04">1. "정보시스템"이란 국회도서관홈페이지, 국회부산도서관 홈페이지, 국회전자도서관 등 도서관에서 서비스하는 시스템을 말합니다.</p>
                            <p class="yakanTxt yakanTxt04">2. "이용자"란 도서관 정보시스템에 접속하여 본 약관에 따라 도서관이 제공하는 서비스를 이용하는 회원 및
                                비회원을 말합니다.</p>
                            <p class="yakanTxt yakanTxt04">3. "회원"이란 도서관 정보시스템의 가입 신청 절차에 따라 회원가입을 한 이용자로서 도서관에서 제공하는
                                자료와 서비스를 이용할 수 있는 사람을 말합니다.</p>
                            <p class="yakanTxt yakanTxt04">4. "본인확인"이란 도서관이 제공하는 서비스 이용을 위하여 개인인증을 통하여 본인임을 확인하는 것을
                                말합니다.</p>
                            <p class="yakanTxt yakanTxt04">② 본 약관에서 사용하는 용어 중 제1항에서 정의하지 않은 용어는 관계 법령 및 정보시스템 안내에서 정하는
                                바에 따르며, 그 외에는 일반 관례에 따릅니다.</p>

                            <p class="yakanTxt yakanTxt02">제3조(약관의 효력 및 변경)</p>
                            <p class="yakanTxt yakanTxt04">① 본 약관은 도서관 정보시스템을 통해 게시하거나 기타의 방법으로 공지함으로써 이용자에게 공시하고, 본 약관에
                                동의한 이용자가 회원에 가입함으로써 효력이 발생합니다. 도서관의 서비스 제공 행위 및 이용자의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.</p>
                            <p class="yakanTxt yakanTxt04">② 도서관은 필요한 경우 관련 법령에 위배되지 않는 범위 안에서 본 약관을 변경할 수 있으며, 변경된 약관은
                                도서관 정보시스템에 공지함으로써 이용자가 확인할 수 있도록 합니다.</p>
                            <p class="yakanTxt yakanTxt04">③ 회원은 변경된 약관에 동의하지 아니하는 경우 회원을 탈퇴할 수 있으며, 명시적으로 거부의 의사표시를 하지
                                아니하고 계속 사용하는 경우에는 약관 변경에 동의한 것으로 봅니다.</p>
                            <p class="yakanTxt yakanTxt04">④ 본 약관에 명시되지 않은 사항에 관하여는 「전기통신기본법」, 「전기통신사업법」, 「정보통신망 이용촉진 및
                                정보보호 등에 관한 법률」및 「개인정보 보호법」 등 관련 법령의 규정에 따릅니다.</p>

                            <p class="yakanTxt yakanTxt02">제2장 서비스 제공 및 이용</p>

                            <p class="yakanTxt yakanTxt03">제4조(회원 가입)</p>
                            <p class="yakanTxt yakanTxt04">이용자는 도서관 정보시스템의 회원 가입 신청 절차에 따라 본 약관의 동의(14세 미만인 경우 법정 대리인의 동의), 본인확인 및 개인정보를 기재함으로써
                                회원에 가입합니다. 단, 국회부산도서관에서 제공하는 특정 서비스를 이용하기 위해서는 국회부산도서관 방문 인증이 필요합니다.</p>

                            <p class="yakanTxt yakanTxt02">제5조(회원 탈퇴 및 자격 상실 등)</p>
                            <p class="yakanTxt yakanTxt04">① 회원은 언제든지 회원을 탈퇴할 수 있으며, 도서관은 지체 없이 회원 탈퇴를 처리하고 해당 개인정보를
                                파기합니다. 단, 국회부산도서관의 자료를 관외 대출 중인 경우, 자료를 반납 한 후 회원 탈퇴를 할 수 있습니다.</p>
                            <p class="yakanTxt yakanTxt04">② 다음 각 호의 어느 하나에 해당하는 경우 도서관은 이용자의 회원자격을 적절한 방법으로 제한 및 정지,
                                상실시킬 수 있습니다.</p>
                            <p class="yakanTxt yakanTxt04">1. 다른 사람의 명의를 도용한 경우</p>
                            <p class="yakanTxt yakanTxt04">2. 회원가입 신청서의 내용을 허위로 기재한 경우</p>
                            <p class="yakanTxt yakanTxt04">3. 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 가입한 경우</p>
                            <p class="yakanTxt yakanTxt04">4. 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 한 경우</p>
                            <p class="yakanTxt yakanTxt04">5. 정보시스템을 이용하여 법령과 본 약관이 금지하는 행위를 한 경우</p>
                            <p class="yakanTxt yakanTxt04">6. 그 밖에 도서관이 정한 회원 가입 요건에 미비된 경우</p>
                            <p class="yakanTxt yakanTxt04">③ 도서관이 이용자의 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다. 이 경우 이용자인 회원에게
                                회원등록 말소 전에 이를 통지하고 소명할 기회를 부여합니다.</p>

                            <p class="yakanTxt yakanTxt02">제6조(서비스의 제공 및 변경)</p>
                            <p class="yakanTxt yakanTxt04">① 도서관이 자체 생산ㆍ개발하거나 다른 회사와의 협력계약 등을 통해 생산된 일체의 서비스를 회원에게
                                제공합니다.</p>
                            <p class="yakanTxt yakanTxt04">② 도서관은 서비스의 내용이 변경되는 경우, 그 내용 및 제공 일자를 제8조제2항에서 정한 방법으로 이용자에게
                                통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.</p>

                            <p class="yakanTxt yakanTxt02">제7조(서비스의 중단)</p>
                            <p class="yakanTxt yakanTxt04">① 도서관은 서비스개편 등 서비스 운영상의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수
                                있습니다.</p>
                            <p class="yakanTxt yakanTxt04">② 제1항에 의한 서비스 중단의 경우, 도서관은 제8조제2항에서 정한 방법으로 이용자에게 통지합니다. 다만,
                                도서관이 통제할 수 없는 사유로 인한 서비스의 중단(시스템장애, 서비스이용폭주, 사이버공격, 정전, 국가비상사태 등)으로 인하여 사전 통지가 불가능한 경우에는
                                그러하지 아니합니다.</p>

                            <p class="yakanTxt yakanTxt02">제8조(이용자에 대한 통지)</p>
                            <p class="yakanTxt yakanTxt04">① 도서관이 특정 이용자에 대한 통지를 하는 경우 이용자가 회원 가입 시에 기재한 메일주소로 할 수
                                있습니다.</p>
                            <p class="yakanTxt yakanTxt04">② 도서관이 불특정다수 이용자에 대한 통지를 하는 경우 도서관 정보시스템 게시판 및 서비스 화면에 게시함으로써
                                개별 통지에 갈음할 수 있습니다.</p>

                            <p class="yakanTxt yakanTxt02">제9조(개인정보의 보호)</p>
                            <p class="yakanTxt yakanTxt04">① 도서관은 「개인정보 보호법」,「국회 개인정보 보호에 관한 규정」,「국회 개인정보 보호지침」 등 관련 법령
                                및 도서관 개인정보처리방침이 정하는 바에 따라 회원의 개인정보를 보호하기 위하여 노력합니다. 다만, 도서관 정보시스템에 포함된 링크 또는 배너를 클릭하여 다른
                                사이트로 옮겨갈 경우에는 해당 사이트의 개인정보보호방침에 따릅니다.</p>
                            <p class="yakanTxt yakanTxt04">② 도서관은 회원에게 서비스 제공에 필요한 목적 범위 안에서 이용자 본인의 동의를 받아 최소한의 개인정보를
                                수집합니다. 또한, 민감정보·고유식별정보의 수집이 필요한 경우에는 각각을 구분하여 별도의 동의를 받아 처리합니다.</p>
                            <p class="yakanTxt yakanTxt04">③ 도서관은 수집된 회원의 개인정보를 도서관통계 및 내부업무의 목적으로만 이용하고 회원 본인의 동의 없이
                                제3자에게 제공하지 않습니다. 다만, 다음과 같은 경우에는 법령에서 허용하는 범위 안에서 회원의 개인정보를 제3자에게 제공할 수 있습니다.</p>
                            <p class="yakanTxt yakanTxt04">1. 법령의 규정에 따라 국가기관의 요청이 있는 경우</p>
                            <p class="yakanTxt yakanTxt04">2. 수사기관이 범죄에 대한 수사상의 목적으로 요청이 있는 경우</p>
                            <p class="yakanTxt yakanTxt04">3. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우</p>
                            <p class="yakanTxt yakanTxt04">④ 회원의 개인정보는 회원 본인만이 열람ㆍ수정ㆍ삭제할 수 있습니다. 다만, 본인 요청이 있을 경우 제한적으로
                                서비스를 지원할 수 있습니다.</p>
                            <p class="yakanTxt yakanTxt04">⑤ 회원은 회원 가입 시 기재한 사항에 변경이 발생한 경우 변경사항을 수정하여 기재하여야 합니다. 회원이
                                변경사항을 수정 기재하지 않아 발생한 불이익에 대하여 도서관은 책임지지 않습니다.</p>

                            <p class="yakanTxt yakanTxt02">제10조(공개 게시물의 삭제 등)</p>
                            <p class="yakanTxt yakanTxt04">① 이용자의 공개 게시물의 내용이 다음 각 호의 어느 하나에 해당하는 경우 도서관은 이용자에게 사전 통지 없이
                                해당 공개 게시물을 삭제할 수 있고, 해당 이용자의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다.</p>
                            <p class="yakanTxt yakanTxt04">1. 음란한 부호·문언·음향·화상 또는 영상을 배포·판매·임대하거나 공공연하게 전시하는 내용</p>
                            <p class="yakanTxt yakanTxt04">2. 불특정 다수를 대상으로 하여 광고 또는 선전하는 내용</p>
                            <p class="yakanTxt yakanTxt04">3. 다른 사람을 비방할 목적으로 공공연하게 사실이나 거짓의 사실을 드러내어 타인의 명예를 훼손하는
                                내용</p>
                            <p class="yakanTxt yakanTxt04">4. 공포심이나 불안감을 유발하는 부호·문언·음향·화상 또는 영상을 반복적으로 상대방에게 도달하도록 하는
                                내용</p>
                            <p class="yakanTxt yakanTxt04">5. 정당한 사유 없이 정보통신시스템, 데이터 또는 프로그램 등을 훼손·멸실·변경·위조하거나 그 운용을
                                방해하는 내용</p>
                            <p class="yakanTxt yakanTxt04">6. 「청소년 보호법」에 따른 청소년유해매체물을 게재 또는 광고하는 내용</p>
                            <p class="yakanTxt yakanTxt04">7. 법령에 따라 금지되는 사행행위에 해당하는 내용</p>
                            <p class="yakanTxt yakanTxt04">8. 법령에 따라 분류되는 비밀 등 국가기밀을 누설하는 내용</p>
                            <p class="yakanTxt yakanTxt04">9.「국가보안법」에서 금지하는 행위를 수행하는 내용</p>
                            <p class="yakanTxt yakanTxt04">10. 그 밖에 범죄를 목적으로 하거나 교사 또는 방조하는 내용</p>
                            <p class="yakanTxt yakanTxt04">11. 종교적 분쟁 등을 야기하는 내용으로서, 이러한 분쟁으로 인하여 도서관 업무가 방해되거나 방해되리라고
                                판단되는 경우</p>
                            <p class="yakanTxt yakanTxt04">12. 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용</p>
                            <p class="yakanTxt yakanTxt04">13. 기타 관련 법령에 위배된다고 판단되는 내용</p>
                            <p class="yakanTxt yakanTxt04">② 이용자의 공개게시물로 인한 법률상 이익 침해를 근거로, 다른 이용자 또는 제3자가 이용자 또는 도서관을
                                상대로 민ㆍ형사상의 법적 조치(예:고소, 가처분신청, 손해배상청구 소송)를 취하는 동시에 법적 조치와 관련된 게시물의 삭제를 요청해오는 경우, 도서관은 동
                                법적 조치의 결과(예: 검찰의 기소, 법원의 가처분결정, 손해배상판결)가 있을 때까지 관련 게시물에 대한 접근을 잠정적으로 제한할 수 있습니다.</p>

                            <p class="yakanTxt yakanTxt02">제11조(저작권의 귀속 및 공공저작물의 자유이용)</p>
                            <p class="yakanTxt yakanTxt04">① 도서관이 창작·작성한 저작물에 대한 저작권 및 기타 지적재산권은 도서관에 귀속합니다.</p>
                            <p class="yakanTxt yakanTxt04">② 저작권법 제24조의2(공공저작물의 자유이용)에 따라 도서관이 제공하는 자료 중에서 도서관이 저작재산권의
                                전부를 보유한 저작물의 경우에는 이용허락 없이 자유이용이 가능합니다. 다만, 이용자는 저작물의 출처를 반드시 표시해야할 의무가 있으며, 「개인정보 보호법」 등
                                다른 법령에 따라 이용이 제한되는 정보의 경우에는 공공저작물의 이용이 제한됩니다.</p>

                            <p class="yakanTxt yakanTxt02">제3장 당사자의 의무</p>

                            <p class="yakanTxt yakanTxt02">제12조(도서관의 의무)</p>
                            <p class="yakanTxt yakanTxt04">① 도서관은 관련 법령과 본 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하기 위하여
                                노력합니다.</p>
                            <p class="yakanTxt yakanTxt04">② 도서관은 이용자가 안전하게 도서관 서비스를 이용할 수 있도록 개인정보의 안전성 확보에 필요한 기술적·관리적
                                및 물리적 보안 조치를 취합니다.</p>
                            <p class="yakanTxt yakanTxt04">③ 도서관은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</p>

                            <p class="yakanTxt yakanTxt02">제13조(이용자의 ID 및 비밀번호에 대한 의무)</p>
                            <p class="yakanTxt yakanTxt04">① 이용자의 ID와 비밀번호에 관한 관리책임은 이용자에게 있습니다. 다만, 도서관이 「개인정보 보호법」 등
                                관계 법령에 의하여 책임을 지는 경우는 제외합니다.</p>
                            <p class="yakanTxt yakanTxt04">② 이용자는 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 되며, 작업 종료 시에는 반드시
                                로그아웃하고, 웹브라우저의 창을 닫아야 합니다.</p>
                            <p class="yakanTxt yakanTxt04">③ 이용자는 자신의 ID 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 바로 도서관에
                                통보하고 도서관의 안내가 있는 경우에는 그에 따라야 합니다.</p>

                            <p class="yakanTxt yakanTxt02">제14조(이용자의 의무)</p>
                            <p class="yakanTxt yakanTxt04">① 이용자는 다음 각 호의 행위를 하여서는 안 됩니다.</p>
                            <p class="yakanTxt yakanTxt04">1. 신청 또는 변경 시 허위 내용을 등록하는 행위</p>
                            <p class="yakanTxt yakanTxt04">2. 타인의 명의를 도용하여 부정사용하는 행위</p>
                            <p class="yakanTxt yakanTxt04">3. 도서관 직원이나 서비스의 관리자를 가장하거나 사칭하는 행위</p>
                            <p class="yakanTxt yakanTxt04">4. 도서관 정보시스템에 게시된 정보를 변경하는 행위</p>
                            <p class="yakanTxt yakanTxt04">5. 다른 이용자에 대한 개인정보를 수집·저장·공개하는 행위</p>
                            <p class="yakanTxt yakanTxt04">6. 외설 또는 폭력적·위협적인 메시지·화상·음성·기타 공서양속에 반하는 정보를 메일로 송신하거나 공개 또는
                                게시하는 행위</p>
                            <p class="yakanTxt yakanTxt04">7. 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 정보를 유통시키는 행위</p>
                            <p class="yakanTxt yakanTxt04">8. 도서관 또는 타인의 지적재산권을 침해하거나 업무를 방해하는 행위</p>
                            <p class="yakanTxt yakanTxt04">9. 컴퓨터 소프트웨어·하드웨어·네트워크 등의 정상적인 가동을 방해, 파괴할 목적으로 해킹 또는
                                컴퓨터바이러스를 유포하는 행위</p>
                            <p class="yakanTxt yakanTxt04">10. 불특정 다수를 대상으로 하여 광고 또는 선전을 게시하거나 스팸메일을 전송하는 등의 행위</p>
                            <p class="yakanTxt yakanTxt04">11. 도서관 이용 약관 등 도서관 서비스 이용에 관한 규정을 위반하는 행위</p>
                            <p class="yakanTxt yakanTxt04">12. 그 밖에 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보를 전송 또는 게시하는 행위</p>
                            <p class="yakanTxt yakanTxt04">② 제1항 각 호에 해당하는 행위를 한 이용자가 있을 경우 도서관은 본 약관 제5조제2항에서 정한 바에 따라
                                이용자의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.</p>
                            <p class="yakanTxt yakanTxt04">③ 이용자는 그 귀책사유로 인하여 도서관이나 다른 이용자가 입은 손해를 배상할 책임이 있습니다.</p>

                            <p class="yakanTxt yakanTxt02">제4장 손해배상 등</p>

                            <p class="yakanTxt yakanTxt02">제15조(손해배상)</p>
                            <p class="yakanTxt yakanTxt04">도서관과 회원은 서비스 이용과 관련하여 고의 또는 과실로 상대방에게 손해를 끼친 경우에는 이를 배상하여야
                                합니다.</p>

                            <p class="yakanTxt yakanTxt02">제16조(면책조항)</p>
                            <p class="yakanTxt yakanTxt04">① 도서관은 천재지변, 전쟁, 기간통신사업자의 서비스 중지 및 기타 이에 준하는 불가항력으로 인하여 서비스를
                                제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.</p>
                            <p class="yakanTxt yakanTxt04">② 도서관은 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이
                                면제됩니다.</p>
                            <p class="yakanTxt yakanTxt04">③ 도서관은 회원의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게
                                기재하여 손해가 발생한 경우 책임을 지지 않습니다.</p>
                            <p class="yakanTxt yakanTxt04">④ 도서관은 회원이 서비스를 이용하여 기대하는 결과를 얻지 못하거나 상실한 것에 대하여 책임을 지지 않으며,
                                서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다.</p>
                            <p class="yakanTxt yakanTxt04">⑤ 도서관은 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 대하여 책임을 지지
                                않으며, 회원 상호간 및 회원과 제3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없고, 이로 인한 손해를 배상할 책임도 없습니다.</p>
                            <p class="yakanTxt yakanTxt04">⑥ 도서관은 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할
                                의무가 없으며, 그 결과에 대한 책임을 지지 아니합니다.</p>

                            <p class="yakanTxt yakanTxt02">제17조(재판관할)</p>
                            <p class="yakanTxt yakanTxt04">① 서비스 이용과 관련하여 도서관과 회원 사이에 분쟁이 발생한 경우, 도서관과 회원은 발생한 분쟁을 원만하게
                                해결하기 위하여 필요한 모든 노력을 하여야 합니다.</p>
                            <p class="yakanTxt yakanTxt04">② 제1항의 규정에도 불구하고 서비스 이용으로 발생한 분쟁에 대하여 소송이 제기될 경우 도서관 소재지를
                                관할하는 법원을 관할법원으로 합니다.</p>


                            <p class="yakanTxt yakanTxt02">[부 칙]</p>
                            <p class="yakanTxt yakanTxt04">본 약관은 2021년 10월 27일부터 적용합니다.</p>
                        </div>


                    </div>
                    
                        <div class="yakanChk" >
                            <span ><input type="checkbox" name="yakanOK" id="yakanOK"/><label for="yakanOK">이용약관에 동의합니다.</label></span>
                        </div>
                        <div class="yakanBtn m_mr00" >
                            <ul>
                                <li><a href="insertMemberForm2.do">확인</a></li>
                                <li><a href="/main.do">취소</a></li>
                            </ul>
                        </div>                    
                    <!-- 여기까지 콘텐츠 e -->
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