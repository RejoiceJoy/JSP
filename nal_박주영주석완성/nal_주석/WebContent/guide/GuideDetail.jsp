<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*"  %>
<%@ page import="guide.model.*"  %>
<%@ page import="java.util.*"  %>
<%@ page import="usermadang.board.model.FreeboardDAO"%>

<% 	ArrayList<GuideVO> volist = (ArrayList<GuideVO>) request.getAttribute("volist"); 
	String sessionId = (String) session.getAttribute("sessionId");
	FreeboardDAO dao = FreeboardDAO.getInstance();
	String member_name = (String) session.getAttribute("sessionName");
%>

<c:set var="volist" value="<%=volist%>"></c:set>


<!DOCTYPE html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
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

<title>도서관소개>도서관이용>자료실</title>
<link  href="${pageContext.request.contextPath}/css/sub.css" rel="stylesheet"/>
<meta name='viewport' content='initial-scale=1, user-scalable=no, initial-scale=1'/>

<link href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />

<link rel="icon" href="${pageContext.request.contextPath}/images/logo/favicon.png" sizes="16x16" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/new_common.css?v=202212161650">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/jquery.bxslider.css?v=202212161650">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/fonts.css?v=202212161650">


<!--[if lte IE 8]>
<link href="${pageContext.request.contextPath}/css/sub_pc.css" rel="stylesheet"/>
<![endif]-->


<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.11.2.min.js"></script>
<!--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/js_rolling.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jExpand.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/new_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/menu_control.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/select2.css?v=202212161650"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/select2.min.js"></script>

<script type="text/javascript">
//<![CDATA[        
 $(function() {
	 $("#deviceType").val('');

  });
//]]>
</script>        

</head>
<body>


	






















<script type="application/ld+json">
    {
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": "국회도서관",
        "url": "http://www.nanet.go.kr",
        "sameAs": [
            "https://www.facebook.com/NationalAssemblyLibraryROK",
            "https://play.google.com/store/apps/details?id=kr.go.nanet.mdl&hl=ko",
            "https://www.youtube.com/channel/UC-bp8PLUgMxMNkdvdlGLznQ",
            "https://blog.naver.com/nalkr2017",
            "https://www.instagram.com/nal_kr"
        ]
    }
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/select2_old.css?v=202212161650"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/select2.min.js"></script>


<div class="skip">
    <a href="#bodyWrap">본문 바로가기</a>
    <a href="#menu">주메뉴 바로가기</a>
    <a href="#subMenu">서브메뉴 바로가기</a>
</div>

<!-- top Popup -->



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
                <!-- pc용 로그인 -->
                <div class="loginList pc">
                    <ul>
                        
                            
							<c:choose>
								<c:when test="${not empty sessionScope.sessionId}">
                                    <li class="new user"><b><%=member_name%></b>님 안녕하세요!</li> <!-- 로그인 시, 노출 -->
                                    <li><a href="./logout.do">로그아웃</a></li>
                                    <li><a href="/member/modyMember.do">마이페이지</a></li>
                                        <li><a href="./mylist.nal">My Library</a></li>
								</c:when>
								<c:otherwise>
									<li class="new"><a href="./selectMember.do" title="새창열기">처음 방문하셨나요?</a></li>
						        	<li><a href="./login.do">로그인</a></li>
								</c:otherwise>
							</c:choose>
                                
                                <li><a href="/english/main.do" target="_blank" title="새창열기">ENGLISH</a></li>
<!--                                 <li><a href="https://www.facebook.com/NationalAssemblyLibraryROK/" target="_blank" title="새창열기">국회도서관 SNS</a></li> -->
                            
                            
                        
                    </ul>
                </div>
            </div>
            
            
        </div>
        
        
        <div class="bottom">
            <div class="inner">
                <div class="logo"><h1><a href="http://localhost:8080/nal" title="메인페이지로 이동"><img src="${pageContext.request.contextPath}/resource/images/logo.png" alt="국회도서관 로고"></a></h1></div>

                <!-- 메뉴 -->
                <div class="menu" id="menu">
                    <ul>
                        <li>
                            <a href="/lowcontent/etccontents/assemblyInfoServiceView.do" class="blue">입법서비스</a>
                            <div class="menuList service">
                                <div class="inner">
                                    <div class="text">
                                        <p>입법서비스</p>
                                        <p>입법관련된 서비스를 찾아<br/>보실 수 있습니다.</p>
                                    </div>
                                    <ul>
                                        <li class="menu01">
                                            <a href="/lowcontent/etccontents/assemblyInfoServiceView.do">국회의원·입법부</a>
                                            <ul>
                                                <li><a href="/lowcontent/etccontents/assemblyInfoServiceView.do">의회정보</a></li>
                                                <li><a href="/lowcontent/etccontents/lowInfoServiceView.do">법률정보</a></li>
                                                <li><a href="/lowcontent/etccontents/argos.do">지능형분석</a></li>
                                                <li><a href="/lowcontent/etccontents/humanNetView.do">전문가정보데이터베이스</a></li>
                                                <li><a href="/lowcontent/etccontents/assemblyPolicyDataDBView.do">국회의원 정책자료</a></li>
                                                <li><a href="/lowcontent/etccontents/assemblyNationBodoData.do">국회·국회의원 보도자료</a></li>
                                                <li><a href="/lowcontent/etccontents/communityView.do">국회·지방의회 의정정보</a></li>
                                                <li><a href="/lowcontent/etccontents/dokdoIntro.do">독도홈페이지</a></li> 
                                                <li><a href="/lowcontent/etccontents/assemblyRecordInfoView.do">국회기록정보</a></li> 
                                                <li><a href="/lowcontent/etccontents/assemblyBigDataSet.do">국회회의록 빅데이터</a></li>                                                
                                            </ul>
                                        </li>
                                        <li class="menu02">
                                            <a href="/datasearch/webdb/selectParliamentDBList.do">학술·연구자 클라우드</a>
                                            <ul>
                                                <li><a href="/datasearch/webdb/selectParliamentDBList.do">Web-DB</a></li>
                                                <li><a href="/openaccess/openAccessList.do">오픈액세스 저널</a></li>
                                                <li><a href="/comnet/knowshare/acdemShareView.do">학술연구자정보</a></li>
                                                <li><a href="/comnet/knowshare/cloudView.do">국가학술정보</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu03">
                                            <a href="/comnet/knowshare/knowShareView.do">저작권 서비스</a>
                                            <ul>
                                                <li><a href="/comnet/knowshare/knowShareView.do">지식공유</a></li>
                                                <li><a href="/comnet/knowshare/uciView.do">디지털콘텐츠식별체계</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="/datasearch/commant/selectWeekCommantList.do" class="green">책이야기</a>
                            <div class="menuList story">
                                <div class="inner">
                                    <div class="text">
                                        <p>책이야기</p>
                                        <p>도서관련 콘텐츠를<br/>찾아 보실 수 있습니다.</p>
                                    </div>
                                    <ul>
                                        <li class="menu01"><a href="/datasearch/commant/selectWeekCommantList.do">서평</a></li>
                                        <li class="menu02">
                                            <a href="/datasearch/weeknewbook/selectWeekNewBookList.do">신간</a>
                                            <ul>
                                                <li><a href="/datasearch/weeknewbook/selectWeekNewBookList.do">금주의 신간</a></li>
                                                <li><a href="/datasearch/weeklyarticle/selectWeeklyarticleList.do">국내 주간지 기사</a></li>
                                                <li><a href="/datasearch/foreignlibdata/selectForeignLibDataList.do">외국도서관 기증자료</a></li>
                                            </ul>
                                        </li>
<!--                                         <li class="menu03"><a href="/datasearch/issuebook/selectIssueBookList.do">현안과 책</a></li> -->
                                        <li class="menu03"><a href="/libintroduce/etc/monthLibView.do">월간 국회도서관</a></li>
                                        <li class="menu04"><a href="https://www.nanet.go.kr/webzine/202005/main.html" target="_blank" class="wu" title="새창열기">국회도서관 웹진</a></li>
                                        <li class="menu05"><a href="/bookstory/recommendbook/selectRecommendBookList.do">국회의원 추천도서</a></li>



                                        <li class="menu06"><a href="/eBook/eBookInfo.do" >전자책(e-Book)</a></li>
										
                                    	<li class="menu07"><a href="/bookstory/curation/selectBookCurationList.do">북 큐레이션</a></li>
                                    	<!--<li class="menu08"><a href="/bookstory/curation/selectVideoCurationList.do">영상 큐레이션</a></li>-->
										

                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="./freeBoardList.do">이용자마당</a>
                            <div class="menuList user">
                                <div class="inner">
                                    <div class="text">
                                        <p>이용자마당</p>
                                        <p>도서관 이용자관련 서비스를<br/>찾아 보실 수 있습니다.</p>
                                    </div>
                                    <ul>
                                        <li class="menu01"><a href="/usermadang/notice/noticeList.do">공지사항</a></li>
                                        <li class="menu02">
                                        

<!-- 												<a href="/usermadang/reqreservation/useReserveInfo.do">신청 및 예약</a> -->

												<a href="/usermadang/bitchBookReqView.do">신청 및 예약</a>

												
                                            <ul>
                                                
                                                

													<li><a href="#" onclick="seatRegister();" title="새창열기">디지털정보센터 좌석예약</a></li>

	<!-- 												<li><a href="#" onclick="seatck();" title="새창열기">디지털정보센터 좌석예약</a></li> -->

													
                                                
                                                <li><a href="/usermadang/etc/nightUseReqView.do">야간 자료이용</a></li>
                                                <li><a href="/usermadang/bitchBookReqView.do">비치희망도서신청</a></li>
                                                <li><a href="/usermadang/etc/copyServiceView.do">자료복사</a></li>
                                                
                                                    <li><a href="/usermadang/etc/mailingServiceView.do">메일링 서비스</a></li>
                                                
                                                <li><a href="/usermadang/reqreservation/visitInfo.do">참관</a></li>

		                                        <!--<li>
		                                        <a href="/usermadang/reqreservation/useReserveInfo.do">국회도서관 이용 예약</a>
		                                        </li>-->

		                                        <!-- //20200702 추가 <span style="padding-left: 3px;vertical-align: none;"></span>-->
                                            </ul>
                                        </li>
                                        
                                        <!-- //20211026 임시 주석 s -->
                                        <li class="menu03">
                                        	<a href="/usermadang/etc/clView.do">납본·기증</a>
		                                    <ul>
		                                        <li><a href="/usermadang/etc/clView.do">납본</a></li>
		                                        <li><a href="/usermadang/etc/donView.do">기증</a></li>
		                                        <li><a href="/usermadang/etc/dataColView.do">자료수집정책</a></li>
		                                    </ul>                                        	
                                        </li> 
                                        <!-- //20211026 임시 주석 e -->
<!--                                         <li class="menu03"><a href="/usermadang/etc/payDonateView.do">납본·기증</a></li> -->
                                        
                                        <li class="menu04"><a href="/usermadang/etc/openApiView.do">Open API</a></li>
                                        <li class="menu05">
                                            <a href="/libaryuseinfo/faqServiceList.do">게시판</a>
                                            <ul>
                                                <li><a href="/libaryuseinfo/faqServiceList.do">자주하는 질문</a></li>
                                                <li><a href="/libaryuseinfo/selectQnaList.do">묻고답하기</a></li>
                                                <li><a href="./freeBoardList.do">자유게시판</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="./GuideServlet">도서관소개</a>
                            <div class="menuList intro">
                                <div class="inner">
                                    <div class="text">
                                        <p>도서관소개</p>
                                        <p>국회도서관을<br/>소개합니다.</p>
                                    </div>
                                    <ul>
                                        <li class="menu01">
                                            <a href="/libintroduce/etc/greetingView.do">국회도서관</a>
                                            <ul>
                                                <li><a href="/libintroduce/etc/greetingView.do">국회도서관장</a></li>
                                                <li><a href="/libintroduce/etc/orgJobView.do">조직 및 업무</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu02">
                                            <a href="/libintroduce/etc/pubDataview.do">개방·공유</a>
                                            <ul>
                                                <li><a href="/libintroduce/etc/pubDataview.do">발간자료</a></li>
                                                <li><a href="/libintroduce/etc/libDataStatusView.do">소장현황</a></li>
                                                <li><a href="/libintroduce/bododata/selectBodoDataList.do">사이버 홍보실</a></li>
                                                <li><a href="/comnet/academeet/academPubView.do">한국학술정보협의회</a></li>
                                                <li><a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a></li>
                                                <li><a href="/libintroduce/law/relLawList.do" >관계법규</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu04">
                                            <a href="/libaryuseinfo/libUseUserTimeView.do">도서관이용</a>
                                            <ul>
                                                <li><a href="/libaryuseinfo/libUseUserTimeView.do">이용안내</a></li>
                                                <li><a href="./GuideServlet">자료실</a></li>
                                                <li><a href="/libintroduce/etc/libDirectView.do">오시는 길</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div><!-- //메뉴 -->

                <div class="mo btnSearch">
                    <button type="button" class="btn_search">검색</button>
                </div>

                <div class="menuSearch pc">
                    <input type="text" id="searchQuery1" placeholder="홈페이지내 검색" title="검색어 입력창" onkeydown="javascript:if(event.keyCode == 13) totalSearch();" autocomplete="off" />
                    <button type="button" class="btn_search" onclick="totalSearch();">검색</button>
                </div>

                <div class="menuIcon"><a href="#none"><img src="${pageContext.request.contextPath}/resource/images/btn_hambuger.png" alt="전체메뉴"></a></div>
            </div>
        </div>
    </div>
    <div class="menuSearch mo">
    	<div class="btnClose"><button type="button" class="btn_close">닫기</button></div>
    	<input type="text" id="searchQuery2" title="검색어 입력창" placeholder="홈페이지내 검색" onkeydown="javascript:if(event.keyCode == 13) totalSearch();" autocomplete="off"/>
        <button type="button" class="btn_search" onkeydown="javascript:if(event.keyCode == 13) totalSearch();" onclick="totalSearch();">검색</button>
   	</div>

    <!-- 팝업메뉴 -->
    <div class="popupMenu">
        <div class="dim"></div>
        <div class="popupContainer">
            <p><em>전체메뉴</em><span class="close"><a href="#none">닫기</a></span></p>

            <!-- 모바일용 로그인 -->
            <div class="loginList mo">
                <div class="logo"><h1><a href="/main.do"><img src="${pageContext.request.contextPath}/resource/images/logo.png" alt="국회도서관"></a></h1></div>
                <div class="close"><a href="#">닫기</a></div>
                <ul>
                    <li><a href="/english/main.do" target="_blank" title="새창열기">ENGLISH</a></li>
<!--                     <li><a href="https://www.facebook.com/NationalAssemblyLibraryROK/" target="_blank" title="새창열기">국회도서관 SNS</a></li> -->
                    
                    
                        <li><a href="/member/mobilePassForm.do">모바일 간편열람증</a></li>
                    
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
                            <a href="/lowcontent/etccontents/assemblyInfoServiceView.do">국회의원·입법부</a>
                            <ul>
                                <li><a href="/lowcontent/etccontents/assemblyInfoServiceView.do">의회정보</a></li>
                                <li><a href="/lowcontent/etccontents/lowInfoServiceView.do">법률정보</a></li>
                                <li><a href="/lowcontent/etccontents/argos.do">지능형분석</a></li>
                                <li><a href="/lowcontent/etccontents/humanNetView.do">전문가정보데이터베이스</a></li>
                                <li><a href="/lowcontent/etccontents/assemblyPolicyDataDBView.do">국회의원 정책자료</a></li>
                                <li><a href="/lowcontent/etccontents/assemblyNationBodoData.do">국회·국회의원 보도자료</a></li>
                                <li><a href="/lowcontent/etccontents/communityView.do">국회·지방의회 의정정보</a></li>
                                <li><a href="/lowcontent/etccontents/dokdoIntro.do">독도홈페이지</a></li>
                                <li><a href="/lowcontent/etccontents/assemblyRecordInfoView.do"></a></li>   
                                <li><a href="/lowcontent/etccontents/assemblyBigDataSet.do">국회회의록 빅데이터</a></li>                               
                            </ul>
                        </li>
                        <li>
                            <a href="/datasearch/webdb/selectParliamentDBList.do">학술·연구자 클라우드</a>
                            <ul>
                                <li><a href="/datasearch/webdb/selectParliamentDBList.do">Web-DB</a></li>
                                <li><a href="/openaccess/openAccessList.do">오픈액세스 저널</a></li>
                                <li><a href="/comnet/knowshare/acdemShareView.do">학술연구자정보</a></li>
                                <li><a href="/comnet/knowshare/cloudView.do">국가학술정보</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/comnet/knowshare/knowShareView.do">저작권 서비스</a>
                            <ul>
                                <li><a href="/comnet/knowshare/knowShareView.do">지식공유</a></li>
                                <li><a href="/comnet/knowshare/uciView.do">디지털콘텐츠식별체계</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <span class="green">책이야기</span>
                    <ul class="depth">
                        <li><a href="/datasearch/commant/selectWeekCommantList.do">서평</a></li>
                        <li>
                            <a href="/datasearch/weeknewbook/selectWeekNewBookList.do">신간</a>
                            <ul>
                                <li><a href="/datasearch/weeknewbook/selectWeekNewBookList.do">금주의 신간</a></li>
                                <li><a href="/datasearch/weeklyarticle/selectWeeklyarticleList.do">국내 주간지 기사</a></li>
                                <li><a href="/datasearch/foreignlibdata/selectForeignLibDataList.do">외국도서관 기증자료</a></li>
                            </ul>
                        </li>
<!--                         <li><a href="/datasearch/issuebook/selectIssueBookList.do">현안과 책</a></li> onclick="javascript:eBook(); return false;"-->
                        <li><a href="/libintroduce/etc/monthLibView.do">월간 국회도서관</a></li>
                        <li><a href="https://www.nanet.go.kr/webzine/202005/main.html" target="_blank" class="wu" title="새창열기">국회도서관 웹진</a></li>
                        <li><a href="/bookstory/recommendbook/selectRecommendBookList.do">국회의원 추천도서</a></li>


						<li><a href="/eBook/eBookInfo.do" >전자책(e-Book)</a></li>
						
                         <li><a href="/bookstory/curation/selectBookCurationList.do">북 큐레이션</a></li>
				       <!--<li><a href="/bookstory/curation/selectVideoCurationList.do">영상 큐레이션</a></li>    -->                    
						
                    </ul>
                </li>
                <li>
                    <span>이용자마당</span>
                    <ul class="depth">
                        <li><a href="/usermadang/notice/noticeList.do">공지사항</a></li>
                        <li>
                        

<!-- 								<a href="/usermadang/reqreservation/useReserveInfo.do">신청 및 예약</a> -->

								<a href="/usermadang/bitchBookReqView.do">신청 및 예약</a>

								
                            <ul>
                                
                                

 									<li><a href="#" onclick="seatRegister();" title="새창열기">디지털정보센터 좌석예약</a></li>

<!--									<li><a href="#" onclick="seatck();" title="새창열기">디지털정보센터 좌석예약</a></li>  -->

                                    
                                
                                <li><a href="/usermadang/etc/nightUseReqView.do">야간 자료이용</a></li>
                                <li><a href="/usermadang/bitchBookReqView.do">비치희망도서신청</a></li>
                                <li><a href="/usermadang/etc/copyServiceView.do">자료복사</a></li>
                                
                                    <li><a href="/usermadang/etc/mailingServiceView.do">메일링 서비스</a></li>
                                
                                <li><a href="/usermadang/reqreservation/visitInfo.do">참관</a></li>

                               <!-- <li>
                                <a href="/usermadang/reqreservation/useReserveInfo.do">국회도서관 이용 예약</a>
                                </li>-->

                                <!-- //20200702 추가 <span style="padding-left: 3px;vertical-align: none;"></span>-->
                            </ul>
                        </li>
                        
                        <!-- //20211026 임시 주석 s -->
                        <li>
                        	<a href="/usermadang/etc/clView.do">납본·기증</a>
                            <ul>
                                <li><a href="/usermadang/etc/clView.do">납본</a></li>
                                <li><a href="/usermadang/etc/donView.do">기증</a></li>
                                <li><a href="/usermadang/etc/dataColView.do">자료수집정책</a></li>
                            </ul>
                        </li> 
                        <!-- //20211026 임시 주석 e -->
<!--                         <li><a href="/usermadang/etc/payDonateView.do">납본·기증</a></li> -->
                        
                        <li><a href="/usermadang/etc/openApiView.do">Open API</a></li>
                        <li>
                            <a href="/libaryuseinfo/faqServiceList.do">게시판</a>
                            <ul>
                                <li><a href="/libaryuseinfo/faqServiceList.do">자주하는 질문</a></li>
                                <li><a href="/libaryuseinfo/selectQnaList.do">묻고답하기</a></li>
                                <li><a href="./freeBoardList.do">자유게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <span>도서관소개</span>
                    <ul class="depth">
                        <li>
                            <a href="/libintroduce/etc/greetingView.do">국회도서관</a>
                            <ul>
                                <li><a href="/libintroduce/etc/greetingView.do">국회도서관장</a></li>
                                <li><a href="/libintroduce/etc/orgJobView.do">조직 및 업무</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/libintroduce/etc/pubDataview.do">개방·공유</a>
                            <ul>
                                <li><a href="/libintroduce/etc/pubDataview.do">발간자료</a></li>
                                <li><a href="/libintroduce/etc/libDataStatusView.do">소장현황</a></li>
                                <li><a href="/libintroduce/bododata/selectBodoDataList.do">사이버 홍보실</a></li>
                                <li>
                                    <a href="/comnet/academeet/academPubView.do">한국학술정보협의회</a>
                                    <ul class="depth3">
<!--                                         <li><a href="/comnet/academeet/meetConferensView.do">제20차 정기총회 및 콘퍼런스</a></li> -->
                                        <li><a href="/comnet/academeet/academPubView.do">협정체결절차</a></li>
                                        <li><a href="/comnet/academeet/academInfoView.do">협의회 및 협정기관 소개</a></li>
                                        
                                    </ul>
                                </li>
                                <li>
                                    <a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a>
                                    <ul class="depth3">
                                        <li><a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a></li>
                                        <li><a href="https://open.assembly.go.kr/portal/data/service/selectServicePage.do/OTA0YC001127RJ11880" target="_blank" title="새창열기">업무추진비</a></li>
                                    </ul>
                                </li>
                                <li><a href="/libintroduce/law/relLawList.do" >관계법규</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/libaryuseinfo/libUseUserTimeView.do">도서관이용</a>
                            <ul>
                                <li>
                                    <a href="/libaryuseinfo/libUseUserTimeView.do">이용안내</a>
                                    <ul class="depth3">
                                        <li><a href="/libaryuseinfo/libUseUserTimeView.do">이용 대상 및 시간</a></li>
                                        <li><a href="/libaryuseinfo/libSetepCencelView.do">이용 제한 자료</a></li>
                                        
                                        <li><a href="/libaryuseinfo/disblePersonUseView.do">장애인 이용</a></li>
                                        <li><a href="/libaryuseinfo/libuseStepView.do">출입 절차 및 준수사항</a></li>
                                        <li><a href="/libaryuseinfo/mobileServiceView.do">모바일 서비스</a></li>
                                    </ul>
                                </li>
                                <li><a href="./GuideServlet">자료실</a></li>
                                <li><a href="/libintroduce/etc/libDirectView.do">오시는 길</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <span>마이페이지</span>
                    <ul class="depth">
                        
                            
						        <li><a href="/loginForm.do">로그인</a></li>
                                <li><a href="/member/selectMember.do">회원가입</a></li>
                                <li><a href="/member/searchIdPwdForm.do">아이디/비밀번호 찾기</a></li>

                                <li>
                                    <a href="/member/mobilePassForm.do">열람증</a>
                                    <ul>
                                        <li><a href="/member/mobilePassForm.do">모바일 간편열람증</a></li>
<!--                                         <li><a href="/member/studentPassForm.do">학생증 시범사업</a></li> -->
                                    </ul>
                                </li>

                            
                            
                        
                    </ul>
                </li>
                
                
                <li>
                    <span>기타</span>
                    <ul class="depth">
                        <li><a href="/member/persionlInfoView.do">개인정보처리방침</a></li>
                        <li><a href="/member/mailrefusalView.do">이메일수집거부</a></li>
                        <li><a href="/member/totalsearchList.do">홈페이지 내 검색</a></li>
                        <li><a href="/main.do?flag=dl">전자도서관 검색</a></li>
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
//     				alert("서버와의 통신이 실패했습니다.");
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
                <li data-url="/libintroduce/etc/greetingView.do, /libintroduce/etc/mieVisionView.do, /libintroduce/etc/yearHistoryView.do, /libintroduce/etc/schedulingRequest.do,
                                /libintroduce/etc/schedulingRequestConfirm.do, /libintroduce/etc/orgJobView.do">
                    <a href="/libintroduce/etc/greetingView.do">국회도서관</a>
                    <ul>
                        <li data-url="/libintroduce/etc/greetingView.do, /libintroduce/etc/mieVisionView.do, /libintroduce/etc/yearHistoryView.do, /libintroduce/etc/schedulingRequest.do,
                                /libintroduce/etc/schedulingRequestConfirm.do">
                            <a href="/libintroduce/etc/greetingView.do">국회도서관장</a>
                        </li>
                        <li data-url="/libintroduce/etc/orgJobView.do"><a href="/libintroduce/etc/orgJobView.do">조직 및 업무</a></li>
                    </ul>
                </li>
                <li data-url="/libintroduce/etc/pubDataview.do, /libintroduce/etc/yearReportView.do, /libintroduce/etc/libIntroducView.do, /libintroduce/etc/poyReschView.do,
                                /libintroduce/etc/poyReschDetail.do, /libintroduce/etc/expertRepList.do, /libintroduce/etc/expertRepDetail.do, /libintroduce/etc/libDataStatusView.do,
                                /libintroduce/bododata/selectBodoDataList.do, /libintroduce/bododata/selectLog.do, /libintroduce/bododata/libVideoList.do, /libintroduce/bododata/libVideoView.do,
                                /libintroduce/bododata/libPhotoList.do, /libintroduce/bododata/libPhotoView.do,
                                /comnet/academeet/meetConferensView.do, /comnet/academeet/academInfoView.do, /comnet/academeet/academPubView.do, /comnet/academeet/organInfoView.do,
                                /comnet/academeet/orgContact.do, /comnet/academeet/organInfoView.do, /comnet/academeet/organNoticeList.do, /comnet/academeet/noticeDetail.do,
                                /comnet/academeet/organFileList.do, /comnet/academeet/fileDetail.do, /comnet/academeet/organPhotoList.do, /comnet/academeet/photoDetail.do,
                                /comnet/academeet/orgnPcInfoView.do, /comnet/academeet/meetConferensViewPast.do, /comnet/academeet/acadeHistoryView.do">
                    <a href="/libintroduce/etc/pubDataview.do">개방·공유</a>
                    <ul>
                        <li data-url="/libintroduce/etc/pubDataview.do, /libintroduce/etc/yearReportView.do, /libintroduce/etc/libIntroducView.do, /libintroduce/etc/poyReschView.do,
                                /libintroduce/etc/poyReschDetail.do, /libintroduce/etc/expertRepList.do, /libintroduce/etc/expertRepDetail.do, /libintroduce/etc/fackbookView.do, /libintroduce/busan/pubDataview.do">
                            <a href="/libintroduce/etc/pubDataview.do">발간자료</a>
                        </li>
                        <li data-url="/libintroduce/etc/libDataStatusView.do"><a href="/libintroduce/etc/libDataStatusView.do">소장현황</a></li>
                        <li data-url="/libintroduce/bododata/selectBodoDataList.do, /libintroduce/bododata/selectLog.do, /libintroduce/bododata/libVideoList.do, /libintroduce/bododata/libVideoView.do,
                                        /libintroduce/bododata/libPhotoList.do, /libintroduce/bododata/libPhotoView.do">
                            <a href="/libintroduce/bododata/selectBodoDataList.do">사이버 홍보실</a>
                        </li>
                        <li data-url="/comnet/academeet/meetReqest.do, /comnet/academeet/meetConferensView.do, /comnet/academeet/academInfoView.do, /comnet/academeet/academPubView.do, /comnet/academeet/organInfoView.do,
                                        /comnet/academeet/orgContact.do, /comnet/academeet/organInfoView.do, /comnet/academeet/organNoticeList.do, /comnet/academeet/noticeDetail.do,
                                        /comnet/academeet/organFileList.do, /comnet/academeet/fileDetail.do, /comnet/academeet/organPhotoList.do, /comnet/academeet/photoDetail.do,
                                        /comnet/academeet/orgnPcInfoView.do, /comnet/academeet/meetConferensViewPast.do, /comnet/academeet/meetGayoView.do,
                                        /comnet/academeet/meetExhCom.do, /comnet/academeet/orgnPcInfoView.do, /comnet/academeet/meetConferensViewPast.do, /comnet/academeet/acadeHistoryView.do,
                                        /comnet/academeet/meetReqInfoView.do, /comnet/academeet/meetReqestList.do, /comnet/academeet/meetRegistryForm.do,/comnet/academeet/meetPictureGallery.do,/comnet/academeet/meetMedia.do,
                                         /comnet/academeet/meetRegistryList.do, /comnet/academeet/meetTour.do" class="depth">
                            <a href="#">한국학술정보협의회</a>
                            <ul class="depth3">
                            
<!--                                 <li data-url="/comnet/academeet/meetConferensView.do, /comnet/academeet/meetGayoView.do, /comnet/academeet/meetExhCom.do, /comnet/academeet/meetReqest.do,/comnet/academeet/meetPictureGallery.do,/comnet/academeet/meetMedia.do,  -->
<!--                                 /comnet/academeet/meetReqInfoView.do, /comnet/academeet/meetReqestList.do, /comnet/academeet/meetRegistryForm.do, /comnet/academeet/meetRegistryList.do, /comnet/academeet/meetTour.do"><a href="/comnet/academeet/meetConferensView.do">제20차 정기총회 및 콘퍼런스</a></li> -->
                                
                                
                                
                                <li data-url="/comnet/academeet/academPubView.do"><a href="/comnet/academeet/academPubView.do">협정체결절차</a></li>
                                <li data-url="/comnet/academeet/organInfoView.do, /comnet/academeet/orgContact.do, /comnet/academeet/organNoticeList.do, /comnet/academeet/academInfoView.do,
                                                /comnet/academeet/meetConferensViewPast.do, /comnet/academeet/acadeHistoryView.do">
                                    <a href="/comnet/academeet/academInfoView.do">협의회 및 협정기관 소개</a>
                                </li>
                                
                                
                            </ul>
                        </li>
                        <li class="depth">
                            <a href="#">정보공개</a>
                            <ul class="depth3">
                                <li><a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a></li>
                                <li><a href="https://open.assembly.go.kr/portal/data/service/selectServicePage.do/OTA0YC001127RJ11880" target="_blank" title="새창열기">업무추진비</a></li>
                            </ul>
                        </li>
                        <li data-url="/libintroduce/law/relLawList.do, /libintroduce/law/relLawDetail.do"><a href="/libintroduce/law/relLawList.do">관계법규</a></li>
                    </ul>
                </li>
                <li data-url="/libaryuseinfo/libUseUserTimeView.do, /libaryuseinfo/libSetepCencelView.do, /libaryuseinfo/libUseYoungPeople.do, /libaryuseinfo/disblePersonUseView.do,
                                /libaryuseinfo/libuseStepView.do, /libaryuseinfo/mobileServiceView.do, /libaryuseinfo/infomationView.do, /libintroduce/etc/libDirectView.do">
                    <a href="/libaryuseinfo/libUseUserTimeView.do">도서관이용</a>
                    <ul>
                        <li data-url="/libaryuseinfo/libUseUserTimeView.do, /libaryuseinfo/libSetepCencelView.do, /libaryuseinfo/libUseYoungPeople.do,
                                        /libaryuseinfo/disblePersonUseView.do, /libaryuseinfo/libuseStepView.do, /libaryuseinfo/mobileServiceView.do" class="depth">
                            <a href="#">이용안내</a>
                            <ul class="depth3">
                                <li data-url="/libaryuseinfo/libUseUserTimeView.do"><a href="/libaryuseinfo/libUseUserTimeView.do">이용 대상 및 시간</a></li>
                                <li data-url="/libaryuseinfo/libSetepCencelView.do"><a href="/libaryuseinfo/libSetepCencelView.do">이용 제한 자료</a></li>
                                
                                <li data-url="/libaryuseinfo/disblePersonUseView.do"><a href="/libaryuseinfo/disblePersonUseView.do">장애인 이용</a></li>
                                <li data-url="/libaryuseinfo/libuseStepView.do"><a href="/libaryuseinfo/libuseStepView.do">출입 절차 및 준수사항</a></li>
                                <li data-url="/libaryuseinfo/mobileServiceView.do"><a href="/libaryuseinfo/mobileServiceView.do">모바일 서비스</a></li>
                            </ul>
                        </li>
                        <li data-url="/libaryuseinfo/infomationView.do"><a href="./GuideServlet">자료실</a></li>
                        <li data-url="/libintroduce/etc/libDirectView.do"><a href="/libintroduce/etc/libDirectView.do">오시는 길</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- //왼쪽메뉴 -->
    </div>
	

















<script type="text/javascript">
//<![CDATA[ 
	$(function(){
		
		//금주의 서평 더보기 버튼
		$(document).on("click", "#searchPlus ", function(e) {
			e.preventDefault();
			
			var keyCode = $("#searchKeyCode option:selected").val();
			var keyWord = $("#searchKeyWord").val();
			var subject = $("#selectSubject option:selected").val();
			var weeks = $("#searchWeeks option:selected").val();
			var nowPage = $("#searchNowPage").val();
			var param = "searchKeyCode="+keyCode+"&searchKeyWord="+keyWord+"&selectSubject="+subject+"&searchWeeks="+weeks+"&nowPage="+nowPage;

			var _protocol = 'https://';
			var _host = 'nanet.go.kr';

			if(location.hostname == 'host'){
				_host = '';
			}

			if(location.protocol == 'https://'){
				_protocol = '';
			}

			$.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/datasearch/commant/ajaxSelectWeek.do'
				, data: param
				, success: function(resultData) {
					var total = resultData.data[0].total; //목록총데이터건수
					var nowPage = resultData.data[0].nowPage; //현재페이징
					var listLen = resultData.data[0].list; //목록건수
					$("#searchNowPage").val(nowPage);  

					if(listLen != 0){
						for(var i = 1; i <= resultData.data.length-1; i++){
							var innerHtml = "";
							
							innerHtml += " <div class=\"bookList weeks\">  <div class=\"bookImg bookImgHeight\"> ";
							if(resultData.data[i].pdffile == ""){
								innerHtml += " <a href=\"javascript:weekCommantDetail('"+resultData.data[i].seq+"');\"> ";
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"'  style='cursor: pointer;' onclick=\"weekCommantDetail('"+resultData.data[i].seq+"');\" alt='"+resultData.data[i].seq+"' /></a> ";
							}
							else if(resultData.data[i].pdffile != ""){
								innerHtml += " <a href='#;return false;' onclick=\"viewPdfFile('"+resultData.data[i].pdffile+"'); return false;\"> ";
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"' alt='"+resultData.data[i].sign+"' /> </a>  ";
							}
							else if(resultData.data[i].imageUrl3 == "" || resultData.data[i].imageUrl3 == "/attachfiles/arrivalinfo/Thum" ){
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							else if(resultData.data[i].imageUrl3 != ""){
        						innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl3+"'  alt='"+resultData.data[i].sign+"'  />   ";
        					}
        					innerHtml += " </div> ";
        					innerHtml += " <div class='bookInfo' '> "; //id='myDiv"+i+"
        					innerHtml += " <h4><a href=\"javascript:weekCommantDetail('"+resultData.data[i].seq+"');\" style='cursor: pointer;' title='"+resultData.data[i].sign+"'>"+resultData.data[i].sign+"</a></h4> ";
							
        					innerHtml += " <ul> ";
        					innerHtml += " <li><span class='title'>분야 :</span><span class='con'>"+resultData.data[i].subject+"</span></li> ";
        					innerHtml += " <li><span class='title'>편·저자 :</span><span class='simplify'>"+resultData.data[i].writer+"</span></li> ";
        					innerHtml += " <li><span class='title'>서평자 :</span><span class='con'>"+resultData.data[i].reviewer+"</span></li> ";
        					innerHtml += " <li><span class='title'>소속 :</span><span class='con'>"+resultData.data[i].pubarea+"</span></li> ";
        					if(resultData.data[i].pubnumber != ""){
            					innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubnumber+"호("+resultData.data[i].pubdate+")</span></li> ";        						
        					}else{
        						innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubdate+"</span></li> ";
        					}
							innerHtml += " </ul>  </div> </div> ";
							
							$("#bookListLeftBox").append(innerHtml);							
						}
						if($(".weeks").length == total){
							$(".more").hide();
						}
					}else{
						alert('검색 결과가 없습니다.');
						return false;
					}

				}, error: function(data, status, err) {
// 					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
		});
		
		//사서 서평 더보기 버튼
		$(document).on("click", "#searchPlusLib ", function(e) {
			e.preventDefault();
			
			var keyCode = $("#searchKeyCode option:selected").val();
			var keyWord = $("#searchKeyWord").val();
			var subject = $("#selectSubject option:selected").val();
			var weeks = $("#searchWeeks option:selected").val();
			var nowPage = $("#searchNowLibPage").val();
			var param = "searchKeyCode="+keyCode+"&searchKeyWord="+keyWord+"&selectSubject="+subject+"&searchWeeks="+weeks+"&nowPage="+nowPage;

			var _protocol = 'https://';
			var _host = 'nanet.go.kr';

			if(location.hostname == 'host'){
				_host = '';
			}

			if(location.protocol == 'https://'){
				_protocol = '';
			}
			
	        $.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/datasearch/commant/ajaxSelectLib.do'
				, data: param
				, success: function(resultData) {
					var total = resultData.data[0].total; //목록총데이터건수
					var nowPage = resultData.data[0].nowPage; //현재페이징
					var listLen = resultData.data[0].list; //목록건수
					$("#searchNowLibPage").val(nowPage);  

					if(listLen != 0){
						for(var i = 1; i <= resultData.data.length-1; i++){
							var innerHtml = "";
							
							innerHtml += " <div class=\"bookList Lib\">  <div class=\"bookImg bookImgHeight\"> ";
							if(resultData.data[i].pdffile == ""){
								innerHtml += " <a href=\"javascript:LibrarianCommantDetail('"+resultData.data[i].seq+"');\"> ";
								innerHtml += " <img src='" + _protocol + _host + resultData.data[i].imageUrl+"'  style='cursor: pointer;' onclick=\"LibrarianCommantDetail('"+resultData.data[i].seq+"');\" alt='"+resultData.data[i].seq+"' /></a> ";
							}
							else if(resultData.data[i].pdffile != ""){
								innerHtml += " <a href='#;return false;' onclick=\"viewPdfFile('"+resultData.data[i].pdffile+"'); return false;\"> ";
								innerHtml += " <img src='" + _protocol + _host + resultData.data[i].imageUrl+"' alt='"+resultData.data[i].sign+"' /> </a>  ";
							}
							else if(resultData.data[i].imageUrl3 == "" || resultData.data[i].imageUrl3 == "/attachfiles/arrivalinfo/Thum" ){
								innerHtml += " <img src='" + _protocol + _host + resultData.data[i].imageUrl+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							else if(resultData.data[i].imageUrl3 != ""){
        						innerHtml += " <img src='" + _protocol + _host + resultData.data[i].imageUrl3+"'  alt='"+resultData.data[i].sign+"'  />   ";
        					}
        					innerHtml += " </div> ";
        					innerHtml += " <div class='bookInfo' > "; //id='myDiv"+i+"'
        					innerHtml += " <h4><a href=\"javascript:LibrarianCommantDetail('"+resultData.data[i].seq+"');\" style='cursor: pointer;' title='"+resultData.data[i].sign+"'>"+resultData.data[i].sign+"</a></h4> ";
							
        					innerHtml += " <ul> ";
        					innerHtml += " <li><span class='title'>분야 :</span><span class='con'>"+resultData.data[i].subject+"</span></li> ";
        					innerHtml += " <li><span class='title'>편·저자 :</span><span class='simplify'>"+resultData.data[i].writer+"</span></li> ";
        					innerHtml += " <li><span class='title'>서평자 :</span><span class='con'>"+resultData.data[i].reviewer+"</span></li> ";
        					innerHtml += " <li><span class='title'>소속 :</span><span class='con'>"+resultData.data[i].pubarea+"</span></li> ";
        					if(resultData.data[i].pubnumber != ""){
            					innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubnumber+"호("+resultData.data[i].pubdate+")</span></li> ";        						
        					}else{
        						innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubdate+"</span></li> ";
        					}
							innerHtml += " </ul>  </div> </div> ";
							
							$("#bookListLeftBoxLib").append(innerHtml);							
						}
						if($(".Lib").length == total){
							$(".LibMore").hide();
						}
					}else{
						alert('검색 결과가 없습니다.');
						return false;
					}

				}, error: function(data, status, err) {
// 					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
		});
		
		//열린 서평 더보기 버튼
		$(document).on("click", "#searchPlusOpen ", function(e) {
			e.preventDefault();
			
			var keyCode = $("#searchKeyCode option:selected").val();
			var keyWord = $("#searchKeyWord").val();
			var subject = $("#selectSubject option:selected").val();
			var weeks = $("#searchWeeks option:selected").val();
			var nowPage = $("#searchNowOpenPage").val();
			var openDivCode = $(":input:radio[name=openDivCode]:checked").val();  //라디오버튼 체크 값

			var param = "searchKeyCode="+keyCode+"&searchKeyWord="+keyWord+"&selectSubject="+subject+"&searchWeeks="+weeks+"&nowPage="+nowPage+"&openDivCode="+openDivCode;

			var _protocol = 'https://';
			var _host = 'nanet.go.kr';

			if(location.hostname == 'host'){
				_host = '';
			}

			if(location.protocol == 'https://'){
				_protocol = '';
			}

	        $.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/datasearch/commant/ajaxSelectOpen.do'
				, data: param
				, success: function(resultData) {
					var total = resultData.data[0].total; //목록총데이터건수
					var nowPage = resultData.data[0].nowPage; //현재페이징
					var listLen = resultData.data[0].list; //목록건수
					$("#searchNowOpenPage").val(nowPage);  

					if(listLen != 0){
						for(var i = 1; i <= resultData.data.length-1; i++){
							var innerHtml = "";
							
							innerHtml += " <div class=\"bookList Open\">  <div class=\"bookImg bookImgHeight\"> ";
							if(resultData.data[i].pdffile == ""){
								innerHtml += " <a href=\"javascript:openCommantDetail('"+resultData.data[i].seq+"');\"> ";
								innerHtml += " <img src='" + _protocol + _host + resultData.data[i].imageUrl+"'  style='cursor: pointer;' onclick=\"openCommantDetail('"+resultData.data[i].seq+"');\" alt='"+resultData.data[i].seq+"' /></a> ";
							}
							else if(resultData.data[i].pdffile != ""){
								innerHtml += " <a href='#;return false;' onclick=\"viewPdfFile('"+resultData.data[i].pdffile+"'); return false;\"> ";
								innerHtml += " <img src='"+ _protocol + _host + resultData.data[i].imageUrl+"' alt='"+resultData.data[i].sign+"' /> </a>  ";
							}
							else if(resultData.data[i].imageUrl3 == "" || resultData.data[i].imageUrl3 == "/attachfiles/arrivalinfo/Thum" ){
								innerHtml += " <img src='"+ _protocol + _host + resultData.data[i].imageUrl+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							else if(resultData.data[i].imageUrl3 != ""){
        						innerHtml += " <img src='"+ _protocol + _host + resultData.data[i].imageUrl3+"'  alt='"+resultData.data[i].sign+"'  />   ";
        					}
        					innerHtml += " </div> ";
        					innerHtml += " <div class='bookInfo' > "; //id='myDiv"+i+"'
							if($.trim(resultData.data[i].type) == 'open'){
								innerHtml += " <h4><a href=\"javascript:openCommantDetail('"+resultData.data[i].seq+"');\" style='cursor: pointer;' title='"+resultData.data[i].sign+"'>"+resultData.data[i].sign+"</a></h4> ";
							}else{
								innerHtml += " <h4><a href=\"javascript:LibrarianCommantDetail('"+resultData.data[i].seq+"');\" style='cursor: pointer;' title='"+resultData.data[i].sign+"'>"+resultData.data[i].sign+"</a></h4> ";
							}

        					innerHtml += " <ul> ";
        					innerHtml += " <li><span class='title'>분야 :</span><span class='con'>"+resultData.data[i].subject+"</span></li> ";
        					innerHtml += " <li><span class='title'>편·저자 :</span><span class='simplify'>"+resultData.data[i].writer+"</span></li> ";
        					innerHtml += " <li><span class='title'>서평자 :</span><span class='con'>"+resultData.data[i].reviewer+"</span></li> ";
        					innerHtml += " <li><span class='title'>소속 :</span><span class='con'>"+resultData.data[i].pubarea+"</span></li> ";
        					if(resultData.data[i].pubnumber != ""){
            					innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubnumber+"호("+resultData.data[i].pubdate+")</span></li> ";        						
        					}else{
        						innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubdate+"</span></li> ";
        					}
							innerHtml += " </ul>  </div> </div> ";
							
							$("#bookListLeftBoxOpen").append(innerHtml);							
						}
						if($(".Open").length == total){
							$(".OpenMore").hide();
						}
					}else{
						alert('검색 결과가 없습니다.');
						return false;
					}

				}, error: function(data, status, err) {
// 					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
		});




		// 열린 서평 + 사서 서평 더보기 버튼
		$(document).on("click", "#searchPlusOpenCommant ", function(e) {
			e.preventDefault();

			var keyCode = $("#searchKeyCode option:selected").val();
			var keyWord = $("#searchKeyWord").val();
			var subject = $("#selectSubject option:selected").val();
			var weeks = $("#searchWeeks option:selected").val();
			var nowPage = $("#searchNowOpenPage").val();
			var openDivCode = $(":input:radio[name=openDivCode]:checked").val();  //라디오버튼 체크 값

			var param = "searchKeyCode="+keyCode+"&searchKeyWord="+keyWord+"&selectSubject="+subject+"&searchWeeks="+weeks+"&nowPage="+nowPage+"&openDivCode="+openDivCode;

			var _protocol = 'https://';
			var _host = 'nanet.go.kr';

			if(location.hostname == 'host'){
				_host = '';
			}

			if(location.protocol == 'https://'){
				_protocol = '';
			}

			$.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/datasearch/commant/ajaxSelectOpenCommant.do'
				, data: param
				, success: function(resultData) {
					var total = resultData.data[0].total; //목록총데이터건수
					var nowPage = resultData.data[0].nowPage; //현재페이징
					var listLen = resultData.data[0].list; //목록건수
					$("#searchNowOpenPage").val(nowPage);

					if(listLen != 0){
						for(var i = 1; i <= resultData.data.length-1; i++){
							var innerHtml = "";

							innerHtml += " <div class=\"bookList Open\">  <div class=\"bookImg bookImgHeight\"> ";
							if(resultData.data[i].pdffile == ""){
								innerHtml += " <a href=\"javascript:openCommantDetail('"+resultData.data[i].seq+"');\"> ";
								innerHtml += " <img src='" + _protocol + _host + resultData.data[i].imageUrl+"'  style='cursor: pointer;' onclick=\"openCommantDetail('"+resultData.data[i].seq+"');\" alt='"+resultData.data[i].seq+"' /></a> ";
							}
							else if(resultData.data[i].pdffile != ""){
								innerHtml += " <a href='#;return false;' onclick=\"viewPdfFile('"+resultData.data[i].pdffile+"'); return false;\"> ";
								innerHtml += " <img src='"+ _protocol + _host + resultData.data[i].imageUrl+"' alt='"+resultData.data[i].sign+"' /> </a>  ";
							}
							else if(resultData.data[i].imageUrl3 == "" || resultData.data[i].imageUrl3 == "/attachfiles/arrivalinfo/Thum" ){
								innerHtml += " <img src='"+ _protocol + _host + resultData.data[i].imageUrl+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							else if(resultData.data[i].imageUrl3 != ""){
								innerHtml += " <img src='"+ _protocol + _host + resultData.data[i].imageUrl3+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							innerHtml += " </div> ";
							innerHtml += " <div class='bookInfo' > "; //id='myDiv"+i+"'
							if($.trim(resultData.data[i].type) == 'open'){
								innerHtml += " <h4><a href=\"javascript:openCommantDetail('"+resultData.data[i].seq+"');\" style='cursor: pointer;' title='"+resultData.data[i].sign+"'>"+resultData.data[i].sign+"</a></h4> ";
							}else{
								innerHtml += " <h4><a href=\"javascript:LibrarianCommantDetail('"+resultData.data[i].seq+"');\" style='cursor: pointer;' title='"+resultData.data[i].sign+"'>"+resultData.data[i].sign+"</a></h4> ";
							}

							innerHtml += " <ul> ";
							innerHtml += " <li><span class='title'>분야 :</span><span class='con'>"+resultData.data[i].subject+"</span></li> ";
							innerHtml += " <li><span class='title'>편·저자 :</span><span class='simplify'>"+resultData.data[i].writer+"</span></li> ";
							innerHtml += " <li><span class='title'>서평자 :</span><span class='con'>"+resultData.data[i].reviewer+"</span></li> ";
							innerHtml += " <li><span class='title'>소속 :</span><span class='con'>"+resultData.data[i].pubarea+"</span></li> ";
							if(resultData.data[i].pubnumber != ""){
								innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubnumber+"호("+resultData.data[i].pubdate+")</span></li> ";
							}else{
								innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubdate+"</span></li> ";
							}
							innerHtml += " </ul>  </div> </div> ";

							$("#bookListLeftBoxOpen").append(innerHtml);
						}
						if($(".Open").length == total){
							$(".OpenMore").hide();
						}
					}else{
						alert('검색 결과가 없습니다.');
						return false;
					}

				}, error: function(data, status, err) {
// 					alert("서버와의 통신이 실패했습니다.");
				}
			});
		});





		// 전문가 서평 더보기 버튼
		$(document).on("click", "#searchPlusHumanCommant ", function(e) {
			e.preventDefault();

			var keyCode = $("#searchKeyCode option:selected").val();
			var keyWord = $("#searchKeyWord").val();
			var subject = $("#selectSubject option:selected").val();
			var weeks = $("#searchWeeks option:selected").val();
			var nowPage = $("#searchNowHumanPage").val();

			var param = "searchKeyCode="+keyCode+"&searchKeyWord="+keyWord+"&selectSubject="+subject+"&searchWeeks="+weeks+"&nowPage="+nowPage;

			var _protocol = 'https://';
			var _host = 'nanet.go.kr';

			if(location.hostname == 'host'){
				_host = '';
			}

			if(location.protocol == 'https://'){
				_protocol = '';
			}

			$.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/datasearch/commant/ajaxSelectHumanCommant.do'
				, data: param
				, success: function(resultData) {
					var total = resultData.data[0].total; //목록총데이터건수
					var nowPage = resultData.data[0].nowPage; //현재페이징
					var listLen = resultData.data[0].list; //목록건수
					$("#searchNowHumanPage").val(nowPage);

					if(listLen != 0){
						for(var i = 1; i <= resultData.data.length-1; i++){
							var innerHtml = "";

							innerHtml += " <div class=\"bookList Human\">  <div class=\"bookImg bookImgHeight\"> ";
							if(resultData.data[i].pdffile == ""){
								innerHtml += " <a href=\"javascript:humanCommantDetail('"+resultData.data[i].seq+"');\"> ";
								innerHtml += " <img src='" + _protocol + _host + resultData.data[i].imageUrl+"'  style='cursor: pointer;' onclick=\"humanCommantDetail('"+resultData.data[i].seq+"');\" alt='"+resultData.data[i].seq+"' /></a> ";
							}
							else if(resultData.data[i].pdffile != ""){
								innerHtml += " <a href='#;return false;' onclick=\"viewPdfFile('"+resultData.data[i].pdffile+"'); return false;\"> ";
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"' alt='"+resultData.data[i].sign+"' /> </a>  ";
							}
							else if(resultData.data[i].imageUrl3 == "" || resultData.data[i].imageUrl3 == "/attachfiles/arrivalinfo/Thum" ){
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							else if(resultData.data[i].imageUrl3 != ""){
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl3+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							innerHtml += " </div> ";
							innerHtml += " <div class='bookInfo' > "; //id='myDiv"+i+"'
							innerHtml += " <h4><a href=\"javascript:humanCommantDetail('"+resultData.data[i].seq+"');\" style='cursor: pointer;' title='"+resultData.data[i].sign+"'>"+resultData.data[i].sign+"</a></h4> ";

							innerHtml += " <ul> ";
							innerHtml += " <li><span class='title'>분야 :</span><span class='con'>"+resultData.data[i].subject+"</span></li> ";
							innerHtml += " <li><span class='title'>편·저자 :</span><span class='simplify'>"+resultData.data[i].writer+"</span></li> ";
							innerHtml += " <li><span class='title'>서평자 :</span><span class='con'>"+resultData.data[i].reviewer+"</span></li> ";
							innerHtml += " <li><span class='title'>소속 :</span><span class='con'>"+resultData.data[i].pubarea+"</span></li> ";
							if(resultData.data[i].pubnumber != ""){
								innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubnumber+"호("+resultData.data[i].pubdate+")</span></li> ";
							}else{
								innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubdate+"</span></li> ";
							}
							innerHtml += " </ul>  </div> </div> ";

							$("#bookListLeftBoxHuman").append(innerHtml);
						}
						if($(".Human").length == total){
							$(".HumanMore").hide();
						}
					}else{
						alert('검색 결과가 없습니다.');
						return false;
					}

				}, error: function(data, status, err) {
// 					alert("서버와의 통신이 실패했습니다.");
				}
			});
		});



		// 금주의 서평 더보기 버튼
		$(document).on("click", "#searchPlusCommant ", function(e) {
			e.preventDefault();

			var keyCode = $("#searchKeyCode option:selected").val();
			var keyWord = $("#searchKeyWord").val();
			var subject = $("#selectSubject option:selected").val();
			var weeks = $("#searchWeeks option:selected").val();
			var nowPage = $("#searchNowPage").val();
			var param = "searchKeyCode="+keyCode+"&searchKeyWord="+keyWord+"&selectSubject="+subject+"&searchWeeks="+weeks+"&nowPage="+nowPage;

			var _protocol = 'https://';
			var _host = 'nanet.go.kr';

			if(location.hostname == 'host'){
				_host = '';
			}

			if(location.protocol == 'https://'){
				_protocol = '';
			}

			$.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/datasearch/commant/ajaxSelectWeekCommant.do'
				, data: param
				, success: function(resultData) {
					var total = resultData.data[0].total; //목록총데이터건수
					var nowPage = resultData.data[0].nowPage; //현재페이징
					var listLen = resultData.data[0].list; //목록건수
					$("#searchNowPage").val(nowPage);

					if(listLen != 0){
						for(var i = 1; i <= resultData.data.length-1; i++){
							var innerHtml = "";

							innerHtml += " <div class=\"bookList weeks\">  <div class=\"bookImg bookImgHeight\"> ";
							if(resultData.data[i].pdffile == ""){
								innerHtml += " <a href=\"javascript:weekCommantDetail('"+resultData.data[i].seq+"');\"> ";
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"'  style='cursor: pointer;' onclick=\"weekCommantDetail('"+resultData.data[i].seq+"');\" alt='"+resultData.data[i].seq+"' /></a> ";
							}
							else if(resultData.data[i].pdffile != ""){
								innerHtml += " <a href='#;return false;' onclick=\"viewPdfFile('"+resultData.data[i].pdffile+"'); return false;\"> ";
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"' alt='"+resultData.data[i].sign+"' /> </a>  ";
							}
							else if(resultData.data[i].imageUrl3 == "" || resultData.data[i].imageUrl3 == "/attachfiles/arrivalinfo/Thum" ){
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							else if(resultData.data[i].imageUrl3 != ""){
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl3+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							innerHtml += " </div> ";
							innerHtml += " <div class='bookInfo' '> "; //id='myDiv"+i+"
							innerHtml += " <h4><a href=\"javascript:weekCommantDetail('"+resultData.data[i].seq+"');\" style='cursor: pointer;' title='"+resultData.data[i].sign+"'>"+resultData.data[i].sign+"</a></h4> ";

							innerHtml += " <ul> ";
							innerHtml += " <li><span class='title'>분야 :</span><span class='con'>"+resultData.data[i].subject+"</span></li> ";
							innerHtml += " <li><span class='title'>편·저자 :</span><span class='simplify'>"+resultData.data[i].writer+"</span></li> ";
							innerHtml += " <li><span class='title'>서평자 :</span><span class='con'>"+resultData.data[i].reviewer+"</span></li> ";
							innerHtml += " <li><span class='title'>소속 :</span><span class='con'>"+resultData.data[i].pubarea+"</span></li> ";
							if(resultData.data[i].pubnumber != ""){
								innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubnumber+"호("+resultData.data[i].pubdate+")</span></li> ";
							}else{
								innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubdate+"</span></li> ";
							}
							innerHtml += " </ul>  </div> </div> ";

							$("#bookListLeftBox").append(innerHtml);
						}
						if($(".weeks").length == total){
							$(".more").hide();
						}
					}else{
						alert('검색 결과가 없습니다.');
						return false;
					}

				}, error: function(data, status, err) {
// 					alert("서버와의 통신이 실패했습니다.");
				}
			});
		});






		
		//휴먼전문가 서평 더보기 버튼
		$(document).on("click", "#searchPlusHuman ", function(e) {
			e.preventDefault();
			
			var keyCode = $("#searchKeyCode option:selected").val();
			var keyWord = $("#searchKeyWord").val();
			var subject = $("#selectSubject option:selected").val();
			var weeks = $("#searchWeeks option:selected").val();
			var nowPage = $("#searchNowHumanPage").val();

			var param = "searchKeyCode="+keyCode+"&searchKeyWord="+keyWord+"&selectSubject="+subject+"&searchWeeks="+weeks+"&nowPage="+nowPage;

			var _protocol = 'https://';
			var _host = 'nanet.go.kr';

			if(location.hostname == 'host'){
				_host = '';
			}

			if(location.protocol == 'https://'){
				_protocol = '';
			}
			
	        $.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/datasearch/commant/ajaxSelectHuman.do'
				, data: param
				, success: function(resultData) {
					var total = resultData.data[0].total; //목록총데이터건수
					var nowPage = resultData.data[0].nowPage; //현재페이징
					var listLen = resultData.data[0].list; //목록건수
					$("#searchNowHumanPage").val(nowPage);  

					if(listLen != 0){
						for(var i = 1; i <= resultData.data.length-1; i++){
							var innerHtml = "";
							
							innerHtml += " <div class=\"bookList Human\">  <div class=\"bookImg bookImgHeight\"> ";
							if(resultData.data[i].pdffile == ""){
								innerHtml += " <a href=\"javascript:humanCommantDetail('"+resultData.data[i].seq+"');\"> ";
								innerHtml += " <img src='" + _protocol + _host + resultData.data[i].imageUrl+"'  style='cursor: pointer;' onclick=\"humanCommantDetail('"+resultData.data[i].seq+"');\" alt='"+resultData.data[i].seq+"' /></a> ";
							}
							else if(resultData.data[i].pdffile != ""){
								innerHtml += " <a href='#;return false;' onclick=\"viewPdfFile('"+resultData.data[i].pdffile+"'); return false;\"> ";
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"' alt='"+resultData.data[i].sign+"' /> </a>  ";
							}
							else if(resultData.data[i].imageUrl3 == "" || resultData.data[i].imageUrl3 == "/attachfiles/arrivalinfo/Thum" ){
								innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl+"'  alt='"+resultData.data[i].sign+"'  />   ";
							}
							else if(resultData.data[i].imageUrl3 != ""){
        						innerHtml += " <img src='" +  _protocol + _host + resultData.data[i].imageUrl3+"'  alt='"+resultData.data[i].sign+"'  />   ";
        					}
        					innerHtml += " </div> ";
        					innerHtml += " <div class='bookInfo' > "; //id='myDiv"+i+"'
        					innerHtml += " <h4><a href=\"javascript:humanCommantDetail('"+resultData.data[i].seq+"');\" style='cursor: pointer;' title='"+resultData.data[i].sign+"'>"+resultData.data[i].sign+"</a></h4> ";
							
        					innerHtml += " <ul> ";
        					innerHtml += " <li><span class='title'>분야 :</span><span class='con'>"+resultData.data[i].subject+"</span></li> ";
        					innerHtml += " <li><span class='title'>편·저자 :</span><span class='simplify'>"+resultData.data[i].writer+"</span></li> ";
        					innerHtml += " <li><span class='title'>서평자 :</span><span class='con'>"+resultData.data[i].reviewer+"</span></li> ";
        					innerHtml += " <li><span class='title'>소속 :</span><span class='con'>"+resultData.data[i].pubarea+"</span></li> ";
        					if(resultData.data[i].pubnumber != ""){
            					innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubnumber+"호("+resultData.data[i].pubdate+")</span></li> ";        						
        					}else{
        						innerHtml += " <li><span class='title'>발행사항 :</span><span class='con'>"+resultData.data[i].pubdate+"</span></li> ";
        					}
							innerHtml += " </ul>  </div> </div> ";
							
							$("#bookListLeftBoxHuman").append(innerHtml);							
						}
						if($(".Human").length == total){
							$(".HumanMore").hide();
						}
					}else{
						alert('검색 결과가 없습니다.');
						return false;
					}

				}, error: function(data, status, err) {
// 					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
		});
		
		//인포그래픽 버튼 클릭
		$(document).on("click", ".pcTable > li > a ", function(e) {
			e.preventDefault();

			var id = $(this).attr("id");
			var keyword = $("#"+id).text();
			var idx = $(".pcTable > li > a").index(this);
			
			$(".pcTable > li ").removeClass();
			$(".pcTable > li:eq("+idx+")").addClass("active open");
			
			var nClass = $(".pcTable > li:eq("+idx+")").attr("class");
			
			if(nClass == "active open"){
				if($("#search_graph_box").css("display") == "none"){
					$("#search_graph_box").removeClass();
					$("#search_graph_box").addClass(""+id+"");
					$('#chartTerm').val(keyword);
					$("#search_graph_box").empty();
					
// 					$("#search_graph_box").show();
					getTopicCount();		
					
				}else{
					var graphClass = $("#search_graph_box").attr("class"); 
					if(id != graphClass){
						$("#search_graph_box").removeClass();
						$("#search_graph_box").addClass(""+id+"");
						$('#chartTerm').val(keyword);
						$("#search_graph_box").empty();
						
// 						$("#search_graph_box").show();
						getTopicCount();
						
					}else{
						$(".pcTable > li ").removeClass();
						$(".pcTable > li:eq("+idx+")").addClass("active");
						$("#search_graph_box").empty();
						$("#search_graph_box").hide();
					}
				}
			}else{
				$("#search_graph_box").show();
			}
			
		});
		
		// 상세화면 연관어 검색어 버튼
		$('#word_info').click(function(e){
			e.preventDefault();
			var state = $("#word_graph_box").css('display');

			if(state == 'none'){ 
				$('#word_graph_box').show();

				var id = "0";
				
				var keyword = $("#"+id).text();
				var idx = "0";
				
				$(".pcTable > li ").removeClass();
				$(".pcTable > li:eq("+idx+")").addClass("active open");
				
				var nClass = $(".pcTable > li:eq("+idx+")").attr("class");

				if(nClass == "active open"){
					if($("#search_graph_box").css("display") == "none"){
						$("#search_graph_box").removeClass();
						$("#search_graph_box").addClass(""+id+"");
						$('#chartTerm').val(keyword);
						$("#search_graph_box").empty();
		
						getTopicCount();	

					}else{
						var graphClass = $("#search_graph_box").attr("class");
						
						if(id != graphClass){
							$("#search_graph_box").removeClass();
							$("#search_graph_box").addClass(""+id+"");
							$('#chartTerm').val(keyword);
							$("#search_graph_box").empty();
							
							getTopicCount();
							
						}else{
							$(".pcTable > li ").removeClass();
							$(".pcTable > li:eq("+idx+")").addClass("active");
							$("#search_graph_box").empty();
							$("#search_graph_box").hide();
						}
					}
				}
			}else{
				$('#word_graph_box').hide();
				$("#search_graph_box").hide();
			}
		});
		
	});
	
	   /*
	    * 금주의 서평 상세보기 
	    */
	   function weekCommantDetail(seq){
// 		  $("#searchSeq").val(seq);
// 		  $("#searchCommantVO").attr("action", "/datasearch/commant/selectWeekCommantDetail.do").submit();
		  location.href = "/datasearch/commant/selectWeekCommantDetail.do?searchSeq="+seq;
	   }
	   
	   /*
	    * 사서 서평 상세보기 
	    */
	   function LibrarianCommantDetail(seq){
// 			$("#searchSeq").val(seq);
// 			$("#searchCommantVO").attr("action", "/datasearch/commant/selectLibrarianCommantDetail.do").submit();
			location.href = "/datasearch/commant/selectLibrarianCommantDetail.do?searchSeq="+seq;
		}
		
		/*
		 * 열린 서평 상세보기 
		 */
		function openCommantDetail(seq){
// 			$("#searchSeq").val(seq);
// 			$("#searchCommantVO").attr("action", "/datasearch/commant/selectOpenCommantDetail.do").submit();
			location.href = "/datasearch/commant/selectOpenCommantDetail.do?searchSeq="+seq;
		}
		
		 /*
		 * 휴먼 서평 상세보기 
		 */
		function humanCommantDetail(seq){
// 			$("#searchSeq").val(seq);
// 			$("#searchCommantVO").attr("action", "/datasearch/commant/selectHumanCommantDetail.do").submit();
			location.href = "/datasearch/commant/selectHumanCommantDetail.do?searchSeq="+seq;
		}
		
		 
		function wordSearch(d) {
// 			  if (d3.event.defaultPrevented) return;
			  
			 // var term = d.className;
			  var term = d;
	    	  if(term.indexOf('(') > 0) {
				term = term.substring(0, term.indexOf('('));
	    	  }
			  
	          $('#chartQuery').val(term + ':ALL_NI_TOC:AND');
	          /*$('#frmNanetSearch').attr('action','https://dl20.nanet.go.kr:2443/SearchList.do');*/
 	          $('#frmNanetSearch').attr('action','https://dl.nanet.go.kr/search/searchInnerList.do');
	          $('#frmNanetSearch').attr('target', '_blank');
	          $('#frmNanetSearch').submit();

			}
		
//]]>
</script>

<script type="text/javascript">
//<![CDATA[ 
	
     //2019 문서뷰어 호출                 
	function newViewerCall(fileNm, seq, gubun, fileSavegbn, dYn){
    	var downYn = "Y";
    	if(dYn == "N"){
    		downYn = "N";
    	}
		var access_type = "PC";
		if(navigator.userAgent.toLowerCase().search('mobile') > -1)
		{
			access_type = "MOBILE";
		}
		
		var menuName = "";
		if(seq != ""){
			menuName = gubun+seq+"_";
		}else{
			menuName = gubun+"_";
		}
		
		var sys = "";
		if(fileNm.lastIndexOf("/") > 0){
			sys = fileNm.substring(fileNm.lastIndexOf("/")+1, fileNm.length);
		}else{
			sys = fileNm;
		}
		
		var  ext = "";
		if(fileNm.lastIndexOf("pptx") > 0 || fileNm.lastIndexOf("ppt") > 0 || fileNm.lastIndexOf("hwp") > 0  || fileNm.lastIndexOf("xlsx") > 0   || fileNm.lastIndexOf("xls") > 0  ){
			ext = "Y";
		}
// 		if(fileNm.lastIndexOf("png") > 0 || fileNm.lastIndexOf("jpg") > 0 || fileNm.lastIndexOf("PNG") > 0  || fileNm.lastIndexOf("JPG") > 0   || fileNm.lastIndexOf("gif") > 0  ){
// 			ext = "";	
// 		}
		
		if(access_type == "PC"){
			$("#menuName").val(menuName);
			$("#access_type").val(access_type);
			$("#fileExt").val(ext);
			$("#saveGbn").val(fileSavegbn);
			$("#fileName").val(sys);
			$("#viewer_form").attr("target", "_blank");
			$("#downYn").val(downYn);
			//20200512 운영
			/*$("#viewer_form").attr("action", "/cmmn/file/fileViewer.do").submit();*/
			//20200512 개발
			$("#viewer_form").attr("action", "/cmmn/file/fileViewer.do").submit();
		}else{
			var param = "?menuName="+menuName+"&access_type="+access_type+"&fileName="+sys+"&fileSavegbn="+fileSavegbn+"&fileExt="+ext+"&downYn="+downYn;
			//20200512 운영
			/*$("#viewer_form").attr("action", "/cmmn/file/fileViewer.do"+param).submit();*/
			//20200512 개발
			$("#viewer_form").attr("action", "https://www.nanet.go.kr/cmmn/file/fileViewer.do"+param).submit();
		}

	}
		
//]]>
</script>
<form id="viewer_form" name="viewer_form" method="post">
<input type="hidden" name="fileExt"  id="fileExt"   value=""/>
<input type="hidden" name="fileSavegbn"  id="saveGbn"   value=""/>
<input type="hidden" name="fileName" id="fileName" value=""/>
<input type="hidden" name="menuName" id="menuName" value=""/>
<input type="hidden" name="access_type" id="access_type" value=""/>
<input type="hidden" name="downYn" id="downYn" value=""/>
</form>

<!-- 인포그래픽  추가 s-->
<form name="frmNanetSearch" id="frmNanetSearch">
	<input type="hidden" name="queryText" id="chartQuery" />
</form>
<form name="frmChartTopic" id="frmChartTopic">
	<input type="hidden" name="host" id="Host" value="" />
	<input type="hidden" name="dramaCollection" id="dramaCollection" value="NADL" />
	<input type="hidden" name="dramaOption" id="dramaOption" value="MI" />
	<input type="hidden" name="dataOption" id="dataOption" value="Y" />
	<input type="hidden" name="useRepreterms" id="useRepreterms" value="Y" />
	<input type="hidden" name="searchTerm" id="chartTerm" value="" />
	<input type="hidden" name="chartFlag" id="chartFlag" value="count" />
	<input type="hidden" name="listPage" id="chartListPage" value="1" />
	<input type="hidden" name="listCount" id="chartListCount" value="50" />
	<input type="hidden" name="selectTerm" id="chartSelectTerm" value="" />
</form>
<link href="${pageContext.request.contextPath}/css/chart/style.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/chart/d3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/chart/bubble.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/chart/chartCount.js"></script>
<!-- 인포그래픽 추가 e -->


<script type="text/javascript">

	$(document).ready(function() {
		$(".imgComentList .normalTable ul>li").click(function() {
			var tabClass = $(this).attr("data-tab");
			$(".imgComentList .normalTable ul>li").removeClass("current");
			$(this).addClass("current");
			$(".mapImageComent").removeClass("current");
			$("." + tabClass).addClass("current");
			
			if(tabClass != ""){
				$(".blind").text('');
				$("#" + tabClass).text('선택됨');
			}
		});
		
		var initTabGubun = "";
		
		if(initTabGubun == 'bigDataTab'){
			$('[data-tab="classListCon17"]').click();
		} else {
			$('[data-tab="classListCon08"]').click();
		}

	});

	//사회과학자료실 > 신문 > 구독목록 다운로드
	function fileDown() {
		$("#realAttachFile").val("2022년도 외국 신문 구독 목록.xlsx");
		$("#sysAttachFile").val("libinfo_newspaper.xlsx");
		$("#fileSavegbn").val("11");
		$("#fileform").attr("target", "_blank");
		$("#fileform").attr("action",
				"https://www.nanet.go.kr/cmmn/fileDownload/fileDown.do").submit();
	}

	function ipck() {
		window.open("/main/ipChkPopup.do", "acDbipPopup",
				"width=336, height=350, scrollbars=0, resizable=0");
	}

	function loginInfo(){
		alert('야간이용 신청은 로그인 후 가능 합니다.');
		window.location.href = '/loginForm.do';
	}

	function fileDown2(fileNm,fileNm2){
		$("#realAttachFile").val(fileNm2);
		$("#sysAttachFile").val(fileNm);
		$("#fileSavegbn").val("10");
		$("#fileform").attr("target","_blank");
		$("#fileform").attr("action", "https://www.nanet.go.kr/cmmn/fileDownload/fileDown.do").submit();
	}
	
    function checkIP(){
        var ipYn = $('#ipYn').val();
//         console.log(ipYn);
        if(ipYn == 'Y'){
            ipck();
        }else{
//             window.open('http://isform.co.kr/form/view/clopy/1083', '_blank');
            window.open('http://post.clopy.net', '_blank');
            
        }
    }	
</script>

<form id="fileform" method="post">
	<fieldset>
		<input type="hidden" name="realAttachFile" id="realAttachFile" /> <input
			type="hidden" name="sysAttachFile" id="sysAttachFile" /> <input
			type="hidden" name="fileSavegbn" id="fileSavegbn" />
	</fieldset>
</form>
<form id="urlform" method="post"></form>

<div class="contentsContainer">
	<div class="subTitle">
		<div class="inner">
			<h2>도서관소개</h2>
			<div class="location">
				<ol>
					<li class="home"><img src="${pageContext.request.contextPath}/resource/images/icon_home.png" alt="홈" /></li>
					<li>도서관소개</li>
					<li>도서관이용</li>
					<li>자료실</li>
				</ol>
			</div>
		</div>
	</div>
	<div class="inner">
		<div class="contents" id="bodyWrap">
			<h3 class="title">자료실</h3>
			<div class="subContents">
				<div class="body">
					<!-- 여기서부터 콘텐츠 s -->
					<div class="bodyBox001">
						<div class="tableCon imgComentList">
							<table class="normalTable">
								<caption>자료실 및 시설 안내 테이블로 5F, 4F, 3F, 의정관 3F, 2F, 1F, B1F로 구성</caption>
								<colgroup>
									<col style="width: 17%" />
									<col style="width: 83%" />
								</colgroup>
								<tr>
									<th scope="row">5F</th>
									<td class="end">
										<div class="box00 overflowH">
											<ul>
												<li data-tab="classListCon01" class="infoMenu01 mb0"><a href="#">${volist.get(0).getGuide_room_name()} 
<%-- 												의원열람실  =  <%=volist.get(0).getGuide_room_name()%>  =  ${volist.get(0).getGuide_room_name() --%>
												<span class="blind" id="classListCon01"></span></a></li>
												<li data-tab="classListCon02" class="end infoMenu02  mb0"><a href="#">${volist.get(1).getGuide_room_name()}<span class="blind"  id="classListCon02"></span></a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">4F</th>
									<td class="end">
										<div class="box00 overflowH">
											<ul>
												<li data-tab="classListCon03" class="end infoMenu03 mb0">
													<span class="color05">입법조사처</span>
												</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">3F</th>
									<td class="end">
										<div class="box00 overflowH">
											<ul>
												<li data-tab="classListCon04" class="end infoMenu04 mb0"><a href="#">${volist.get(2).getGuide_room_name()}<span class="blind"  id="classListCon04"></span></a></li>
<!-- 												<li data-tab="classListCon16" class="end infoMenu16 mb0"><a href="#">연구데이터센터(RDC)</a></li> -->
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">의정관 3F</th>
									<td class="end">
										<div class="box00 overflowH">
											<ul>
												<li data-tab="classListCon05" class="end infoMenu05 mb0"><a href="#">${volist.get(3).getGuide_room_name()}<span class="blind"  id="classListCon05"></span></a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">2F</th>
									<td class="end">
										<div class="box00 overflowH">
											<ul>
												<li data-tab="classListCon06" class="infoMenu06 mb0"><a href="#">${volist.get(4).getGuide_room_name()}<span class="blind"  id="classListCon06"></span></a></li>
												<li data-tab="classListCon07" class="end infoMenu07 mb0"><a href="#">${volist.get(5).getGuide_room_name()}<span class="blind"  id="classListCon07"></span></a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">1F</th>
									<td class="end">
										<div class="box00 overflowH">
											<ul>
												<li data-tab="classListCon08" class="infoMenu08 mb0 current"><a href="#">${volist.get(6).getGuide_room_name()}<span class="blind"  id="classListCon08"></span></a></li>
												<li data-tab="classListCon09" class="infoMenu09 mb0"><a href="#">${volist.get(7).getGuide_room_name()}<span class="blind"  id="classListCon09"></span></a></li><!-- ㆍ석박사학위논문실 -->
												<li data-tab="classListCon17" class="infoMenu17 mb0"><a href="#">${volist.get(8).getGuide_room_name()}<span class="blind"  id="classListCon17"></span></a></li>
												<li data-tab="classListCon11" class="infoMenu11 mb0"><a href="#">${volist.get(9).getGuide_room_name()}<span class="blind"  id="classListCon11"></span></a></li>
												<li data-tab="classListCon10" class="infoMenu10 mb0"><a href="#">${volist.get(10).getGuide_room_name()}<span class="blind"  id="classListCon10"></span></a></li>
												<li data-tab="classListCon18" class="infoMenu18 mb0"><a href="#">${volist.get(11).getGuide_room_name()}<span class="blind"  id="classListCon18"></span></a></li>
												<li data-tab="classListCon19" class="end infoMenu19 mb0"><a href="#">${volist.get(12).getGuide_room_name()}<span class="blind"  id="classListCon19"></span></a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">B1F</th>
									<td class="end">
										<div class="box00 overflowH">
											<ul>
												<li data-tab="classListCon12" class="infoMenu12 mb0"><a href="#">강당<span class="blind"  id="classListCon12"></span></a></li>
												<li data-tab="classListCon13" class="infoMenu13 mb0"><a href="#">소회의실<span class="blind"  id="classListCon13"></a></span></li>
												<li data-tab="classListCon14" class="infoMenu14 mb0"><a href="#">매점<span class="blind"  id="classListCon14"></span></a></li>
												<li data-tab="classListCon15" class="end infoMenu15 mb0"><a href="#">식당<span class="blind"  id="classListCon15"></span></a></li>
											</ul>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!-- //tableCon imgComentList -->

						<!-- 자료실 및 시설안내 내용 -->
						<!-- 의원열람실 -->
						<div class="mapImageComent mt50 classListCon01 current">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_5F_01.jpg" alt="5층평면도 - 1.의원열람실 위치 : 일반인출입구방향쪽 엘레베이터 옆에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 여자화장실" />
							</div>
							<div class="subBoxTxt mt20 subBoxTxt28">
								<h4>간략소개</h4>
								<ul>
									<li>${volist.get(0).getGuide_intro()}</li>
								</ul>
							</div>
<!-- 							<div class="subBoxTxt"> -->
<!-- 								<h4>이용시간</h4> -->
<!-- 								<ul> -->
<!-- 									<li>국회도서관 : 월~금 09:00 ~ 18:00</li> -->
<!-- 									<li>의원회관 : 월~금 09:00 ~ 22:00(야간이용 포함)</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
							<div class="subBoxTxt">
								<h4>이용대상</h4>
								<ul>
									<li>국회의원 및 입법보좌직원</li>
								</ul>
							</div>
							<div class="subBoxTxt">
							</div>
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(0).getGuide_location()}</li>
									<li>${volist.get(0).getGuide_phonenumber()}</li>
								</ul>
							</div>
						</div>

						<!-- 정기간행물실 -->
						<div class="mapImageComent mt50 classListCon02">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_5F_02.jpg" alt="5층평면도 - 1.정기간행물실 위치 : 일반인출입구방향쪽 엘레베이터를 내려 법률정보총괄과,국회사무처,의정연수원교수실,독도조사관실을 지나 독도조사관실 옆 해외자료관실 맞은편에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 여자화장실" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략소개</h4>
								<ul>
									<li>${volist.get(1).getGuide_intro()}</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>이용시간</h4>
								<ul class="mb10">
									<li>${volist.get(1).getGuide_time()}</li>							
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>
									이용방법
									<span class="btnView m_ml10 pop_use" style="float: none; margin-left: 10px; display: inline-block;">									
									</span>
								</h4>
								<ul class="mb0">
									<li>정기간행물</li>
									<li class="bgNo">ㆍ2019년 이후 정기간행물: 자료실에서 직접 이용(수록지명 가나다순, 알파벳순 배열)</li>
									<li class="bgNo">ㆍ2018년 이전 정기간행물: 온라인 열람 신청(원문구축 자료의 경우 원문 이용)</li>
								</ul>
								<ul class="mb0">
									<li>국제기구자료</li>
									<li class="bgNo">ㆍ2019년 이후 국제기구자료: 자료실에서 직접 이용(청구기호 순 배열)</li>
									<li class="bgNo">ㆍ2018년 이전 국제기구자료: 온라인 열람신청(원문구축 자료의 경우 원문 이용)</li>									
								</ul>
								<ul class="mb0">
									<li>마이크로폼자료: 직접 열람신청 </li>
									<li class="bgNo">※ 마이크로폼자료 열람신청은 정기간행물실 직원에게 문의하세요.</li>	
								</ul>
							</div>
							<!-- <div class="subBoxTxt">
								<h4>
									자료복사 
									<span class="btnView m_ml10" style="float: none; margin-left: 10px; display: inline-block;">
										<a href="/usermadang/etc/copyServiceView.do"><img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">자료복사 바로가기</a>
									</span>
								</h4>
							</div> -->
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(1).getGuide_location()}</li>
									<li>${volist.get(1).getGuide_phonenumber()}</li>
								</ul>
							</div>
						</div>

						<!-- 입문자연과학자료실 -->
						<div class="mapImageComent mt50 classListCon04">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_3F_01.jpg" alt="3층평면도 - 1.인문자연과학자료실 및 대면낭독실 위치 : 일반인출입구방향쪽 엘레베이터를 내려 제1회의실,도서관장실,총무담당관실 지나 총무담당관실 옆 기획관리실 맞은편에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 여자화장실" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략소개</h4>
								<ul>
									<li>${volist.get(2).getGuide_intro()}</li>
								</ul>
								<p class="depthTxt pml20 pmtn20">
									<strong>* 경제학 및 경영학 관련도서: 사회과학자료실(208호)에서 이용 가능</strong>
								</p>
							</div>
							<div class="subBoxTxt">
								<h4>이용시간</h4>
								<ul>
									<li>${volist.get(2).getGuide_time()}</li>
								</ul>
							</div>

							<div class="subBoxTxt">
								<h4>소장자료</h4>
								<p class="lh32 fs16">
									<strong>- 단행본</strong>
								</p>
								<ul>
									<li class="lh18">입수 순으로 최근 2년간의 국내서 및 동양서, 서양서</li>
								</ul>
							</div>
							<!-- <div class="subBoxTxt">
								<h4>연구조사실 및 스터디룸 이용안내<span class="color02">(별도 공지 시까지 운영을 중단합니다.)</span></h4>
								<ul>
									<li class="lh18">개인 연구조사실(1인실) 2실, 다인 연구조사실(2~7인실) 1실은 당일 선착순 신청 후 사용
									<br/>※ 1일 최대 4시간 이용 가능
									</li>
								</ul>
							</div> -->
							<div class="subBoxTxt">
								<h4>이용방법</h4>
								<ul class="mb10">
									<li>청구기호 순으로 배열된 인문·자연과학분야 단행본을 자료실에서 직접 열람</li>
									<li class="bgNo">※ 열람 및 대출권수 : 1회 5책(1일 총20책 이내)</li>
								</ul>
<!-- 								<p class="lh32 mb10 depthTxt"> -->
<!-- 									<strong>※ 도서관 자료는 도서관내에서만 이용하실 수 있습니다.</strong> -->
<!-- 								</p> -->

							</div>	
							<div class="subBoxTxt">
								<h4>연구조사실</h4>
								<ul class="mb10">
									<li>개인 연구조사실 2실은 당일 선착순 신청 후 사용 </li>
									<li class="bgNo">※ 1일 최대 4시간 이용 가능</li>
								</ul>
							</div>					
							
							<div class="subBoxTxt">
								<h4>대면낭독실</h4>
								<ul class="mb10">
									<li>이용대상: 시각장애인</li>
									<li>이용방법: 대면낭독실은 당일 3층 중앙데스크에서 선착순 신청 후 이용 가능(장애인복지카드 지참)</li>
									<li class="bgNo">※ 1일 3시간, 1일 최대 6시간까지 이용 가능</li>
								</ul>
							</div>	
														
							<div class="subBoxTxt">
								<h4>야간 자료 이용</h4>
								<ul class="mb10">
									<li>평일 야간에 인문자연과학자료실 자료를 이용하려면 국회전자도서관에서「야간이용신청」후 1층 대출대에서 수령하여 이용 가능합니다. 
									
									<span class="btnView m_ml10" style="float: none; display: inline-block;">
									</span>									
									</li>
								</ul>
																
							</div>							
							<!-- 		
							<div class="subBoxTxt">
								<h4>야간이용안내
									 <span class="btnView m_ml10" style="float: none;margin-left: 10px;display: inline-block;position: absolute;margin-top: -2px;">
										
										
											<a href="#" onclick="javascript:loginInfo(); return false;">야간이용 신청내역</a>
										
									</span> 
								</h4>	
							</div>
							 -->	
																	
							<!-- <div class="subBoxTxt">
								<h4>
									자료복사 
									<span class="btnView m_ml10" style="float: none; margin-left: 10px; display: inline-block;">
										<a href="/usermadang/etc/copyServiceView.do"><img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">자료복사 바로가기</a>
									</span>
								</h4>
							</div> -->
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(2).getGuide_location()}</li>
									<li>${volist.get(2).getGuide_phonenumber()}</li>
								</ul>
							</div>
						</div>

						<!-- 디지털정보센터 -->
						<div class="mapImageComent mt50 classListCon05">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_3F_02.jpg"
									alt="의정관 3층 평면도 - 1.디지털정보센터 |독도·통일자료실 : 디지털정보센터 입구에서 직진하면 (1)인포메이션 데스크 imformation Desk (2)전시 및 체험 Exhibition -전자책/오디오북 E-Book/Audiobook, -디지털 기술 Digital technology, -영상/음악자료 DVD/CD/LP(3)노트북/열람 Laptop carrels/Workstation (4)PC/웹DB/전자책 PC/Web-DB/E-Book (5)정보검색/다국어 Quick search station/Global PCs (6)영상자료 Multimedia station (7)복사코너 Photocopiers (8)독도/통일/특수자료 Dokdo/Unification Resources/Special Materials (9)참고자료 Reference Materials (10)국회기록물 열람 National Assembly Records & Archives 위치합니다." />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략소개</h4>
								<ul>
									<li>${volist.get(3).getGuide_intro()}</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>이용시간</h4>
								<ul class="mb10">
									<li>${volist.get(3).getGuide_time()}</li>
									<li class="bgNo" style="padding-left: 0px;">※ 특수자료는 평일 점심시간, 토 ~ 일요일, 야간에는 이용하실 수 없습니다.</li>
								</ul>
<!-- 								<p class="depthTxt"> -->
<!-- 									<strong>※ 특수자료는 평일 점심시간, 토 ~ 일요일, 야간에는 이용하실 수 없습니다.</strong> -->
<!-- 								</p> -->
							</div>
							<div class="subBoxTxt">
								<h4>좌석이용안내</h4>
								<ul class="mb10">
									<li>국회도서관 홈페이지의「디지털정보센터 좌석예약」에서 좌석을 예약하거나 디지털정보센터 내 좌석예약 키오스크에서 예약한 후에 사용
									
									<span class="btnView m_ml10" style="float: none; margin-left: 10px; display: inline-block;">
<!-- 										<a href="#"  onclick="seatck();"  title="새창열기">  -->
										<a href="#" onclick="seatRegister();" title="새창열기">
											<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">
											좌석예약 바로가기
										</a>
									</span>									
<!-- 										<div class="box701 p0 box701000 ml10"> -->
<!-- 											<a class="btnLink fs12" href="#"  onclick="seatck();" title="새창열기"> -->
<!-- 											<img src="${pageContext.request.contextPath}/images/img/btn_icon_001_01.png" alt="" />좌석예약 바로가기 」 -->
<!-- 											</a> -->
<!-- 										</div> -->
									</li>
									
									<li>예약 가능 코너</li>
									<li class="bgNo">ㆍPC/웹DB/전자책: 웹DB, 전자책 열람 및 정보검색ㆍ문서편집</li>
									<li class="bgNo">ㆍ영상자료: Blu-ray, DVD 등 열람</li>
								</ul>
																
<!-- 								<p class="clearB">좌석예약 및 지정 가능한 코너 : Web-DB/원문검색</p> -->
							</div>
							<div class="subBoxTxt">
								<h4>
									이용방법
									<span class="btnView m_ml10 pop_use" style="float: none; margin-left: 10px; display: inline-block;">
<!-- 										<a href="#" style="width:118px;">열람신청 방법 보기</a> -->
										<button class="btn_navy" data-focus="popUse" style="border-radius: 0">열람신청 방법 보기</button>
									</span>
								</h4>
								<ul class="mb0">
									<li>참고자료(연감, 통계, 편람 등 참고자료)</li>
								</ul>
								<ul class="ml30 mb0">
									<li class="ml0 bgNo pL0">ㆍ2006년 이후 참고자료 : 청구기호순으로 자료실에서 직접 이용</li>
									<li class="ml0 bgNo pL0">ㆍ2005년 이전 참고자료 : 온라인 열람신청(원문구축 자료의 경우 원문이용)</li>
								</ul>
								<ul class="mb0">
									<li>웹DB(Web을 통해 이용할 수 있는 학술 데이터베이스로 의회, 법령, 국내외 학술분야 등 열람 가능)</li>
								</ul>
								<ul class="mb0">
									<li>비도서 자료(CD, DVD, 비디오테이프, 카세트테이프 등): 온라인 열람신청</li>
								</ul>
								<ul class="mb0">
									<li>특수자료(국회도서관 특수자료취급내규 제2조에 해당하는 자료): 신분증(장기열람증 포함) 확인 및 열람신청서 작성 후 지정된 장소에서 열람 가능</li>
									<li class="bgNo">※ 특수자료 열람신청은 독도·통일자료실 직원에게 문의하세요. </li>
								</ul>								
							</div>							
							<!-- <div class="subBoxTxt">
								<h4>
									자료복사 
									<span class="btnView m_ml10" style="float: none; margin-left: 10px; display: inline-block;">
										<a href="/usermadang/etc/copyServiceView.do"> 
											<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">
											자료복사 바로가기
										</a>
									</span>
								</h4>
							</div> -->
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(3).getGuide_location()}</li>
									<li>${volist.get(3).getGuide_phonenumber()}</li>
								</ul>
							</div>
						</div>

						<!-- 사회과학자료실 -->
						<div class="mapImageComent mt50 classListCon06">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_2F_01.jpg"
									alt="2층평면도 - 1.사회과학자료실 위치 : 일반인출입구방향쪽 엘레베이터를 내려 디지털정보센터 연결통로(의정관)을 가로질러 맞은편에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 여자화장실, 여자장애인화장실" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략소개</h4>
								<ul>
									<li>${volist.get(4).getGuide_intro()}</li>
								</ul>
								<p class="depthTxt pml20 pmtn20">
									<strong>* 법학 관련 도서(청구기호 LM으로 시작): 법률정보센터(206호)에서 이용 가능</strong>
								</p>
							</div>
							<div class="subBoxTxt">
								<h4>이용시간</h4>
								<ul>
									<li>${volist.get(4).getGuide_time()}</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>소장자료</h4>
								<p class="lh32 fs16">
									<strong>단행본</strong>
								</p>
								<ul>
									<li>입수 순으로 최근 2년간의 국내서 및 동양서, 최근 2년간의 서양서</li>
								</ul>
								<p class="lh32 fs16">
									<strong>신문</strong>
								</p>
								<ul>
									<li>국내 신문 : 247종(중앙지, 지방지, 전문지, 어린이 신문)</li>
									<li>외국 신문 : 60종(서양 신문 29종, 동양 신문 31종)
									<span class="btnView m_ml10 " style="float: none; margin-left: 10px; display: inline-block;">
										<a href="javascript:fileDown()" style="width:130px;" title="외국 신문 목록 보기 다운로드">
											※외국 신문 목록 보기
										</a>
									</span>
									</li>
									<li>서고 신문: 1,029종(제본신문)</li>
								</ul>								
							</div>						

							<div class="subBoxTxt">
								<h4>이용방법</h4>
								<ul class="mb10">
									<li>단행본: 청구기호 순으로 배열되어 있으며 자료실에서 직접 열람</li>
									<li class="bgNo">※ 열람 및 대출 책수: 1회 5책(1일 총 20책 이내)</li>
									<li>신문: 최근 1년 이내 발행 신문은 자료실에서 직접 이용하고, 그 이전 신문(서고신문)은 방문하여 열람신청서 작성 후 열람 가능</li>
									<li class="bgNo">※ 신청시간: 월~금 09:00 ~ 17:00, 토~일 09:00 ~ 16:00</li>
									
									<!-- <li><span class="wrapSpanTit">신문 :</span> <span
										class="wrapSpanCon">최근 1년 이내 발행된 신문은 자료실에서 직접 이용<br />
											그 이전의 제본신문 및 서고 소장 신문은 열람신청서 작성 후 열람 가능<br /> 
											(※ 신문 열람신청은 사회과학자료실 직원에게 문의하세요.)
									</span></li> -->
								</ul>
<!-- 								<p class="depthTxt"> -->
<!-- 									<strong>※ 도서관 자료는 도서관 내에서만 이용할 수 있습니다.</strong> -->
<!-- 								</p>  -->
							</div>
							<!-- <div class="subBoxTxt">
								<h4>
									자료복사 
									<span class="btnView m_ml10" style="float: none; margin-left: 10px; display: inline-block;">
										<a href="/usermadang/etc/copyServiceView.do"> 
											<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">
											자료복사 바로가기
										</a>
									</span>
								</h4>
							</div> -->
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(4).getGuide_location()}</li>
									<li>${volist.get(4).getGuide_phonenumber()}</li>
								</ul>
							</div>
						</div>

						<!-- 법률정보센터 -->
						<div class="mapImageComent mt50 classListCon07">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_2F_02.jpg"
									alt="2층평면도 - 1.법률정보센터 위치 : 일반인출입구방향쪽 엘레베이터를 내려 오른쪽에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 여자화장실, 여자장애인화장실" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략소개</h4>
								<ul>
									<li>${volist.get(5).getGuide_intro()}</li>
								</ul>
							</div>
<!-- 							<div class="subBoxTxt"> -->
<!-- 								<h4>이용시간</h4> -->
<!-- 								<ul> -->
<!-- 									<li>월~금 : 09:00 ~ 22:00</li> -->
<!-- 									<li>토~일 : 09:00 ~ 17:00</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
							<div class="subBoxTxt">
								<h4>이용자료</h4>
								<p class="lh32  fs16">
									<strong>법학도서</strong>
								</p>
								<ul>
									<li>최근 2년간 발행된 법률분야 도서</li>
								</ul>
								<p class="lh32  fs16">
									<strong>법령자료</strong>
								</p>
								<ul>
									<li>국내 및 주요국의 종합법령집</li>
									<li>판례집 및 조약집</li>
								</ul>
								<p class="lh32  fs16">
									<strong>의회자료</strong>
								</p>
								<ul>
									<li>각국 의회회의록(지방의회 회의록 및 의정백서 포함)</li>
									<li>국정감사 요구자료, 정부제출자료</li>
									<li>예결산서</li>
									<li>관보 및 공보</li>
									<li>의회관련 기관의 입법지원 연구자료</li>
									<li>IPU, APPU 발간물 및 관련 참고자료</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>
									이용방법
									<span class="btnView m_ml10 pop_use" style="float: none; margin-left: 10px; display: inline-block;">
									</span>
								</h4>
								<ul class="mb10">
									<li>최근 2년간 발행된 법학도서, 법령자료 : 청구기호순으로 자료실에서 직접 이용</li>
									<li>의회자료 및 최근 2년 이전 법령자료 : 온라인 열람신청</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>
									자료복사 
									<span class="btnView m_ml10" style="float: none; margin-left: 10px; display: inline-block;">
										<a href="/usermadang/etc/copyServiceView.do" title="자료복사 바로가기"> 
											<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">
											자료복사 바로가기
										</a>
									</span>
								</h4>
							</div>
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(5).getGuide_location()}</li>
									<li>${volist.get(5).getGuide_phonenumber()}</li>
								</ul>
							</div>
						</div>

						<!-- 대출대 및 정보검색대 -->
						<div class="mapImageComent mt50 classListCon08">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/resource/images/img_1F_01.jpg"
									alt="1층평면도 - 1.대출대 위치 : 일반인출입구로 입장하여 출입게이트를 지나 중앙홀을 가로질러 맞은편에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 남자장애인화장실, 여자화장실, 여자장애인화장실, 현금지급기" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략소개</h4>
								<ul>
									<li>${volist.get(6).getGuide_intro()}</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>이용시간</h4>
								<ul>
									<li>${volist.get(6).getGuide_time()}</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>
									이용방법
									<!-- <span class="btnView m_ml10 pop_use"
										style="float: none; margin-left: 10px; display: inline-block;">
										<a href="#" style="width:90px;">
											이용방법 보기
										</a>
									</span> -->
								</h4>
								<ul class="mb10">
									<li>서고에 소장된 단행본, 학위논문은 국회전자도서관에서‘열람신청’을 한 후 1층 대출대에서 대출하여 이용
										<span class="btnView m_ml10 pop_use" style="float: none; margin-left: 10px; display: inline-block;">
<!-- 										<a href="#" style="width: 114px;">열람신청 방법 보기</a> -->
											<button class="btn_navy" data-focus="popUse" style="border-radius: 0">열람신청 방법 보기</button>
										</span>
									</li>
									<li>고서 및 귀중서는 자료 상태에 따라 이용이 제한될 수 있음</li>
									<li style="background: none;">※ 원문이 있는 자료는 열람용 PC 및 노트북(nal-web wifi로 연결)을 이용하여 국회전자도서관에서 열람할 수 있습니다.</li>	
								</ul>
							</div>
							<!-- <div class="subBoxTxt">
								<h4>
									자료복사 
									<span class="btnView m_ml10"
										style="float: none; margin-left: 10px; display: inline-block;">
										<a href="/usermadang/etc/copyServiceView.do"> 
											<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">
											자료복사 바로가기
										</a>
									</span>
								</h4>
							</div> -->
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(6).getGuide_location()}</li>
									<li>${volist.get(6).getGuide_phonenumber()}</li>
								</ul>
							</div>
						</div>

						<!-- 국가전략정보센터 -->
						<div class="mapImageComent mt50 classListCon09">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/resource/images/img_1F_02.jpg"
									alt="1층평면도 - 1.국가전략정보센터 위치 : 일반인출입구로 입장하여 출입게이트를 지나 중앙홀을 가로질러  대출대 오른쪽에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 남자장애인화장실, 여자화장실, 여자장애인화장실, 현금지급기" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략소개</h4>
								<ul>
									<li>${volist.get(7).getGuide_intro()}</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>이용대상</h4>
								<ul>
									<li>일반이용자 및 국가 전략 관련 연구자</li>									
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>소장자료</h4>
								<ul>
									<li>국가전략 관련 단행본, 정기간행물, 보고서 자료</li>									
								</ul>
							</div>							
							<div class="subBoxTxt">
								<h4>
									이용방법
									<!-- <span class="btnView m_ml10 pop_use"
										style="float: none; margin-left: 10px; display: inline-block;">
										<a href="#" style="width:90px;">
											이용방법 보기
										</a>
									</span> -->
								</h4>								
								<ul>
									 
								<li>단행본: 청구기호 순으로 배열되어 있으며 자료실에서 직접 열람(전시서가 자료 대출 불가)</li>
								<li class="bgNo">· 종합서가: 동양서와 서양서로 나누어 청구기호 순으로 배열되어 있으며 자료실에서 직접 열람</li>
								<li class="bgNo">· 미래핵심이슈 서가: 미래 핵심 주제별로 동‧서양서 구분없이 청구기호 순으로 배열되어 있으며 자료실에서 직접 열람</li>
								<li class="bgNo">※ 전시서가 자료 대출 불가</li>
								<li class="bgNo">※ 열람 및 대출 책수: 1회 5책(1일 총 20책 이내)</li>
								<li>정기간행물: 최신호만 소장하고 있으며 자료실에서 직접 이용</li> 
<!-- 									<li>최근 1년의 국내 논문(학위수여년도 기준): 자료실에서 직접 이용</li> 
									<li>최근 1년 이전의 국내 논문(학위수여년도 기준), 외국학위논문 전체: 국회전자도서관에서      ‘열람신청’하고 논문실(107호)에서 수령 후 이용
										<span class="btnView m_ml10 pop_use" style="float: none; display: inline-block;">
											<button class="btn_navy" data-focus="popUse" style="border-radius: 0">열람신청 방법 보기</button>
										</span>
									</li>
									<li style="background: none;">※ 원문이 있는 자료는 열람용 PC 및 노트북(nal-web wifi로 연결)을 이용하여 국회전자도서관에서 열람할 수 있습니다.</li>
								 -->	
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>야간 자료 이용</h4>
								<ul>
									<li>평일 야간에 국가전략정보센터 자료를 이용하려면 국회전자도서관에서 「야간이용신청」후 1층 대출대에서 수령하여 이용 가능합니다.
									<span class="btnView m_ml10" style="float: none; display: inline-block;">
										<a href="/usermadang/etc/nightUseReqView.do" target="_blank" title="새창열기">
											<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">
											야간이용신청 안내
										</a>
									</span>								
									</li>
								</ul>
							</div>								
							<div class="subBoxTxt">
								<h4>1인 연구석, 세미나 공간</h4>
								<ul>
									<li>1인 연구석(5석) 및 세미나실은 연구자 신분 확인 후 예약제로 이용</li>
									<li>세미나 수용 인원:15-30명 (전자칠판 구비)</li>
									<li>예약문의: 전화 또는 이메일(nsic@nanet.go.kr)</li>									
								</ul>
							</div>								
							<!-- <div class="subBoxTxt">
								<h4>
									자료복사
									<span class="btnView m_ml10"
										style="float: none; margin-left: 10px; display: inline-block;">
										<a href="/usermadang/etc/copyServiceView.do"> 
											<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">
											자료복사 바로가기
										</a>
									</span>
								</h4>
							</div> -->
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(7).getGuide_location()}</li>
									<li>${volist.get(7).getGuide_phonenumber()}</li>
									<li class="bgNo">
										<img src="${pageContext.request.contextPath}/resource/images/1F_02_01.png" alt="국가전략정보센터 내부사진. 1층 위치" style="width: 240px;height: 160px;"/>
										<img src="${pageContext.request.contextPath}/resource/images/1F_02_02.png" alt="국가전략정보센터 내부사진. 1층 위치" style="width: 240px;height: 160px;"/>
										<img src="${pageContext.request.contextPath}/resource/images/1F_02_03.png" alt="국가전략정보센터 내부사진. 1층 위치" style="width: 240px;height: 160px;"/>
									</li>
								</ul>
							</div>
						</div>

						<!-- 어린이방 -->
						<div class="mapImageComent mt50 classListCon10">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/resource/images/img_1F_03.jpg"
									alt="1층평면도 - 1.어린이방 위치 : 일반인출입구로 입장하여 출입게이트를 지나 오른쪽으로 가면 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 남자장애인화장실, 여자화장실, 여자장애인화장실, 현금지급기" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략 소개</h4>
								<ul>
									<li>${volist.get(10).getGuide_intro()}</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>이용시간</h4>
								<ul class="mb10">
									<li>${volist.get(10).getGuide_time()}</li>										
								</ul>
<!-- 								<p class="depthTxt"> -->
<!-- 									<strong>* 야간에는 이용하실 수 없습니다.</strong> -->
<!-- 								</p> -->
							</div>
							<div class="subBoxTxt">
								<h4>이용대상</h4>
								<ul>
									<li>5세 ~ 13세 어린이(보호자 동반)</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>이용 방법</h4>
								<ul>
									<li>어린이방 자료는 어린이방 내에서 직접 이용</li>
									<li class="bgNo">※ 어린이방에서 어린이에게 책을 읽어줄 때에는 작은 소리로 읽어주시기 바랍니다.</li>
								</ul>
							</div>
							<!-- <div class="subBoxTxt">
								<h4>
									자료복사 
									<span class="btnView m_ml10"
										style="float: none; margin-left: 10px; display: inline-block;">
										<a href="/usermadang/etc/copyServiceView.do"> 
											<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">
											자료복사 바로가기
										</a>
									</span>
								</h4>								
							</div> -->
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(10).getGuide_location()}</li>
									<li>${volist.get(10).getGuide_phonenumber()}</li>
								</ul>
							</div>
						</div>

						<div class="mapImageComent mt50 classListCon11">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/resource/images/img_1F_04.jpg"
									alt="1층평면도 - 1.복사실 원문검색실 위치 : 일반인출입구로 입장하여 출입게이트를 지나 오른쪽으로 가면 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 남자장애인화장실, 여자화장실, 여자장애인화장실, 현금지급기" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>
									간략소개
									<!-- <span class="btnView m_ml10 pop_print"
										style="float: none; margin-left: 10px; display: inline-block;">
										<a href="#" style="width:75px;">
											복사 요금표
										</a>
									</span> -->
								</h4>
								<ul>
									<li>${volist.get(9).getGuide_intro()}
									<span class="btnView m_ml10 pop_print"
										style="float: none; margin-left: 10px; display: inline-block;">
<!-- 										<a href="#" style="width:103px;">복사·출력요금표</a> -->
										<button class="btn_navy" data-focus="popPrint" style="border-radius: 0">복사·출력요금표</button>
									</span>									
									</li>
									
									<!-- <li style="background: none;">
										<div class="btnView m_ml10">
											<a href="http://isform.co.kr/form/view/clopy/1083" title="새창열림"
												target="_blank"> <img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png"
												alt="" />우편복사 신청하기
											</a>
										</div>
									</li> -->
								</ul>
							</div>
<!-- 							<div class="subBoxTxt"> -->
<!-- 								<h4>이용시간</h4> -->
<!-- 								<ul class="mb10"> -->
<!-- 										<li>월~금 : 14:00 ~ 18:00</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
							<div class="subBoxTxt">
								<h4>자료복사 허용범위</h4>
								<ul>
									<li>대상 자료: 일반도서, 연속간행물 및 학위논문</li>
									<li class="bgNo">※ 고서, 고잡지, 훼손될 우려가 있는 자료, 마이크로폼 자료 및 신문 등은 복사를 금지하거나 제한</li>
									<li>도서관 자료 복사는 저작권법이 허용하는 범위 내에서 부분 복사(1/3)만 가능</li>
									<li class="bgNo"><strong>※「저작권법」 제31조, 「국회도서관 열람 및 대출에 관한 내규」에 근거</strong></li>
								</ul>
							</div>							
							<div class="subBoxTxt">
								<h4>우편복사</h4>
								<ul>
									<li>도서관을 방문하지 못할 경우 인터넷, Fax 등으로 자료 복사를 신청하고, 복사물을 우편·Fax 등으로 제공받는 서비스 </li>
									<li class="bgNo">·인터넷 신청</li>
									<li style="background: none;margin-top: 0px;" class="rightGo">
		         						<ul class="ml10" style="padding-left: 10px;">
											<li class="pL0">① 국회도서관 홈페이지</li>
											<li class="pL0">도서관소개</li>
											<li class="pL0">도서관이용</li>
											<li class="pL0">자료실(1F)</li>
											<li class="pL0">복사실</li>
											<li class="end pL0">
												<div class="btnView m_ml10" style="float: left; margin-left: 10px;">
							                        
							                        	<a href="http://post.clopy.net" target="_blank" title="새창열림"><img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="" />우편복사 신청하기</a>
							                        												
													
												</div>
											</li>
										</ul>
									</li>
									<li class="bgNo" style="padding-left: 40px;">※ 이용자마당(자료복사) 메뉴에서도 신청 가능</li>
									<li style="background: none;margin-top: 5px;" class="rightGo">
		         						<ul class="ml10" style="padding-left: 10px;">
											<li class="pL0">② 국회전자도서관</li>
											<li class="pL0">자료 검색</li>
											<li class="pL0">우편복사 목록담기</li>
											<li class="pL0">복사 범위 입력</li>
											<li class="end pL0">우편복사 주문서 입력</li>
										</ul>
									</li>										
									<li style="background: none;margin-top: 0px;" class="rightGo">
		         						<ul class="ml10">
											<li class="pL0">·Fax 신청: 신청서 작성</li>
											<li class="end pL0" style="padding-right: 12px !important;">(Fax) 02-3775-1802로 전송</li>
											<li class="end">
												<div class="btnView m_ml10" style="float: right; margin-left: -8px;">
													<a href="javascript:fileDown2('pcfApp.hwp','우편복사팩스신청서.hwp');" title="신청서 다운로드">
				                                        <img src="${pageContext.request.contextPath}/images/bg/btn_icon_01.png" alt="" />신청서 다운로드
				                                    </a>
												</div>											
											</li>
										</ul>										
									</li>	
									<li>1인당 5권까지 신청 가능(1일 기준) </li>
									<li>우편 기본료(제주도 및 도서지역 제외)는 일반우편 4,000원, 빠른우편 7,000원</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(9).getGuide_location()}</li>
									<li>${volist.get(9).getGuide_phonenumber()}</li>
								</ul>
<!-- 								<p class="lh32 mb10 depthTxt" style="display: inline-block;"> -->
<!-- 									<strong>※ 자세한 사항은 복사실로 문의하시기 바랍니다. </strong> -->
<!-- 								</p> -->
							</div>
						</div>

						<!-- 강당 -->
						<div class="mapImageComent mt50 classListCon12">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_B1F_01.jpg"
									alt="지하평면도 - 1.강당 위치 : 일반인출입구로 입장하여 여자화장실을 지나 오른쪽에 위치합니다. 2.편의시설 : 엘리베이터, 공중전화, 남자화장실, 여자화장실" />
							</div>
						</div>

						<!-- 소회의실 -->
						<div class="mapImageComent mt50 classListCon13">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_B1F_02.jpg"
									alt="지하평면도 - 1.소회의실 위치 : 일반인출입구로 입장하여 여자화장실을 지나 강당을 가로질러 남자화장실 맞은편에 위치합니다. 2.편의시설 : 엘리베이터, 공중전화, 남자화장실, 여자화장실" />
							</div>
						</div>

						<!-- 매점 -->
						<div class="mapImageComent mt50 classListCon14">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_B1F_03.jpg"
									alt="지하평면도 - 1.매점 위치 : 일반인출입구로 입장하여 여자화장실을 지나 강당 맞은편에 위치합니다. 2.편의시설 : 엘리베이터, 공중전화, 남자화장실, 여자화장실" />
							</div>
						</div>

						<!-- 식당 -->
						<div class="mapImageComent mt50 classListCon15">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_B1F_04.jpg" alt="지하평면도 - 1.식당 위치 : 일반인출입구로 입장하여 여자화장실을 지나 강당 맞은편 매점 뒷쪽에 위치합니다. 2.편의시설 : 엘리베이터, 공중전화, 남자화장실, 여자화장실" />
							</div>
							<div class="subBoxTxt">
								<h4>BIF 식당</h4>
								<ul>
									<li>주간식단표는 대한민국 국회 홈페이지(www.assembly.go.kr) 공지사항을 참고하시기
										바랍니다.</li>
								</ul>
							</div>
						</div>

						<!-- 연구데이터센터(RDC) -->
						<div class="mapImageComent mt50 classListCon16">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_3F_01.jpg"
									alt="인문자연과학자료실 내부 평면도. 3층 314호에 위치" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략소개</h4>
								<ul>
									<li>국회도서관 연구데이터센터는 통계청에서 제공하는 
									마이크로데이터*중 가장 세세한 정보까지 활용할 수 있는 인가용 데이터를 이용할 수 있는 ‘마이크로데이터 이용센터’와 통계 소프트웨어를 사용할 수 있는 통계분석용 PC 및 통계 데이터분석 전문도서 코너가 있습니다.
									<br />* 마이크로데이터란 통계조사 원자료에서 입력오류, 조사오류, 논리오류 등을 제거하여 작성한 기초데이터를 말합니다.
									</li>
								</ul>
							</div>
<!-- 							<div class="subBoxTxt"> -->
<!-- 								<h4>마이크로데이터 이용센터(RDC) 이용시간</h4> -->
<!-- 								<ul> -->
<!-- 									<li>월~금 : 09:00~12:00, 13:00~18:00</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
							<div class="subBoxTxt subBoxTxt8">
								<h4>이용자료</h4>
								<ul>
									<li>마이크로데이터 이용센터에서는 통계청 생산 49종(조사통계 39종, 행정통계 10종 2021년 10월 기준) 마이크로데이터를 제공합니다.</li>
									<li>특히 행정통계는 조사자료와 행정자료를 결합한 자료로 "마이크로데이터 이용센터"에서만 활용할 수 있습니다.</li>
									<li>전문도서 코너에서 SPSS, SAS, STATA, R 등 통계 소프트웨어 분석 매뉴얼 및
										통계·데이터 분석 관련 자료를 선정하여 비치하고 있습니다.<br />※ 도서관 자료는 도서관 내에서만 이용할
										수 있습니다(대출 불가)
									</li>
									<li style="background: none;">
										<div class="btnView m_ml10">
											<a href="javascript:newViewerCall('rdc_list_2021.hwp', '', 'rdc', '10');" style="width: 152px;" title="새창 열림">
											마이크로데이터 확인하기</a>
										</div>
									</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								
								<h4>이용방법</h4>
								<ul>
									<li class="lh18">마이크로데이터 이용센터는 연구계획서 등을 포함한 신청서를 작성 후, 통계청
										승인이 이루어진 이용자만 이용할 수 있습니다.</li>
									<li style="background: none;">
										<div class="btnView m_ml10">
											
												
												
													<a href="https://mdis.kostat.go.kr/" title="새창열림" target="_blank"><img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="" />이용신청 바로하기</a>
												
											

										</div>
									</li>
								</ul>
							</div>

							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/images/img/img_3F_01_01.jpg" alt="이용센터서비스 이용 프로세스" />
							</div>
							
							<p class="mb30">※마이크로데이터 이용센터 방문 시, 국회도서관 출입절차(열람증 발급 등) 및 이용자 준수사항에 따라 이용하여 주시기 바랍니다.</p>

							<div class="subBoxTxt">
								<h4>문의</h4>
								<ul>
									<li>연구데이터센터 ☎ 02-6788-4392 / 데이터융합분석과 ☎ 02-6788-4476</li>
								</ul>
							</div>
						</div>


						<!-- 빅데이터  -->
						<div class="mapImageComent mt50 classListCon17">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/resource/images/img_1F_05.jpg"
									alt="1층평면도 - 1.빅데이터 연구센터 위치 : 일반인출입구로 입장하여 출입게이트를 지나 중앙홀을 가로질러  대출대  정면 오른쪽에 위치한 국가전략정보센터내에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 남자장애인화장실, 여자화장실, 여자장애인화장실, 현금지급기" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>빅데이터 연구센터 소개</h4>
								<ul>
									<li>${volist.get(8).getGuide_intro()}</li>
								</ul>
							</div>
							
							<div class="mapImg2">
								<img src="${pageContext.request.contextPath}/resource/images/bigdata01.jpg" class="pc_w60" alt="국회도서관 빅데이터 연수센터(가칭)통계청RDC/SDC ·인구동향조사등 연구데이터·유동인구정보등 통계데이터 국회도서관 데이터 라이브러리 ·국회회의록 빅데이터 ·국가학술정보융합데이터 서울특별시 빅데이터 캠퍼스 ·서울시데이터 ·교통, 카드, 지역상권정보등 ·국회 직원 맞춤형 교육 지원" />
							</div>
							
							<div class="subBoxTxt">
								<h4>주요 서비스</h4>
								<ul>
									<li><strong>통계청 SDC & RDC</strong></li>
									<li style="background: none;float: left;"></li>
									<li class="bgNo" style="padding-left:0px;">통계청 RDC 마이크로데이터 49종과 SDC의 51종(행정자료 16종, 민간자료 35종) 데이터를 분석 환경과 함께 지원하고 있습니다.</li>
									
									<li><strong>서울시 빅데이터 캠퍼스</strong></li>
									<li style="background: none;float: left;"></li>
									<li class="bgNo" style="padding-left:0px;">서울시가 구축·구입한 핵심 데이터 107종, 보조 데이터 211종 등을 분석 환경과 함께 지원하고 있습니다.</li>	
																										
									<li><strong>국회도서관 데이터 라이브러리(시범운영)</strong></li>
									<li style="background: none;float: left;"></li>
									<li class="bgNo" style="padding-left:0px;">국회도서관에서 구축 중인 국회회의록 빅데이터, 국가학술정보 융합데이터, 지능형 의회정보 융합분석 데이터 등을 분석 환경과 함께 지원하고 있습니다.</li>
								</ul>
							</div>

							<div class="subBoxTxt" style="margin-bottom:15px;">
								<h4>이용 방법</h4>
								<ul>
									<li>통계청 SDC, 통계청 RDC, 서울시 빅데이터 캠퍼스 서비스는 각 기관별 이용 신청이 필요하고, 분석 결과를 반출하기 위한 별도의 심사과정이 필요합니다.</li>
								</ul>
								
								<!-- // -->
						<div class="welcome">
							<table class="normalTable">
								<caption>이용신청, 자료분석, 분석자료다운로드로 구성</caption>
								<colgroup>
									<col style="width:30%;">
									<col style="width:70%;">
								</colgroup>
								<thead>
								<tr>
									<th scope="row"  style="background:none;" class="m_tCen">
										<img src="${pageContext.request.contextPath}/resource/images/bigdata02.png"  alt="" class="big_wd" />
										<p class="title" style="text-align:center;">이용신청</p>
									</th>
									<td class="end">
										<p class="con">이용하고자 하는 기관의 홈페이지에서 이용 신청</p>
									</td>
								</tr>
								</thead>
								<tbody>
								<tr>
									<th scope="row"  style="background:none;" class="m_tCen">
										<img src="${pageContext.request.contextPath}/resource/images/bigdata03.png"  alt="" class="big_wd" />
										<p class="title" style="text-align:center;">자료분석</p>
									</th>
									<td class="end">
										<p class="con">이용 신청이 승인되면, 빅데이터 연구센터에 방문하여 데이터/자료 분석</p>
										<p class="con">* 필요시 분석 결과 반출 신청
									</td>
								</tr>

								<tr>
									<th scope="row"  style="background:none;" class="m_tCen">
										<img src="${pageContext.request.contextPath}/resource/images/bigdata04.png"  alt="" class="big_wd" />
										<p class="title" style="text-align:center;">분석자료 다운로드</p>
									</th>
									<td class="end">
										<p class="con">분석 결과 반출 신청이 승인되면 PC에서 다운로드</p>
									</td>
								</tr>
								</tbody>
							</table>
						</div>
								<!-- // -->
									
								<ul>
									<li>국회도서관 데이터 라이브러리는 별도의 이용 신청 없이 국회 내부 및 빅데이터 연구센터에 비치된 PC에서 이용할 수 있습니다.</li>
									<li>상세한 이용방법은 아래 각 서비스의 세부 페이지를 참고하세요.</li>	
								</ul>
									
								<div class="tableBox01">
									<div class="bookListBox" style="position: relative;">
										<div class="bigdata">
											<ul style="margin-left:0px;">
												<li class="bgNo rightbo pr17 " style="padding-left:0px;">
												
													<div style="text-align: center;height: 28px;padding: 5px 0;">
														<span class="bookTitle2 pop_sdc mover" style="text-align: center;cursor:pointer;"  data-focus="popSdc" id="popSdc" ><strong>통계청 SDC</strong></span>
													</div>
													
													<span class="btnView pop_sdc" style="float: none;"> 
														<img src="${pageContext.request.contextPath}/resource/images/sdc.png" class="sdc mover" alt="통계청 SDC"  data-focus="popSdc" />
													</span>
													
													<div class="box707 ">
														<span class="btnView " style="float: none;"> <!-- pop_sdc -->
															<button class="btn_navy urlView" data-url="https://data.kostat.go.kr/sbchome/contents/cntPage.do?cntntsId=CNTS_000000000000104&curMenuNo=T_01_04_00_0OP" style="border-radius: 0" title="통계청 SDC 새창열기" >이용신청하기</button> <!-- data-focus="popSdc" -->
														</span>
													</div>	
																								
												</li>
											
												<li class="bgNo rightbo rightbo0 "  style="padding-left:0px;">
													<div style="text-align: center;height: 28px;padding: 5px 0;">
													<span class="bookTitle2 pop_rdc mover"  style="text-align: center;cursor:pointer;" data-focus="popRdc" id="popRdc"><strong>통계청 RDC</strong></span></div>
													
													<span  class="pop_rdc" style="cursor:pointer;">
														<img src="${pageContext.request.contextPath}/resource/images/rdc.png" class="rdc mover" alt="통계청 RDC" data-focus="popRdc"/> 
													</span>
													
													<div class="box707">
														<span class="btnView " style="float: none;"> 
															<button class="btn_navy urlView" data-url="https://mdis.kostat.go.kr/pageLink.do?link=content/SISMN091002&curMenuNo=UI_POR_P9002" style="border-radius: 0" title="통계청 RDC 새창열기">이용신청하기</button>  <!-- data-focus="popSdc" -->
														</span>
													</div>	
																								
												</li>
												
												<li class="bgNo rightbo pr17 "  style="padding-left:0px;">
													<div style="text-align: center;height: 28px;padding: 5px 0;">
													<span class="bookTitle2 pop_seoul mover" style="text-align: center;cursor:pointer;" data-focus="popSeoul" id="popSeoul"><strong>서울시 빅데이터 캠퍼스</strong></span></div>
													
													<span class="pop_seoul">   
														<img src="${pageContext.request.contextPath}/resource/images/seoulBig.png" class="seoul mover" alt="서울시 빅데이터 캠퍼스" data-focus="popSeoul" />
													</span>
													
													<div class="box707">
														<span class="btnView " style="float: none;"> <!-- pop_seoul -->
															<button class="btn_navy urlView" data-url="https://bigdata.seoul.go.kr/cnts.do?r_id=P130" style="border-radius: 0" title="서울시 빅데이터 캠퍼스 새창열기">이용신청하기</button>  <!-- data-focus="popSeoul" -->
														</span>
													</div>	
																												
												</li>
											
												<li class="bgNo "  style="padding-left:0px;">
													<a href="#" class="pop_nal" data-focus="popNal" style="text-decoration:none !important;">
														<div style="text-align: center;height: 28px;padding: 5px 0;">
														<span class="bookTitle2 pop_nal mover" style="text-align: center;cursor:pointer;"  id="popNal"><strong>데이터 라이브러리</strong></span></div>
														<span>
															<img src="${pageContext.request.contextPath}/resource/images/dataNal.png" class="dataNal mover" alt="데이터 라이브러리"  />
														</span>
													</a>											
<!-- 													<div class="box707"> -->
<!-- 														<span class="btnView pop_nal" style="float: none;">  -->
<!-- 															<button class="btn_navy" data-focus="popNal" style="border-radius: 0">이용방법 보기</button> -->
<!-- 														</span> -->
<!-- 													</div>	 -->
																												
												</li>    
											</ul>
										</div>
									</div>			  							
								</div>												
							</div>

							
							
							<div class="subBoxTxt">
								<h4>문의</h4>
								<ul>
									<li>${volist.get(8).getGuide_phonenumber()}</li>
								</ul>
							</div>

						</div>


						<!-- 장애인석 -->
						<div class="mapImageComent mt50 classListCon18">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/resource/images/img_1F_06.jpg"
									alt="1층평면도 - 1.장애인석 위치 : 일반인출입구로 입장하여 출입게이트를 지나 중앙홀을 가로질러 대출대 왼쪽편에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 남자장애인화장실, 여자화장실, 여자장애인화장실, 현금지급기" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략 소개</h4>
								<ul>
									<li>${volist.get(11).getGuide_intro()}</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>이용 시간</h4>
								<ul>
									<li>${volist.get(11).getGuide_time()}</li>
								</ul>
							</div>
							<div class="subBoxTxt">
								<h4>이용 대상</h4>
								<ul>
									<li>장애인 이용자</li>
								</ul>
							</div>

							<div class="subBoxTxt">
								<h4>이용이 가능한 열람보조기기</h4>
								<ul>
									<li>점자프린터: 점자 인쇄용 프린터</li>
									<li>약시자용 전자 독서 확대기: 저시력자를 위한 전자 확대기</li>
									<li>휴대용 독서 확대기: 휴대용 디지털 독서 확대기</li>
									<li>책마루 OCR-ET: 다양한 형식의 파일을 음성으로 변환, 시각장애인들의 정보접근 향상에 도움을 줄 수 있는 열람보조기기</li>
									<li>점자정보단말기"한소네": 소리(TTS)와 촉각(점자셀)을 이용, 다양한 어플리케이션을 사용할 수 있는 시각장애인용 점자정보단말기</li>
									<li>인쇄물 음성변환 출력기: 인쇄물을 음성으로 변화하여 읽어주는 OCR 독서 장치</li>								
									<li>페이지 터너: 책을 자동으로 넘겨주는 열람보조기기</li>
									<li>웨어러블 포인터 마우스: 손가락에 착용하여 적은 움직임으로 사용하는 마우스 포인터</li>
									<li>전동휠체어 급속 충전기: 전동 휠체어의 배터리 충전 및 바퀴 공기주입용 충전기</li>
									<li>한손 키보드: 한손으로도 타이핑이 가능한 특수 키보드</li>
									<li>마우스 스틱: 입에 물고 자판기를 치거나 종이를 넘길 수 있는 중증장애인용 막대</li>
									<li>머리마우스: 머리의 움직임을 인식하여 컨트롤하는 특수마우스</li>
									<li>안구마우스: 눈의 움직임을 인식하여 컨트롤하는 특수마우스</li>
									<li>턱마우스: 턱의 움직임을 인식하여 컨트롤하는 특수마우스</li>
								</ul>
							</div>

							<div class="subBoxTxt">
								<h4>이용 방법</h4>
								<ul>
									<li>장애인석은 당일 1층 대출대에서 선착순 신청 후 사용 가능(장애인복지카드 지참)</li>
								</ul>
							</div>

							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(11).getGuide_location()}</li>
									<li>${volist.get(11).getGuide_phonenumber()}</li>
								</ul>
							</div>

						</div>

						<!-- 상설전시실 -->
						<div class="mapImageComent mt50 classListCon19">
							<div class="mapImg">
								<img src="${pageContext.request.contextPath}/resource/images/img_1F_07.jpg"
									alt="1층평면도 - 1.상설전시실 위치 : 일반인출입구로 입장하여 출입게이트를 지나 중앙홀을 가로질러 왼쪽편에 위치합니다. 2.편의시설 : 엘리베이터, 남자화장실, 남자장애인화장실, 여자화장실, 여자장애인화장실, 현금지급기" />
							</div>
							<div class="subBoxTxt mt20">
								<h4>간략 소개</h4>
								<ul>
									<li>${volist.get(12).getGuide_intro()}</li>
								</ul>
							</div>
<!-- 							<div class="subBoxTxt"> -->
<!-- 								<h4>이용 시간</h4> -->
<!-- 								<ul> -->
<!-- 									<li>월~금 : 09:00 ~ 22:00</li> -->
<!-- 									<li>토~일 : 09:00 ~ 17:00</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
							<div class="subBoxTxt">
								<h4>이용 방법</h4>
								<ul>
									<li>모든 이용자가 자유롭게 이용할 수 있습니다.</li>
									<li>또한 국회기록보존소 홈페이지를 통해 가상(VR) 전시실을 운영하고 있습니다. 국회도서관 외부에서도
										자유롭게 전시실을 관람하실 수 있습니다.
										<span class="btnView m_ml10" style="margin-top: 10px; float: none;">
											<a href="http://archives.nanet.go.kr/cyberExhibition/playingCyberExh.do" title="새창열림" target="_blank" style="width:180px;"> 
												<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">
												국회기론보존소 바로가기
											</a>
										</span>									
									</li>	
								</ul>
							</div>

							<div class="subBoxTxt">
								<h4>위치 및 전화번호</h4>
								<ul>
									<li>${volist.get(12).getGuide_location()}</li>
									<li>${volist.get(12).getGuide_phonenumber()}</li>
								</ul>
							</div>				

						</div>

					</div>
					<!-- //bodyBox001 -->
					<!-- 여기서부터 콘텐츠 e -->

				</div>
				<!-- //body -->
			</div>
			<!-- //contentBody -->
		</div>
	</div>
</div>

<!-- 레이어팝업 - 열람신청방법 -->
<div class="layerPopup" id="pop_use">
    <div class="dim"></div>
    <div class="layerPopContainer">
        <h1>열람신청 방법</h1><!-- <span class="close"><a href="#">닫기</a></span> -->
        <div class="layerPopContents">
            <h2>열람신청 방법</h2>
            <div class="lineList"  style="border-top: 0px;">
                <ul>
<!--                 	<li class="txtred"><strong>※ 도서관 야간 이용은 잠정 중단되었으니 참고하시기 바랍니다.</strong></li>  -->
                    <li><span>신청시간</span><p>월~금 09:00 ~ 17:00, 토~일 09:00 ~ 16:00</p></li>
                    <li><span class="mt15">신청방법</span>
                        <p><b>- 국회도서관 방문 → 국회전자도서관에서 자료 검색 → 「열람신청」 → 로그인(아이디/패스워드 입력하기)
                        <br/>- 신청 조회 및 취소: 국회전자도서관 → 「My Library」 → 열람신청조회</b></p></li>
                    <li><span>신청책수</span><p>1회 5책(1일 총 20책)</p></li>
                    <li><span>대기시간</span><p>약 30분</p></li>
                    <li>
						<span >야간이용</span><!-- class="mt10" -->
						<p>월~금 18:00 ~ 21:00</p>
						
						
						
							<button class="btn_round blue" onClick="javascript:loginInfo(); return false;">야간이용 자료신청</button>
						
						
					</li>
                </ul>
            </div>
            <div class="redText">
                <p>※ 도서관 소장 자료는 도서관 내에서만 이용할 수 있습니다.</p>
            </div>
        </div>
        <div class="closeContainer">
            <button class="btn_navy" data-focus="btn_navy" data-id="popUse">닫기</button>
        </div>
    </div>
</div>
<!-- //레이어팝업 - 이용방법 -->

<!-- 레이어팝업 - 복사·출력요금표 -->
<div class="layerPopup" id="pop_print">
    <div class="dim"></div>
    <div class="layerPopContainer">
        <h1>복사·출력요금표</h1><!-- <span class="close"><a href="#">닫기</a></span> -->
        <div class="layerPopContents scroll">
            <h2>국회도서관 복사·출력 서비스 요금</h2>
            
            <div style="float:right;padding: 15px;"><p>※ 1면당 가격</p></div>
            
            <table class="normalTable text-center">
                <caption>국회도서관 복사·출력 서비스 요금에 대한 표로 구분, A3, A4, B4, B5, 비고로 구성</caption>
                <colgroup>
                    <col style="width:20%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:20%;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">구분</th>
                        <th scope="col">A3</th>
                        <th scope="col">A4</th>
                        <th scope="col">B4</th>
                        <th scope="col">B5</th>
                        <th scope="col" class="end">비고</th>
                    </tr>
                </thead>
                 <tbody>
                    <!-- 자율복사 -->
                    <tr>
                        <td rowspan="2"><div class="box701">자율복사</div></td>
                        <td><div class="box701">흑백</div></td>
                        <td><div class="box701">90원</div> </td>
                        <td><div class="box701">50원</div></td>
                        <td><div class="box701">70원</div></td>
                        <td><div class="box701">50원</div></td>
                        <td rowspan="2" class="end"><div class="box701"></div></td>
                    </tr>
                    <tr>
                        <td><div class="box701">컬러</div></td>
                        <td><div class="box701">1,000원</div> </td>
                        <td><div class="box701">500원</div></td>
                        <td><div class="box701">800원</div></td>
                        <td><div class="box701">500원</div></td>
                    </tr>

                    <!-- 위탁복사 -->
                    <tr>
                        <td rowspan="2"><div class="box701">위탁복사</div></td>
                        <td><div class="box701">흑백</div></td>
                        <td><div class="box701">110원</div> </td>
                        <td><div class="box701">60원</div></td>
                        <td><div class="box701">80원</div></td>
                        <td><div class="box701">60원</div></td>
                        <td rowspan="2" class="end"><div class="box701"></div></td>
                    </tr>
                    <tr>
                        <td><div class="box701">컬러</div></td>
                        <td><div class="box701">1,000원</div> </td>
                        <td><div class="box701">500원</div></td>
                        <td><div class="box701">800원</div></td>
                        <td><div class="box701">500원</div></td>
                    </tr>
                    
                    <!-- 프린트 -->
                    <tr>
                        <td rowspan="2"><div class="box701">프린트</div></td>
                        <td><div class="box701">흑백</div></td>
                        <td><div class="box701">120원</div> </td>
                        <td><div class="box701">60원</div></td>
                        <td><div class="box701">90원</div></td>
                        <td><div class="box701">55원</div></td>
                        <td rowspan="2" class="end"><div class="box701"></div></td>
                    </tr>
                    <tr>
                        <td><div class="box701">컬러</div></td>
                        <td><div class="box701">1,000원</div> </td>
                        <td><div class="box701">500원</div></td>
                        <td><div class="box701">900원</div></td>
                        <td><div class="box701">500원</div></td>
                    </tr>
                    
                    <!-- 마이크로필름 리더프린트 -->
                    <tr>
                        <td><div class="box701">마이크로필름 리더프린트</div></td>
                        <td><div class="box701">흑백</div> </td>
                        <td><div class="box701">300원</div></td>
                        <td><div class="box701">150원</div></td>
                        <td><div class="box701">-</div></td>
                        <td><div class="box701">-</div></td>
                        <td class="end"><div class="box701"></div></td>
                    </tr>
                    
                    
                    <!-- 우편복사(기본료 별도) -->
                    <tr>
                        <td rowspan="2"><div class="box701">우편복사(기본료 별도)</div></td>
                        <td><div class="box701">흑백</div></td>
                        <td><div class="box701">120원</div> </td>
                        <td><div class="box701">70원</div></td>
                        <td><div class="box701">90원</div></td>
                        <td><div class="box701">60원</div></td>
                        <td rowspan="2" class="end">
                        	<div class="box701">&#60;우편복사 기본료&#62;<br/>일반우편 4,000원/<br/>빠른우편 7,000원<br/>(제주‧도서 지역은<br/> 일반우편 7,000원/<br/>빠른우편10,000원)</div>
                        </td>
                    </tr>
                    <tr>
                        <td><div class="box701">컬러</div></td>
                        <td><div class="box701">1,000원</div> </td>
                        <td><div class="box701">500원</div></td>
                        <td><div class="box701">800원</div></td>
                        <td><div class="box701">500원</div></td>
                    </tr>
                    
                    <!-- 팩스(기본료 별도) -->
                    <tr>
                        <td colspan="2"><div class="box701">팩스(기본료 별도)</div></td>
                        <td colspan="4"><div class="box701">300원</div> </td>
                        <td class="end"><div class="box701">기본료 3,000원</div></td>
                    </tr>
                    
                    <!-- 스캔(개인문서) -->
                    <tr>
                        <td colspan="2"><div class="box701">스캔(개인문서)</div></td>
                        <td><div class="box701">150원</div> </td>
                        <td><div class="box701">100원</div></td>
                        <td><div class="box701">150원</div></td>
                        <td><div class="box701">100원</div></td>
                        <td class="end"><div class="box701"></div></td>
                    </tr>
                    
                </tbody>
            </table>
            
			<div style="float:left;padding: 15px 15px 0px 0px;"><p>※ 링 제본 요금은 페이지 수에 따라 2,000원 ~ 3,000원, 책 제본 요금은 6,000원</p></div>            
            
        </div>
        <div class="closeContainer">
            <button class="btn_navy" data-focus="btn_navy" data-id="popPrint">닫기</button>
        </div>
    </div>
</div>
<!-- //레이어팝업 - 복사요금표 -->

<!-- 레이어팝업 - 통계청 SDC 이용 신청 하기 -->
<div class="layerPopup" id="pop_sdc">
    <div class="dim"></div>
    <div class="layerPopContainer"  id="pop_sdc_lpc" >
        <h1>통계청 SDC 이용 신청 하기</h1><!-- <span class="close"><a href="#">닫기</a></span> -->
        <div class="layerPopContents scroll">
            <h2>통계청 SDC 이용 신청 하기</h2>
            <div class="lineList2" style="border-top: 0px;">
            	<div class="subBoxTxt">
					<h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">간략소개</h4>
					<ul>
						<li>통계데이터센터는 통계청에서 제공하는 행정통계자료 및 민간자료를 이용자가 편리하게 이용하고, 연계·융합이 가능하도록 구축된 데이터 플랫폼입니다.</li>
					</ul>
					
	                <h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">이용자료</h4>
					<ul>
						<li>통계데이터센터에서는 행정 통계자료 16종, 민간자료 35종 합계 51종(2022년 6월 기준)을 서비스하고 있으며, 행정통계자료(통계등록부·통계기초자료) 및 민간자료를 연계하여 분석할 수 있습니다.</li>
					</ul>
					
	                <h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">이용방법</h4>
					<ul>
						<li>SDC는 홈페이지(data.kostat.go.kr)를 통해 이용 신청 후, 통계청 승인이 이루어진 이용자만 이용할 수 있으며, 아래 8단계를 통해 진행됩니다.</li>
<!-- 						<li class="bgNo"><img src="${pageContext.request.contextPath}/resource/images/sdc2.jpg" alt="통계청 SDC" class="w_sdc"></li> -->
					</ul>
				</div>		
			<div class="roundList eight" style="padding: 0 0 30px;border-bottom:0px;">
                <ul>
                    <li>
                        <div class="step">
                            <p>STEP</p>
                            <p>01</p>
                        </div>
                        <b>홈페이지(data.kostat.go.kr)를 통한 이용 신청</b>
                        <br><p>- 이용자 보유 자료 반입 시 자료 반입 신청</p>
                        <br><p>- 서버 등 장비 반입 시 장비 반입 신청</p>
                    </li>
                    <li>
                        <div class="step">
                            <p>STEP</p>
                            <p>02</p>
                        </div>
                        <p><b>자료제공여부 검토</b></p>
                    </li>
                    <li>
                        <div class="step">
                            <p>STEP</p>
                            <p>03</p>
                        </div>
						<p><b>이용수수료 납부 및 센터 좌석 배정</b></p>
                       
                    </li>
                    <li>
                        <div class="step">
                            <p>STEP</p>
                            <p>04</p>
                        </div>
                        <p><b>센터 방문 및 자료 분석</b></p>
                    </li>
                    <li>
                        <div class="step">
                            <p>STEP</p>
                            <p>05</p>
                        </div>
                        <b>분석결과 반출신청</b>
                        <br><p>- 장비 반입한 경우 장비 반출 신청</p>
                    </li>
                    
                    <li>
                        <div class="step">
                            <p>STEP</p>
                            <p>06</p>
                        </div>
                        <p><b>분석결과 반출여부 검토</b></p>
                    </li>
                    <li>
                        <div class="step">
                            <p>STEP</p>
                            <p>07</p>
                        </div>
                        <p><b>분석결과 다운로드</b></p>
                    </li>
                    <li>
                        <div class="step">
                            <p>STEP</p>
                            <p>08</p>
                        </div>
						<p><b>연구결과 제출 및 기술노트 공유</b></p>
                    </li>
                                        
                </ul>
            </div> 
            
           <div class="mapImg"> <img src="${pageContext.request.contextPath}/resource/images/sdc1.jpg" alt="이용방법 절차 안내 이미지" class="w_sdc"></div>
            
			<div style="text-align: right;"><p><b>&#60;출처: 통계청 SDC&#62;</b></p></div>
            
			<div class="jengBtn mb20">
            
				<a href="https://data.kostat.go.kr/sbchome/contents/cntPage.do?cntntsId=CNTS_000000000000104&curMenuNo=T_01_04_00_0OP" title="새창열기" target="_blank">
					<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">이용 신청 및 데이터 확인하기
				</a>
            		

			</div>
			
            </div> <!-- //lineList2 e -->
            
        </div> <!-- //layerPopContents e -->
        <div class="closeContainer">
            <button class="btn_navy" data-focus="pop_sdc_close" data-id="popSdc">닫기</button>
        </div>
    </div>
</div>
<!-- //레이어팝업 - 통계청 SDC 이용 신청 하기 -->

<!-- 레이어팝업 - 통계청 RDC 이용 신청 하기 -->
<div class="layerPopup" id="pop_rdc">
    <div class="dim"></div>
    <div class="layerPopContainer"  id="pop_rdc_lpc" >
        <h1>통계청 RDC 이용 신청 하기</h1><!-- <span class="close"><a href="#">닫기</a></span> -->
        <div class="layerPopContents scroll">
            <h2>통계청 RDC 이용 신청 하기</h2>
            <div class="lineList2" style="border-top: 0px;">
            	<div class="subBoxTxt">
					<h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">간략소개</h4>
					<ul>
						<li>통계청 RDC에서는 통계청에서 제공하는 마이크로데이터*중 가장 세세한 정보까지 활용할 수 있는 인가용 데이터를 이용할 수 있습니다.</li>
						<li class="bgNo">* 마이크로데이터란 통계조사 원자료에서 입력오류, 조사오류, 논리오류 등을 제거하여 작성한 기초데이터를 말합니다.</li>
					</ul>
					
	                <h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">이용자료</h4>
					<ul>
						<li>통계청 RDC에서는 통계청 생산 49종(조사통계 39종, 행정통계 10종 2022년 6월 기준) 마이크로데이터를 제공합니다.</li>
						<li>특히 행정통계는 조사자료와 행정자료를 결합한 자료로 RDC에서만 활용할 수 있습니다.</li>
					</ul>
					
	                <h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">이용방법</h4>
					<ul>
						<li>통계청 RDC는 연구계획서 등을 포함한 신청서를 작성 후, 통계청 승인이 이루어진 이용자만 이용할 수 있습니다.</li>
<!-- 						<li class="bgNo"><img src="${pageContext.request.contextPath}/resource/images/sdc2.jpg" alt="통계청 SDC" class="w_sdc"></li> -->
					</ul>
					
	                <h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">이용센터서비스 이용 프로세스</h4>
					<ul>
						<li class="bgNo">
						<div><img src="${pageContext.request.contextPath}/resource/images/rdc1.jpg" alt="로그인>서양석동의>이용센터서비스 신청서작성>연구계획서 검토 후 승인>이용자 준수사항 동의 및 결제>이용자료 생성 > 이용센터 서비스 방문 분석작업>데이터 반출 검토 후 승인 >MDIS 웹사이트에서 다운로드" class="w_rdc"></div>
						</li>
					</ul>					
					
				</div>		
            
           
            
			<div class="jengBtn mb20">
            
				<a href="https://mdis.kostat.go.kr/pageLink.do?link=content/SISMN091002&curMenuNo=UI_POR_P9002" title="새창열기" target="_blank">
					<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">이용 신청 및 데이터 확인하기
				</a>
            		

			</div>
			
            </div> <!-- //lineList2 e -->
            
        </div><!-- //layerPopContents e -->
        <div class="closeContainer">
            <button class="btn_navy" data-focus="pop_rdc_close" data-id="popRdc">닫기</button>
        </div>
    </div>
</div>
<!-- //레이어팝업 - 통계청 SDC 이용 신청 하기 -->

<!-- 레이어팝업 - 서울 빅데이터 캠퍼스  이용 신청 하기 -->
<div class="layerPopup" id="pop_seoul">
    <div class="dim"></div>
    <div class="layerPopContainer "  id="pop_seoul_lpc" >
        <h1>서울 빅데이터 캠퍼스 이용 신청 하기 </h1><!-- <span class="close"><a href="#">닫기</a></span> -->
        <div class="layerPopContents ">
            <h2>서울 빅데이터 캠퍼스 이용 신청 하기</h2>
            
            <div class="lineList2" style="border-top: 0px;">
            	<div class="subBoxTxt">
					<h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">간략소개</h4>
					<ul>
						<li>서울시 빅데이터 캠퍼스에서는 서울시가 보유하고 있는 빅데이터와 민간 빅데이터를 활용 및 분석할 수 있도록 시스템 자원과 분석 소프트웨어 이용 서비스를 제공하고 있습니다.</li>
					</ul>
					
	                <h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">이용자료</h4>
					<ul>
						<li>서울시 보유 318종(핵심 데이터 107종, 보조 데이터 211종, 2022년 6월 기준) 데이터를 제공합니다.</li>
					</ul>
					
	                <h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">이용방법</h4>
					<ul>
						<li>서울시 빅데이터 캠퍼스는 신청서를 작성 후, 승인이 이루어진 이용자만 이용할 수 있습니다.</li>
					</ul>
				</div>		
				<div class="roundList2 six" style="padding: 0 0 30px;border-bottom:0px;">
	                <ul>
	                    <li>
	                        <div class="step" style="padding-top:35px;">
	                            <p>로그인</p>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="step">
	                            <p>이용신청서 작성</p>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="step">
	                            <p>검토 후<br/> 승인</p>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="step">
	                            <p>분석실<br/> 이용</p>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="step">
	                            <p>분석결과<br/> 반출 신청</p>
	                        </div>
	                    </li>
	                    
	                    <li>
	                        <div class="step"  style="padding-top:35px;">
	                            <p>심사완료</p>
	                        </div>
	                    </li>
	                                        
	                </ul>
            	</div> 
            				
			<div class="jengBtn">
            
				<a href="https://bigdata.seoul.go.kr/cnts.do?r_id=P130" title="새창열기" target="_blank">
					<img src="${pageContext.request.contextPath}/images/bg/btn_icon_001.png" alt="">이용 신청 및 데이터 확인하기
				</a>
            		

			</div>
			            					
            </div><!-- //lineList2 e -->

        </div><!-- //layerPopContents e -->
        <div class="closeContainer">
            <button class="btn_navy" data-focus="pop_seoul_close" data-id="popSeoul">닫기</button>
        </div>
    </div>
</div>
<!-- //레이어팝업 - 서울 빅데이터 캠퍼스 이용 신청 하기 -->

<!-- 레이어팝업 - 국회도서관 데이터 라이브러리(시범서비스) -->
<div class="layerPopup" id="pop_nal">
    <div class="dim"></div>
    <div class="layerPopContainer "  id="pop_nal_lpc" >
        <h1>국회도서관 데이터 라이브러리(시범서비스)</h1><!-- <span class="close"><a href="#">닫기</a></span> -->
        <div class="layerPopContents ">
            <h2>국회도서관 데이터 라이브러리(시범서비스)</h2>
            
            <div class="lineList2" style="border-top: 0px;">
            	<div class="subBoxTxt">
					<h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">간략소개</h4>
					<ul>
						<li>국회도서관이 구축하고 있는 데이터셋을 이용자가 직접 분석하고 분석 결과를 다시 제공하는 데이터 선순환 체계를 지향하는 서비스입니다.</li>
					</ul>
					
	                <h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">이용자료</h4>
					<ul>
						<li>국회도서관이 구축한 회의록, 표, 학술정보, 소셜데이터, 연구자정보 등의 데이터셋과 이용자가 게시한 데이터를 제공합니다.</li>
					</ul>
					<table class="normalTable text-center" style="margin-bottom:20px;">
		                <caption>국회도서관 데이터 라이브러리(시범서비스)에 대한 표로 구분, 데이터셋 목록으로 구성</caption>
		                <colgroup>
		                    <col style="width:10%;">
		                    <col style="width:30%;">
		                </colgroup>
		                <thead>
		                    <tr>
		                        <th scope="col">구분</th>
		                        <th scope="col" class="end">데이터셋 목록</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <!-- 회의록 -->
		                    <tr>
		                        <td><div class="box701">회의록</div></td>
		                        <td class="end"><div class="box701">대수별·회의구분별 국회회의록 데이터셋</div></td>
		                    </tr>
		
		                    <!-- 표 -->
		                    <tr>
		                        <td><div class="box701">표</div></td>
		                        <td class="end"><div class="box701">예산정책처 발간자료 표 데이터 등</div></td>
		                    </tr>
		                    
		                    <!-- 학술정보 -->
		                    <tr>
		                        <td><div class="box701">학술정보</div></td>
		                        <td class="end"><div class="box701">국가학술정보 융합데이터 주제어 RDF 데이터 등</div></td>
		                    </tr>
		                    
		                    <!-- 소셜데이터 -->
		                    <tr>
		                        <td><div class="box701">소셜데이터</div></td>
		                        <td class="end"><div class="box701">국회도서관 「AI 보좌관」이 제공하는 최신이슈 데이터셋</div></td>
		                    </tr>
		                    
		                    
		                    <!-- 연구자정보-->
		                    <tr>
		                        <td><div class="box701">연구자정보</div></td>
		                        <td class="end">
		                        	<div class="box701">국회의원 정보 데이터셋, 박사 학위논문 지도교수-학위자 관계망 등</div>
		                        </td>
		                    </tr>
		                    
		                    
		                </tbody>
		            </table>
	                <h4 class="titleH4" style="margin-bottom:6px;margin-top:10px;">이용방법</h4>
					<ul>
						<li>현재 시범서비스 운영 중으로 국회 내부 및 국회도서관 빅데이터 연구센터에 비치된 PC에서 사전 신청 없이 이용할 수 있습니다. </li>
						<li>해당 PC에서 지능형 의회정보 융합분석 데이터(뉴스, 소셜데이터)를 기간 제한 없이 검색 가능합니다.</li>
					</ul>
				</div>		
            				
            </div><!-- //lineList2 e -->

        </div><!-- //layerPopContents e -->
        <div class="closeContainer">
            <button class="btn_navy" data-focus="pop_nal_close" data-id="popNal">닫기</button>
        </div>
    </div>
</div>
<!-- //레이어팝업 - 국회도서관 데이터 라이브러리(시범서비스) -->

<script>
	$(function(){
		$(".pop_use").click(function(){
	    	$("#pop_use").css("display","block");
	    	$("html, body").css({
	    		"overflow" : "hidden",
	    		"height"   : "100%"
	    	});
	    	
	    	$("[data-focus=btn_navy]").focus();
	    });
		
		$(".pop_print").click(function(){
	    	$("#pop_print").css("display","block");
	    	$("html, body").css({
	    		"overflow" : "hidden",
	    		"height"   : "100%"
	    	});
	    	
	    	$("[data-focus=btn_navy]").focus();
	    });
		
		$(".pop_sdc").click(function(){
	    	$("#pop_sdc").css("display","block");
	    	$("html, body").css({
	    		"overflow" : "hidden",
	    		"height"   : "100%"
	    	});
	    	
	    	$("#pop_sdc_lpc").attr("tabindex", 0).focus();
	    });
		
		$(".pop_rdc").click(function(){
	    	$("#pop_rdc").css("display","block");
	    	$("html, body").css({
	    		"overflow" : "hidden",
	    		"height"   : "100%"
	    	});
	    	
	    	$("#pop_rdc_lpc").attr("tabindex", 0).focus();
	    });
		
		$(".pop_seoul").click(function(){
	    	$("#pop_seoul").css("display","block");
	    	$("html, body").css({
	    		"overflow" : "hidden",
	    		"height"   : "100%"
	    	});
	    	
	    	$("#pop_seoul_lpc").attr("tabindex", 0).focus();
	    });		
		
		$(".pop_nal").click(function(e){
			e.preventDefault();
	    	$("#pop_nal").css("display","block");
	    	$("html, body").css({
	    		"overflow" : "hidden",
	    		"height"   : "100%"
	    	});
	    	
	    	$("#pop_nal_lpc").attr("tabindex", 0).focus();
	    });	
		
		
		$(".urlView").click(function(){
	        var userIp = "123.14";
	        if(userIp == '10.201' || userIp == '10.202' || userIp == '0:0:0:'){
		        ipck();
		        return;
	        }		
	        
			var url = $(this).attr("data-url");
			$("#urlform").attr("target","_blank");
			$("#urlform").attr("action", url).submit();			
		});
		
		$(".mover").hover(function(){
			var id = $(this).attr("data-focus");
			$("#"+id+"> strong").css('color', '#e8396f');
		}, function(){
			var id = $(this).attr("data-focus");
			$("#"+id+"> strong").css('color', '#383838');
		}
		
		);
		
	});
</script>
	





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


    <script type='text/javascript' src="${pageContext.request.contextPath}/js/bs_trk.js"></script>

<script type="text/javascript" defer='defer'>/* CLICKZONE SCRIPT V.V.4 *//*X*//* COPYRIGHT 2002-2017 BIZSPRING INC. *//*X*//* DO NOT MODIFY THIS SCRIPT. *//*X*/


    var _CZN = "29"; //운영서버 : 10

</script>
<script type='text/javascript' defer="defer" src="https://webstat.nanet.go.kr/InsightTrk/js/InsightClickZone.js"></script>
<!-- [end] 접속 로그 -->



<form name="footerForm" method="post">
    <input type="hidden" name="deviceType" value="mob"/>
</form>


    <!-- footer contents -->
    <div class="footerContents">
        <div class="inner">
            <div class="chatBot">
            <!-- DR 제거 -->
                <a href="#" id="floating_box" title="새창열림"><img src="${pageContext.request.contextPath}/resource/images/img_chatbot.png" alt="챗봇" /></a>
            </div>
            <div class="footerTopBox">
                <ul class="pvLink">
                    <li><a href="/member/persionlInfoView.do">개인정보처리방침</a></li>
                    <li><a href="/member/mailrefusalView.do">이메일수집거부</a></li>
                    <li class="mo"><a href="#top">TOP</a></li>
                </ul>

                <div class="frmLink snsW480">

                	<div class="snsMl75">
                     
                		<a href="https://www.youtube.com/c/NALKR" target="_blank" title="YouTube 새창열기" class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                			<img src="${pageContext.request.contextPath}/images/sns/sns_1.png" alt="YouTube" style="width:25px;margin-top: 8px;"/>
                		</a>
                		<a href="https://www.instagram.com/nal_kr/"  target="_blank" title="Instagram 새창열기"  class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                			<img src="${pageContext.request.contextPath}/images/sns/sns_2.png" alt="Instagram" style="width:25px;margin-top: 8px;"/>
                		</a>
                		<a href="https://www.facebook.com/NationalAssemblyLibraryROK" target="_blank" title="Facebook 새창열기"  class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                			<img src="${pageContext.request.contextPath}/images/sns/sns_3.png" alt="Facebook" style="width:25px;margin-top: 8px;"/>
                		</a>
                		<a href="https://blog.naver.com/nalkr2017" target="_blank" title="블로그 새창열기"  class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                			<img src="${pageContext.request.contextPath}/images/sns/sns_4.png" alt="블로그 " style="width:25px;margin-top: 8px;"/>
                		</a>
                                    		
                	</div>
                	                
                    <form name="footerLinkForm" id="footerLinkForm"></form>
                    <fieldset>
                        <legend>관련사이트</legend>
                        <div class="siteLink">
                            <select name="siteLink" id="siteLink" title="관련사이트 바로가기">
                            	<option value="23" title="국회부산도서관">국회부산도서관</option>
                                <option value="1" title="대한민국 국회">대한민국 국회</option>
                                <option value="2" title="국회사무처">국회사무처</option>
                                <option value="3" title="국회예산정책처">국회예산정책처</option>
                                <option value="4" title="국회입법조사처">국회입법조사처</option>
                                <option value="20" title="국회미래연구원">국회미래연구원</option>
                                <option value="7" title="국회기록보존소">국회기록보존소</option>
                                <option value="21" title="헌법재판소도서관">헌법재판소도서관</option>
                                <option value="5" title="선거정보도서관">선거정보도서관</option>
                                <option value="6" title="한국학술지인용색인">한국학술지인용색인</option>
                                <option value="8" title="국가전자도서관">국가전자도서관</option>
                                <option value="9" title="국가정책연구포털">국가정책연구포털</option>
                                <option value="16" title="국가학술정보 클라우드">국가학술정보 클라우드</option>
                                <!-- <option value="18" title="독도홈페이지">독도홈페이지</option> -->
                                <option value="17" title="디지털콘텐츠식별체계">디지털콘텐츠식별체계</option>
                                <option value="19" title="학술연구자정보 공유">학술연구자정보 공유</option>
                                <option value="22" title="지능형 분석(아르고스)">지능형 분석(아르고스)</option>
                            </select>
                        </div>
                        <a href="javascript:footerLink($('#siteLink').val());" title="새창열림">이동</a>
                    </fieldset>
                </div>
            </div>

            <div class="footerBottomBox">
                <p class="copyright">
                    국회도서관 - 서울특별시 영등포구 의사당대로 1 (여의도동) (우07233)<br>
                    홈페이지 관련 문의 : webw3@nanet.go.kr  /  전화문의 : 02-6788-4211, 080-788-4211(수신자 부담)<br>
                    Copyright ⓒ 대한민국 국회도서관 All rights reserved.
                </p>
                <div class="otherban">
                    
                        <a href="https://ccl.cckorea.org" target="_blank" title="새창열림">
                    
                            <img src="${pageContext.request.contextPath}/resource/images/img/logoSite01.png" alt="creativecommons">
                        </a>
                    
                        <a href="http://www.webwatch.or.kr/Situation/WA_Situation.html?MenuCD=110" target="_blank" title="새창열림">
                    
                            <img src="${pageContext.request.contextPath}/resource/images/img/logoSite02.png" alt="과학기술정보통신부 WA WEB접근성(웹 접근성 품질인증 마크) (사)한국시각장애인연합회 2021.12.28~2022.12.27" title="과학기술정보통신부 WA WEB접근성 (사)한국시각장애인연합회 2021.12.28~2022.12.27" />
                        </a>

                    <a href="#" onclick="footerLink('12');" title="새창열림">
                        <img src="${pageContext.request.contextPath}/resource/images/img/logoSite04.png" alt="107 손말이음센터 연중무휴 국번없이 107 청각,언어장애인 의사소통 지원">
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">


    // link box
    $('.quickMenu ul li a ').click(function(e){
        var id = $(this).attr("id");
        var txt = $("#"+id).find("span").text();

        _trk_clickTrace("EVT", txt);
    });


    function winPopup(){
        window.open("/main/siteListPop.do","banner_list","width=410, height=200, scrollbars=0, resizable=0");//푸터쪽 관련사이트 컨트롤러
    }


    function deviceMobChange(){
        document.footerForm.submit();
    }


    // 관련사이트 컨트롤러
    function ipck() {
        var sideLink = $('#siteLink').val();
        window.open("/main/ipChkPopup.do", "acDbipPopup","width=336, height=350, scrollbars=0, resizable=0");
        if(sideLink == "18"){
            $("#footerLinkForm").attr("target", "_blank");
            $("#footerLinkForm").attr("action","http://dokdo.nanet.go.kr/dokdo/").submit();
        }
    }


    function footerLink(gubun) {

        var userIp = "123.14";
        if(userIp == '10.201' || userIp == '10.202' || userIp == '0:0:0:'){
            if(gubun != "1" && gubun != "2" && gubun != "3" && gubun != "4" && gubun != "20" && gubun != "22"  && gubun != "23"  && gubun != "7"){
                ipck();
                return;
            }
        }        	


        $("#footerLinkForm").attr("target", "_blank");

        if (gubun == "1") {
            // 대한민국 국회
            $("#footerLinkForm").attr("action","https://www.assembly.go.kr").submit();
        } else if (gubun == "2") {
            // 국회사무처
            $("#footerLinkForm").attr("action", "https://nas.assembly.go.kr/nas/index.do").submit();
        } else if (gubun == "3") {
            // 국회예산정책처
            $("#footerLinkForm").attr("action","https://www.nabo.go.kr/index.jsp").submit();
        } else if (gubun == "4") {
            // 국회입법조사처
            $("#footerLinkForm").attr("action","https://www.nars.go.kr/index.do").submit();
        } else if (gubun == "20") {
            // 국회미래연구원 (30 임의 부여)
            $("#footerLinkForm").attr("action","https://www.nafi.re.kr/new/index.do").submit();
        } else if (gubun == "5") {
            // 선거정보도서관
            $("#footerLinkForm").attr("action","https://elecinfo.nec.go.kr/neweps/main.do").submit();
        } else if (gubun == "6") {
            // 한국학술지인용색인
            $("#footerLinkForm").attr("action", "https://www.kci.go.kr/kciportal/main.kci").submit();
        } else if (gubun == "8") {
            // 국가전자도서관
            $("#footerLinkForm").attr("action", "https://www.dlibrary.go.kr").submit();
        } else if (gubun == "9") {
            // 국가정책연구포털
        	$("#footerLinkForm").attr("action","https://www.nkis.re.kr:4445/main.do").submit();
        } else if (gubun == "16") {
            // 국가학술정보 클라우드
            $("#footerLinkForm").attr("action","https://cloud.nanet.go.kr/main.do").submit();
        } else if (gubun == "18") {
            // 독도홈페이지
        	$("#footerLinkForm").attr("action","http://dokdo.nanet.go.kr/dokdo/").submit();
        } else if (gubun == "17") {
            // UCI
            $("#footerLinkForm").attr("action","https://www.uci.or.kr/").submit();
        } else if (gubun == "19") {
            // 국가학술연구자정보 공유
            $("#footerLinkForm").attr("action","https://www.scholar.go.kr").submit();
        } else if (gubun == "31") {
            // 국회법률정보 (31 임의 부여)
            $("#footerLinkForm").attr("action","http://law.nanet.go.kr/main/main.do").submit();
        } else if (gubun == "32") {
            // 국회의원 정책자료 (32 임의 부여)
            $("#footerLinkForm").attr("action","http://ampos.nanet.go.kr:7000/mainPage.do").submit();
        } else if (gubun == "33") {
            // 국회·지방의회 의정정보 (33 임의 부여)
            $("#footerLinkForm").attr("action","http://clik.nanet.go.kr/index.do").submit();
        } else if (gubun == "34") {
            // 국회 기록보존소 (34 임의 부여)
            $("#footerLinkForm").attr("action","http://archives.nanet.go.kr/main.do").submit();
        } else if (gubun == "35") {
            // 아르고스(Argos) (35 임의 부여)
            $("#footerLinkForm").attr("action","http://argos.nanet.go.kr/main/monitoring/simpleMonitoring.do").submit();
        } else if (gubun == "12") {
            // 107손말이음센터
            $("#footerLinkForm").attr("action","http://www.relaycall.or.kr/home/main1.asp").submit();
        } else if (gubun == "21") {
            $("#footerLinkForm").attr("action","https://library.ccourt.go.kr/").submit();
        } else if(gubun == "22"){ //지능형 분석(아르고스)
        	var ccd = '';
        	var _url = "";
        	if(ccd == "E"){
//         		_url = "https://bigdata.nanet.go.kr";
        		_url = "https://argos.nanet.go.kr/main/monitoring/main.do";
        	}else{
        		_url = "https://argos.nanet.go.kr";
        	}
        	$("#footerLinkForm").attr("action",_url).submit();
        }else if (gubun == "23") {
            $("#footerLinkForm").attr("action","https://busan.nanet.go.kr/").submit();
        }else if (gubun == "7") {
            // 국회기록보존소
            $("#footerLinkForm").attr("action", "https://archives.nanet.go.kr/").submit();
        } 
    }


    // 챗봇20190220
    var win = "";
    $(function(){
        $("#floating_box").click(function(e){
            e.preventDefault();

            try{
                if(win != ""){
                    win.close();
                }
            }catch(e){
                win = "";
            }
            win = window.open("/main/chatBot.do","chatbot","width=390, height=600, resizable=no, scrollbars=no, status=no, location=no, directories=no, left=1165, top=280;");
        });
    });

</script>









</body>
</html>