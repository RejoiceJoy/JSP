<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<%@ page import="usermadang.board.model.FreeboardDAO"%>
<% 	String sessionId = (String) session.getAttribute("sessionId");
	FreeboardDAO dao = FreeboardDAO.getInstance();
	String member_name = dao.getLoginNameById(sessionId);%>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="도서관 소개, 자료검색, 열람실 등 이용안내"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Expires" content="-1" />

<meta charset="UTF-8">

<meta name="viewport" content="initial-scale=1, user-scalable=no, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />

<link  href="css2/sub.css" rel="stylesheet"/>
<meta name='viewport' content='initial-scale=1, user-scalable=no, initial-scale=1'/>

<link href="css1/jquery-ui.css" rel="stylesheet" />
<link href="css1/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css1/sub_mobile.css">
<link rel="stylesheet" type="text/css" href="css1/sub_all.css">
<link rel="stylesheet" type="text/css" href="css1/sub.css">
<link rel="stylesheet" type="text/css" href="css1/sub_pc.css">
<link rel="stylesheet" type="text/css" href="css1/sub_tablet.css">
<link rel="stylesheet" type="text/css" href="css1/common.css">
<link rel="stylesheet" type="text/css" href="css1/btn.css">

<!-- 무슨 아이콘인지 찾아내기 -->
<link rel="icon" href="/images/logo/favicon.png" sizes="16x16" />

<link rel="stylesheet" type="text/css" href="css2/new_common.css">
<link rel="stylesheet" type="text/css" href="css2/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="css2/fonts.css">

<!-- selectMember.jsp -->
<link rel="stylesheet" type="text/css" href="css2/select2.css"/>

<!-- member.js에 loginCheck() 함수를 정의하여 로그인 버튼 클릭 시 ID, PW 정보가 모두 입력되었을 경우에만 로그인 인증처리를 하고 하나라도 입력이 안 되면 error메시지 출력하기 위함 -->
<script type="text/javascript" src="script/member.js"></script>

<!-- 주소창 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
</head>
<body>
	<!-- 상단 배너 -->

	<div class="skip">
        <a href="#">본문 바로가기</a>
        <a href="#">주메뉴 바로가기</a>
        <a href="#">서브메뉴 바로가기</a>
   	</div>	
   	
   	<div class="sub" id="top">
   		<form name="headerForm"	id="headerForm"	method="post">
            <input type="hidden" name="ret_url" value="" />
            <input type="hidden" name="inter_system" value="" />
            <input type="hidden" name="system" value="" />
            <input type="hidden" name="retURL" value="" />
            <input type="hidden" name="deviceType" id ="deviceType"/>
            <input type="hidden" name="liveCheck" id="liveCheck" value="N" />
        </form>
		<div class="header">
			<div class="top">
                <div class="inner">
                    <div class="loginList pc">
                        <ul>
							<c:choose>
								<c:when test="${not empty sessionScope.sessionId}">
                                    <li class="new user"><b><%=member_name%></b>님 안녕하세요!</li> <!-- 로그인 시, 노출 -->
                                    <li><a href="./logout.do">로그아웃</a></li>
                                    <li><a href="/member/modyMember.do">마이페이지</a></li>
                                        <li><a href="/mylib/bitchReqInfo.do">My Library</a></li>
								</c:when>
								<c:otherwise>
									<li class="new"><a href="./selectMember.do" title="새창열기">처음 방문하셨나요?</a></li>
						        	<li><a href="./login.do">로그인</a></li>
								</c:otherwise>
							</c:choose>
                            <li><a href="#" target="_blank" title="새창열기">ENGLISH</a></li>
                        </ul>
                    </div>
                </div> 
            </div>    
		<div class="bottom">
                <div class="inner">
                    <div class="logo"><h1><a href="http://localhost:8080/nal" title="메인페이지로 이동"><img src="images/img/logo.png" alt="국회도서관 로고"></a></h1></div>
                    <!-- 메뉴 -->
                    <div class="menu" id="menu">
                        <ul>
                            <li>
                                <a href="#" class="blue">입법서비스</a>
                                <div class="menuList service">
                                    <div class="inner">
                                        <div class="text">
                                            <p>입법서비스</p>
                                            <p>입법관련된 서비스를 찾아<br/>보실 수 있습니다.</p>
                                        </div>
                                        <ul>
                                            <li class="menu01">
                                                <a href="#">국회의원·입법부</a>
                                                <ul>
                                                    <li><a href="#">의회정보</a></li>
                                                    <li><a href="#">법률정보</a></li>
                                                    <li><a href="#">지능형분석</a></li>
                                                    <li><a href="#">전문가정보데이터베이스</a></li>
                                                    <li><a href="#">국회의원 정책자료</a></li>
                                                    <li><a href="#">국회·국회의원 보도자료</a></li>
                                                    <li><a href="#">국회·지방의회 의정정보</a></li>
                                                    <li><a href="#">독도홈페이지</a></li> 
                                                    <li><a href="#">국회기록정보</a></li> 
                                                    <li><a href="#">국회회의록 빅데이터</a></li>                                                
                                                </ul>
                                            </li>
                                            <li class="menu02">
                                                <a href="#">학술·연구자 클라우드</a>
                                                <ul>
                                                    <li><a href="#">Web-DB</a></li>
                                                    <li><a href="#">오픈액세스 저널</a></li>
                                                    <li><a href="#">학술연구자정보</a></li>
                                                    <li><a href="#">국가학술정보</a></li>
                                                </ul>
                                            </li>
                                            <li class="menu03">
                                                <a href="#">저작권 서비스</a>
                                                <ul>
                                                    <li><a href="#">지식공유</a></li>
                                                    <li><a href="#">디지털콘텐츠식별체계</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
							<li>
                                <a href="#" class="green">책이야기</a>
                                <div class="menuList story">
                                    <div class="inner">
                                        <div class="text">
                                            <p>책이야기</p>
                                            <p>도서관련 콘텐츠를<br/>찾아 보실 수 있습니다.</p>
                                        </div>
                                        <ul>
                                            <li class="menu01"><a href="#">서평</a></li>
                                            <li class="menu02">
                                                <a href="#">신간</a>
                                                <ul>
                                                    <li><a href="#">금주의 신간</a></li>
                                                    <li><a href="#">국내 주간지 기사</a></li>
                                                    <li><a href="#">외국도서관 기증자료</a></li>
                                                </ul>
                                            </li>
    <!--                                         <li class="menu03"><a href="/datasearch/issuebook/selectIssueBookList.do">현안과 책</a></li> -->
                                            <li class="menu03"><a href="#">월간 국회도서관</a></li>
                                            <li class="menu04"><a href="https://www.nanet.go.kr/webzine/202005/main.html" target="_blank" class="wu" title="새창열기">국회도서관 웹진</a></li>
                                            <li class="menu05"><a href="#">국회의원 추천도서</a></li>
                                            <li class="menu06"><a href="#" >전자책(e-Book)</a></li>
                                            <li class="menu07"><a href="#">북 큐레이션</a></li>
                                            <!--<li class="menu08"><a href="/bookstory/curation/selectVideoCurationList.do">영상 큐레이션</a></li>-->
                                        </ul>
                                    </div>
                                </div>
                            </li>
							<li>
                                <a href="#">이용자마당</a>
                                <div class="menuList user">
                                    <div class="inner">
                                        <div class="text">
                                            <p>이용자마당</p>
                                            <p>도서관 이용자관련 서비스를<br/>찾아 보실 수 있습니다.</p>
                                        </div>
                                        <ul>
                                            <li class="menu01"><a href="#">공지사항</a></li>
                                            <li class="menu02">
    <!-- 											<a href="/usermadang/reqreservation/useReserveInfo.do">신청 및 예약</a> -->
                                                    <a href="/usermadang/bitchBookReqView.do">신청 및 예약</a> 
                                                <ul>
                                                    <li><a href="#" onclick="seatRegister();" title="새창열기">디지털정보센터 좌석예약</a></li>
        <!-- 										<li><a href="#" onclick="seatck();" title="새창열기">디지털정보센터 좌석예약</a></li> -->
                                                    <li><a href="#">야간 자료이용</a></li>
                                                    <li><a href="#">비치희망도서신청</a></li>
                                                    <li><a href="#">자료복사</a></li>
                                                    <li><a href="#">메일링 서비스</a></li>
                                                    <li><a href="#">참관</a></li>
                                                    <!--<li>
                                                    <a href="/usermadang/reqreservation/useReserveInfo.do">국회도서관 이용 예약</a>
                                                    </li>-->
                                                    <!-- //20200702 추가 <span style="padding-left: 3px;vertical-align: none;"></span>-->
                                                </ul>
                                            </li>
                                            <!-- //20211026 임시 주석 s -->
                                            <li class="menu03">
                                                <a href="#">납본·기증</a>
                                                <ul>
                                                    <li><a href="#">납본</a></li>
                                                    <li><a href="#">기증</a></li>
                                                    <li><a href="#">자료수집정책</a></li>
                                                </ul>                                        	
                                            </li> 
                                            <!-- //20211026 임시 주석 e -->
    <!--                                         <li class="menu03"><a href="/usermadang/etc/payDonateView.do">납본·기증</a></li> -->
                                            <li class="menu04"><a href="#">Open API</a></li>
                                            <li class="menu05">
                                                <a href="#">게시판</a>
                                                <ul>
                                                    <li><a href="#">자주하는 질문</a></li>
                                                    <li><a href="#">묻고답하기</a></li>
                                                    <li><a href="./freeBoardList.do">자유게시판</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
							<li>
                                <a href="#">도서관소개</a>
                                <div class="menuList intro">
                                    <div class="inner">
                                        <div class="text">
                                            <p>도서관소개</p>
                                            <p>국회도서관을<br/>소개합니다.</p>
                                        </div>
                                        <ul>
                                            <li class="menu01">
                                                <a href="#">국회도서관</a>
                                                <ul>
                                                    <li><a href="#">국회도서관장</a></li>
                                                    <li><a href="#">조직 및 업무</a></li>
                                                </ul>
                                            </li>
                                            <li class="menu02">
                                                <a href="#">개방·공유</a>
                                                <ul>
                                                    <li><a href="#">발간자료</a></li>
                                                    <li><a href="#">소장현황</a></li>
                                                    <li><a href="#">사이버 홍보실</a></li>
                                                    <li><a href="#">한국학술정보협의회</a></li>
                                                    <li><a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a></li>
                                                    <li><a href="#" >관계법규</a></li>
                                                </ul>
                                            </li>
                                            <li class="menu04">
                                                <a href="#">도서관이용</a>
                                                <ul>
                                                    <li><a href="#">이용안내</a></li>
                                                    <li><a href="./GuideServlet">자료실</a></li>
                                                    <li><a href="#">오시는 길</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
					</div><!-- //메뉴 끝? -->	
					<div class="mo btnSearch">
                        <button type="button" class="btn_search">검색</button>
                    </div>
    
                    <div class="menuSearch pc">
                        <input type="text" id="searchQuery1" placeholder="홈페이지내 검색" title="검색어 입력창" onkeydown="javascript:if(event.keyCode == 13) totalSearch();" autocomplete="off" />
                        <button type="button" class="btn_search" onclick="totalSearch();">검색</button>
                    </div>		
<!-- 햄버거 이미지 바꾸기!!!!!!!!!!! -->
                    <div class="menuIcon"><a href="#none"><img src="images/img/btn_hambuger.png" alt="전체메뉴"></a></div>
                </div>
            </div>
        </div>
        
        <!-- 팝업메뉴 -->
        <div class="popupMenu">
            <div class="dim"></div>
            <div class="popupContainer">
            <p><em>전체메뉴</em><span class="close"><a href="#none">닫기</a></span></p>
            
            <!-- 모바일용 로그인 -->
            <div class="loginList mo">
                <div class="logo"><h1><a href="main.do"><img src="images/img/logo.png" alt="국회도서관"></a></h1></div>
                <div class="close"><a href="#">닫기</a></div>
                <ul>
                    <li><a href="/main.do" target="_blank" title="새창열기">ENGLISH</a></li>
<!--                     <li><a href="https://www.facebook.com/NationalAssemblyLibraryROK/" target="_blank" title="새창열기">국회도서관 SNS</a></li> -->
                        <li><a href="#">모바일 간편열람증</a></li>
                </ul>
                <!-- <div class="userForm"><b>홍길동</b>님 안녕하세요!</div> --> <!-- 로그인 시, 노출 -->
                <div class="logButton">
                            <button class="btn_login" onclick="fnMovePage(2);">로그인</button>
                            <button class="btn_join"  onclick="fnMovePage(1);">회원가입</button>
                    <p><a href="javascript:firstWelcomPop();" title="새창열기">처음 방문하셨나요?</a></p>
                </div>
            </div>
            <ul>
                <li>
                    <span>입법서비스</span>
                    <ul class="depth">
                        <li>
                            <a href="#">국회의원·입법부</a>
                            <ul>
                                <li><a href="#">의회정보</a></li>
                                <li><a href="#">법률정보</a></li>
                                <li><a href="#">지능형분석</a></li>
                                <li><a href="#">전문가정보데이터베이스</a></li>
                                <li><a href="#">국회의원 정책자료</a></li>
                                <li><a href="#">국회·국회의원 보도자료</a></li>
                                <li><a href="#">국회·지방의회 의정정보</a></li>
                                <li><a href="#">독도홈페이지</a></li>
                                <li><a href="#">국회기록정보</a></li>   
                                <li><a href="#">국회회의록 빅데이터</a></li>                               
                            </ul>
                        </li>
                        <li>
                            <a href="#">학술·연구자 클라우드</a>
                            <ul>
                                <li><a href="#">Web-DB</a></li>
                                <li><a href="#">오픈액세스 저널</a></li>
                                <li><a href="#">학술연구자정보</a></li>
                                <li><a href="#">국가학술정보</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">저작권 서비스</a>
                            <ul>
                                <li><a href="#">지식공유</a></li>
                                <li><a href="#">디지털콘텐츠식별체계</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <span class="green">책이야기</span>
                    <ul class="depth">
                        <li><a href="#">서평</a></li>
                        <li>
                            <a href="#">신간</a>
                            <ul>
                                <li><a href="#">금주의 신간</a></li>
                                <li><a href="#">국내 주간지 기사</a></li>
                                <li><a href="#">외국도서관 기증자료</a></li>
                            </ul>
                        </li>
<!--                         <li><a href="/datasearch/issuebook/selectIssueBookList.do">현안과 책</a></li> onclick="javascript:eBook(); return false;"-->
                        <li><a href="#">월간 국회도서관</a></li>
                        <li><a href="https://www.nanet.go.kr/webzine/202005/main.html" target="_blank" class="wu" title="새창열기">국회도서관 웹진</a></li>
                        <li><a href="#">국회의원 추천도서</a></li>
						<li><a href="#" >전자책(e-Book)</a></li>	
                         <li><a href="#">북 큐레이션</a></li>
				       <!--<li><a href="/bookstory/curation/selectVideoCurationList.do">영상 큐레이션</a></li>    -->                    
                    </ul>
                </li>
                <li>
                    <span>이용자마당</span>
                    <ul class="depth">
                        <li><a href="#">공지사항</a></li>
                        <li>
<!-- 								<a href="/usermadang/reqreservation/useReserveInfo.do">신청 및 예약</a> -->
								<a href="#">신청 및 예약</a>
                            <ul>
 									<li><a href="#" onclick="seatRegister();" title="새창열기">디지털정보센터 좌석예약</a></li>
<!--									<li><a href="#" onclick="seatck();" title="새창열기">디지털정보센터 좌석예약</a></li>  -->
                                <li><a href="#">야간 자료이용</a></li>
                                <li><a href="#">비치희망도서신청</a></li>
                                <li><a href="#">자료복사</a></li>
                                <li><a href="#">메일링 서비스</a></li>
                                <li><a href="#">참관</a></li>
                               <!-- <li>
                                <a href="/usermadang/reqreservation/useReserveInfo.do">국회도서관 이용 예약</a>
                                </li>-->
                                <!-- //20200702 추가 <span style="padding-left: 3px;vertical-align: none;"></span>-->
                            </ul>
                        </li>
                        
                        <!-- //20211026 임시 주석 s -->
                        <li>
                        	<a href="#">납본·기증</a>
                            <ul>
                                <li><a href="#">납본</a></li>
                                <li><a href="#">기증</a></li>
                                <li><a href="#">자료수집정책</a></li>
                            </ul>
                        </li> 
                        <!-- //20211026 임시 주석 e -->
<!--                         <li><a href="/usermadang/etc/payDonateView.do">납본·기증</a></li> -->
                        <li><a href="#">Open API</a></li>
                        <li>
                            <a href="#">게시판</a>
                            <ul>
                                <li><a href="#">자주하는 질문</a></li>
                                <li><a href="#">묻고답하기</a></li>
                                <li><a href="./freeBoardList.do">자유게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <span>도서관소개</span>
                    <ul class="depth">
                        <li>
                            <a href="#">국회도서관</a>
                            <ul>
                                <li><a href="#">국회도서관장</a></li>
                                <li><a href="#">조직 및 업무</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">개방·공유</a>
                            <ul>
                                <li><a href="#">발간자료</a></li>
                                <li><a href="#">소장현황</a></li>
                                <li><a href="#">사이버 홍보실</a></li>
                                <li>
                                    <a href="#">한국학술정보협의회</a>
                                    <ul class="depth3">
<!--                                         <li><a href="/comnet/academeet/meetConferensView.do">제20차 정기총회 및 콘퍼런스</a></li> -->
                                        <li><a href="#">협정체결절차</a></li>
                                        <li><a href="#">협의회 및 협정기관 소개</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a>
                                    <ul class="depth3">
                                        <li><a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a></li>
                                        <li><a href="https://open.assembly.go.kr/portal/data/service/selectServicePage.do/OTA0YC001127RJ11880" target="_blank" title="새창열기">업무추진비</a></li>
                                    </ul>
                                </li>
                                <li><a href="#" >관계법규</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">도서관이용</a>
                            <ul>
                                <li>
                                    <a href="#">이용안내</a>
                                    <ul class="depth3">
                                        <li><a href="#">이용 대상 및 시간</a></li>
                                        <li><a href="#">이용 제한 자료</a></li>
                                        
                                        <li><a href="#">장애인 이용</a></li>
                                        <li><a href="#">출입 절차 및 준수사항</a></li>
                                        <li><a href="#">모바일 서비스</a></li>
                                    </ul>
                                </li>
                                <li><a href="./GuideServlet">자료실</a></li>
                                <li><a href="#">오시는 길</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <span>마이페이지</span>
                    <ul class="depth">
						        <li><a href="login.do">로그인</a></li>
                                <li><a href="selectMember.do">회원가입</a></li>
                                <li><a href="searchIdPwdForm.do">아이디/비밀번호 찾기</a></li>
                                <li>
                                    <a href="#">열람증</a>
                                    <ul>
                                        <li><a href="#">모바일 간편열람증</a></li>
<!--                                         <li><a href="/member/studentPassForm.do">학생증 시범사업</a></li> -->
                                    </ul>
                                </li>
                    </ul>
                </li>
                <li>
                    <span>기타</span>
                    <ul class="depth">
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">이메일수집거부</a></li>
                        <li><a href="#">홈페이지 내 검색</a></li>
                        <li><a href="#">전자도서관 검색</a></li>
                    </ul>
                </li>
            </ul>
            </div>
        </div><!-- //팝업메뉴 -->


       	<form name="memberShipFrm" id="memberShipFrm">
            <input type="hidden" name="retURL" id="member_retURL" value="membership"/>
            <input type="hidden" name="parentUrl" id="parentUrl_mem" value="membership"/>
        </form>

        <form name="eBookFrm" id="eBookFrm">
            <input type="hidden" name="docs_id" id="docs_id" />
            <input type="hidden" name="docs_pwd" id="docs_pwd" />
            <input type="hidden" name="docs_yn" id="docs_yn" />
        </form>

        <form name="frm" id="frm" >
            <input type="hidden" name="retUrl" id="frm_retUrl" />
            <input type="hidden" name="parentUrl" id="frm_parentUrl"	value="seatUrl"/>
            <!--<input type="hidden" name="id" id="libMemberId" value=""/>
            <input type="hidden" name="password" id="libMemberPw" value=""/>-->
        </form>

        <form name="subHeaderForm" id="subHeaderForm" method="post">
            
            <input type="hidden" name="searchQuery" id="searchQuery" value="" />
        </form>

        <form id="reserveFrm3" method="post">
    <!-- 		<input type="hidden" name="retURL" value="useReserve" /> -->
        </form>
    </div>