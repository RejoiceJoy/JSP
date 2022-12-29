<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<title>마이페이지>회원가입>회원구분</title>


    <script type="text/javascript">


        $(window).resize(function(){
            var width = window.outerWidth;
            if(width <= 767){
                $('[data-search-type="home"]').hide();
                $('[data-search-type="elec"]').show();
                $('#selectSearchType').val('E').prop('selected', true);
            }
        });


        function logout(){
            /*if('null' == "Y"){
                document.headerForm.action="/nexess/sso/sloExe.jsp?RelayState=/logout.do";
            }else{*/
                document.headerForm.action="/logout.do";
            /*}*/
            document.headerForm.submit();
        }


        // 20181128 추가 직원
        function docsLogout(){
            document.headerForm.action="/logout.do";
            document.headerForm.submit();
        }


        function fnMovePage(type){      	
            switch (type) {
                case 1: $('#headerForm').attr('action', '/member/selectMember.do').submit();
                    break;
                case 2: $('#headerForm').attr('action',  '/loginForm.do').submit();
                    break;
            }
        }


        function goMbileMembership(){	
            var seq = '';
            if(seq == '' || seq == null){
                if(navigator.userAgent.toLowerCase().search('mobile') > -1){
                    $("#mpcGbn").val("m");
                }else{
                    $("#mpcGbn").val("p");
                }
                $("#memberShipFrm").attr("action", "/loginForm.do").submit();
            }else{
                $("#memberShipFrm").attr("action", "/mylib/mobMemberDetail.do").submit();
            }
        }


        function firstWelcomPop() {
            window.open("/main/firstWelcomPopup.do","firstPopup","width=407, height=440, scrollbars=yes,toolbar=no,resizable=no,menubar=no,status=no");
        }


        function winPopup() {
            window.open("/main/siteListPop.do", "banner_list","width=410, height=200, scrollbars=no, resizable=0");
        }


        // 팝업존
        function eventPopup(seq) {
            var numScreenWidth	= screen.width;
            var numScreenHeight	= screen.height;

            var width = 400;
            var height = 675; //520
            /*
            if(seq == '391'){
                width = 700;
                if(numScreenHeight <= 900){
                    height = 800;
                }else{
                    height = 990; // 900 + 155
                }
            }
            */

            if(seq == '521'){
                window.open("/main/popupNotice.do", "popupNotice","width=501, height=863, scrollbars=no, resizable=no");
            }

            else if(seq == '523'){
                window.open("/main/popupNotice.do", "popupCopy","width=501, height=885, scrollbars=no, resizable=no");
            }

            else{
                window.open("/main/popupEvent.do?popupSeq=" + seq, "eventPopup","width="+width+", height="+height+", scrollbars=no, resizable=no");
            }
        }


        function urgentNoticeClose(){
            $('#topPopup').slideUp();
        }


//          20181224 전자자료(e-Book)  
        function eBook(){
            var ccd = '';
            var id = '';
            var pwd = '';

            if(ccd == "E"){
                // 직원로그인
                $("#docs_id").val(id);
                $("#docs_pwd").val(pwd);
                $("#docs_yn").val('Y');

                $("#eBookFrm").attr("target","_blank");
                $("#eBookFrm").attr("action", "http://e-book.nanet.go.kr/" ); //http://e-book.nanet.go.kr:8080/(개발), http://e-book.nanet.go.kr/(운영)
                $("#eBookFrm").submit();
            }
        }



        // 홈페이지 내 검색
        function totalSearch(){
            var width = window.outerWidth;
            if(width <= 767){
                $('#searchQuery').val($('#searchQuery2').val());
            }else{
                $('#searchQuery').val($('#searchQuery1').val());
            }

            $('#subHeaderForm').attr('action', '/member/totalsearchList.do');
            $('#subHeaderForm').submit();
        }

        //webzin url
        $(function(){
    		$.ajax({
    			type: "post"
    			, async: false
    			, dataType: "json"
    			, url: "/main/selectWebzineUrl.do"
    			, success: function(resultData) {
    				var url = resultData.data[0].url;
    				$('.wu').attr('href', url);
    				
    			}, error: function(data, status, err) {
    				alert("서버와의 통신이 실패했습니다.");
    				console.log(data);
    	        }
    		});            
        });


        function fnHeaderLogin(){
        	$("#reserveFrm3").attr("action", "/loginForm2.do").submit();
        }
        
    	function seatck() {
    		window.open("https://www.nanet.go.kr/main/seatPopup.do", "seatPopup","width=336, height=350, scrollbars=0, resizable=0");
    	}


        //디지털정보센터 좌석예약
        function seatRegister(){
            var seq	= '';
            if(seq == '' ||	seq == null){
                if(navigator.userAgent.toLowerCase().search('mobile') >	-1){
                    $("#mpcGbn").val("m");
                }else{
                    $("#mpcGbn").val("p");
                }
                $("#frm_retUrl").val("seatUrl");
                $("#frm").attr("action", "/loginForm.do").submit();
            }else{
                // 20201218 좌석예약 연계방식 변경
                // [dev]
                //var seatUrl = 'http://seat-dev2.nanet.go.kr:7700/login_library';
                // [real]



//                 $('#frm').attr('target', '_blank');
//                 $('#frm').attr('action', seatUrl).submit();
				location.href = 'http://seat.nanet.go.kr:7700/login_library?id=&password=';
            }
        }
    </script>

</div>
	















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
</script>

<form action="selectMember.do" method="get" name="frm">
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
			<h3 class="title">회원 구분 선택</h3>

			<div class="subContents">
				<div class="body">
					<!-- 여기서부터 콘텐츠 s -->
					<div class="bodyBox01">
						<div class="textWrap">
							<div class="conTxt">
								<p class="txt01">회원구분에 따라 가입절차가 다릅니다. 해당되시는 회원 단계를 선택해서 진행하시기 바랍니다.</p>
							</div>
						</div>
						<!-- 여기까지 콘텐츠 e -->
					</div>
					
<!-- 						<p class="membershipStepTxt">본인확인(실명인증)</p> -->
						<div class="loginNemoBox">
							<div class="login15">
								<div class="loginNextRuningY15" style="border-right: 1px solid #ccc;">
									<div class="blueBtnN2"><a href="insertMemberForm1.do" title="만14세 이상(일반회원)이용약관동의 화면">만14세 이상(일반회원)</a></div>
								</div>
							</div>
							<div class="login14">
								<div class="loginNextRuningY14">
									<div class="blueBtnN2"><a href="insertMemberForm1.do" title="만14세 미만(어린이)이용약관동의 화면">만14세 미만(어린이)</a></div><!-- /member/insertMemberForm3.do -->
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