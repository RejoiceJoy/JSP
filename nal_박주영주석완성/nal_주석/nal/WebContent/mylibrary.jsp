<!-- 국회소장자료 : 일반자료 상단 메뉴 --><!-- 국회소장자료 : 공공정책자료 상단 메뉴 --><!-- 국회소장자료 : 왼쪽 메뉴 --><!-- 외부기관소장자료 : 왼쪽메뉴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="book.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="usermadang.board.model.FreeboardDAO"%>

<% 	 
	String sessionId = (String) session.getAttribute("sessionId");
	FreeboardDAO dao = FreeboardDAO.getInstance();
	String member_name = (String) session.getAttribute("sessionName");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"           content="DLIB">
<meta name="keyword"               content="국회전자도서관">
<meta name="copyright"             content="@copy; 2020 DLIB.ALL RIGHTS RESERVED.">
<meta name="viewport"              content="initial-scale=1, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection"      content="telephone=no">
<title>국회전자도서관</title>

<!-- 스타일 -->
<link rel="stylesheet" href="plugin/jquery/jquery.modal.min.css">
<link rel="stylesheet" href="plugin/jquery/jquery-ui.css">
<link rel="stylesheet" href="plugin/rangechart/Nwagon.css">
<link rel="stylesheet" href="style/ko/footable.bootstrap.css">
<link rel="stylesheet" href="style/ko/reset.css">
<link rel="stylesheet" href="style/ko/common.css">
<link rel="stylesheet" href="style/ko/slick.css">
<link rel="stylesheet" href="style/ko/slick-theme.css">
<link rel="stylesheet" href="style/ko/sub.css">
<link rel="stylesheet" href="style/ko/popup.css">
<link rel="stylesheet" href="style/ko/search/brief.css">
<link rel="stylesheet" href="style/ko/search/detail.css">
<link rel="stylesheet" href="style/ko/mylib/layout.css">

<!-- 스크립트 -->
<script src="/plugin/jquery/jquery-1.8.3.min.js"></script>
<script src="/plugin/jquery/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/plugin/jquery/jquery.i18n.js"></script>
<script src="/plugin/jquery/jquery.i18n.messagestore.js"></script>
<script src="/plugin/jquery/jquery.modal.min.js"></script>
<script src="/plugin/rangechart/Nwagon.js"></script>
<script src="/script/footable.js"></script>
<script src="/script/slick.js"></script>
<script src="/script/lib.js"></script>
<script src="/script/sub.js"></script>
<script src="/script/search/common.js"></script>
<script src="/script/search/facet.js"></script>
<script src="/script/search/brief.js"></script>
<script src="/script/search/detail.js"></script>
<script src="/script/search/autocomplete.js"></script>
<script src="/script/slider.js"></script>
<script src="/script/mobile.js"></script>

<script src="/script/class/AjaxUtil.class.js"></script>
<script src="/script/class/JSUtil.class.js"></script>
<script src="/script/class/Logger.class.js"></script>
<script src="/script/class/Map.class.js"></script>
<script src="/script/class/PopupUtil.class.js"></script>

<script src="/script/prototype/Array.prototype.js"></script>
<script src="/script/prototype/String.prototype.js"></script>
<script src="/script/popup.js"></script>
<script src="/script/title.js"></script>


<script type="text/javascript">
/* table 반응형처리 */
jQuery(function($) {
	
});

$(document).ready(function() {
/*     $.i18n().load( {
        'ko':'/i18n/ko.json'
    }).done(function() {
        console.log('load messages done.');
    }); */
    var uri = '/mylist/detail.do';
    titleSet(uri);
});

function searchCom()
{

	
	$("#searchBtn").attr("disabled", true);
	
	//alert(("#searchBtn").attr("disabled"));
}
</script>
<script>
	function pushSearch() {
		$("#mainsearch").attr("method", "post");
		$("#mainsearch").attr("action", "./main.nal").submit();
	}
</script>
</head>
<body onload="searchCom()">
<div id="wrap">
    <div id="skipNavi">
    	<!--
        <a href="#myLib" title="메뉴바로가기">메뉴바로가기</a>
        -->
        <a href="#wrapper" title="본문바로가기">본문바로가기</a>
    </div>
    <!-- start : header -->
    <header id="header" >
        















    
    
    
    
    
    


<div class="libChk">
	<h1><a href="./" onclick="getInSession()" title="국회전자도서관"><img src="/images/ko/logo.png" alt="국회전자도서관"></a></h1>
	<!-- <div class="busanLib">
		<p class="txt">국회도서관(부산관)</p>
		<a href="#" class="changeBtn">주 이용도서관 변경</a>
	</div> -->
</div>
<nav id="gnb" class="pcMenu">
    <h2 class="skip">탑메뉴</h2>
    <ul>
        
            
            	
                <c:choose>
				<c:when test="${not empty sessionScope.sessionId}">
                                <li class="new user"><b><%=member_name%></b>님 안녕하세요!</li> <!-- 로그인 시, 노출 -->
                                <li><a href="./logout.do">로그아웃</a></li>
                                <li><a href="/member/modyMember.do">마이페이지</a></li>
                                 <li class="myLibrary"><a href="./mylist.nal" title="My Library" id="myLib">My Library</a></li>
				</c:when>
				<c:otherwise>
					<li class="new"><a href="./selectMember.do" title="새창열기">처음 방문하셨나요?</a></li>
		        	<li><a href="./login.do">로그인</a></li>
				</c:otherwise>
			</c:choose>
    </ul>
</nav>

<nav class="mobileMenu">
    
















	
	
	
	
	
	
	
	
	
	
	<!-- 서울 본관, 부산관 분기처리, 20211122 KHJ -->
	
	
	
	

<script src="/script/qrcode.js"></script>
<h2 class="skip">메뉴</h2>
<a href="#" class="open" title="메뉴열기">메뉴열기<!-- img src="/images/ko/menuOpen.png" alt="메뉴열기" --></a>
<span class="menuBg"></span>
<div>
    <div class="wrap">
        <div class="menuTop">
            <div class="mobileMenu1">
                <a href="/m/main.do" class="home" title="홈"><img src="/images/ko/home.png" alt="Home"></a>
            </div>
            <div class="mobileMenu2">
				
	          		
	              		<span> </span>
	              		<a href="/logout.do" title="로그아웃">로그아웃</a>
					
					
				
            </div>
        </div>
        <ul>
            <li class="item1"><a href="#firstVisit" rel="modal:open" title="처음방문이세요?">처음방문이세요?</a></li>

            <!-- 주이용도서관설정 추가 서비스모드, 20211123 KHJ -->
            
            	<li class="item4"><a href="/mylist/usedLibList.do" title="주 이용도서관 설정">주 이용도서관 설정</a></li>
			



            <li style="color:blue;">내서재</li>
            
				

					<!-- 서비스모드 -->
					
						
							
								
								
									<li class="item5"><a href="/loan/loanBasketList.do?loanGubun=R" title="야간이용 신청목록">야간이용 신청목록</a></li>
									<li class="item6"><a href="/loan/loanList.do?loanGubun=R" title="야간이용  신청조회">야간이용  신청조회</a></li>
								
							
						
						
					

					
					
					<!-- 서비스모드 -->
					
						
							
								
								
								
							
						
						
					

				
				
				
				
			

			<!-- 모바일(상호이용신청 추가), 서비스모드 20211122 KHJ -->
			
				<li class="item5"><a href="/loan/loanBasketList.do?loanGubun=M" title="상호이용 신청목록">상호이용 신청목록</a></li>
				<li class="item6"><a href="/loan/loanList.do?loanGubun=M" title="상호이용  신청조회">상호이용  신청조회</a></li>
			

        </ul>
     
        
        <div class="membership">
	        
			<!-- 회원증발급안내 추가및 QR 조건추가 [usedLib가 서울 본관, 체크값이  null이 아니거나 0000(이용가능)인경우만 QR출력 ], 20211122 KHJ -->
			<!-- true 보류 -->

		
			
			
			
	        
	        <div class="wrap" style="margin-top: 14px;">
				<h3>모바일 열람증</h3>
	               <div class="img" id="qrcode"></div>
	               <div class="con">
	                   <h4></h4>
	                   <p class="id"></p>
	                   <p class="date">                    </p>
	               </div>
	               <p style="margin-bottom: 50px;">열람증을 이용하여 자료를 열람·대출할 수 있습니다. 열람증 확인이 필요한 경우 협조바랍니다.</p>
	       	</div>
	        	<!-- 회원증 발급안내  : 위 조건에 걸리지 않은 이용자 -->
	            <!-- <div class="noQr">
				   <p>국회부산도서관 회원증 발급이 필요한 서비스 입니다.</p>
				   <a href="#" title="회원증 발급안내">회원증 발급안내</a>
				</div> -->
	        
	     



         <script>
              var today = new Date();
				var year = today.getFullYear();		// 년도
				var month = today.getMonth() + 1;	// 월
				var date = today.getDate();			// 날짜
				if(month < 10){
					month = "0"+month;
				}
				if(date < 10){
					date = "0"+date;
				}
				var ymdStr = year+"-"+month+"-"+date;
				ymdStr = ymdStr.replaceAll("-", "");

				$(".membership .con .date").text(year+"-"+month+"-"+date);

          	var qrcode = new QRCode(document.getElementById("qrcode"),
          		{
						// text:"theand17|||terR520uz53hY7!5X9JdYzDqOE|||5645539",
						text:"theand17|||"+ymdStr+"|||5645539",
						/* width:256,
						height:256, */
						width:127,
						height:127,
						colorDarck:"#000000",
						colorLight:"#ffffff",
						correctLevel : QRCode.CorrectLevel.H
          		}
          	);
           </script>

        </div>
    </div>
        
        
     

    <a href="#" class="close" title="메뉴닫기"><img src="/images/ko/menuClose.png" alt="메뉴닫기"></a>
</div>

</nav>
<section id="search">
    <h2 class="skip">검색</h2>
    <div class="searchForm">
        <form method="post" id="searchForm" name="amainsearch" id = "amainsearch" action="" onsubmit="javascript:putSearchHistory();">
            <!-- start : hidden parameter value -->
            <input type="hidden" id="searchType"           name="searchType"           value="INNER_SEARCH">
            <input type="hidden" id="resultType"           name="resultType"           value="INNER_SEARCH_LIST">
            <input type="hidden" id="searchMehtod"         name="searchMehtod"         value="L">
            <input type="hidden" id="searchClass"          name="searchClass"          value="S">
            <input type="hidden" id="controlNo"            name="controlNo"            value="">
            <input type="hidden" id="queryText"            name="queryText"            value="">
            <input type="hidden" id="zone"                 name="zone"                 value="">
            <input type="hidden" id="fieldText"            name="fieldText"            value="">
            <input type="hidden" id="prevQueryText"        name="prevQueryText"        value="">
            <input type="hidden" id="prevPubYearFieldText" name="prevPubYearFieldText" value="">
            <input type="hidden" id="languageCode"         name="languageCode"         value="">
            <input type="hidden" id="synonymYn"            name="synonymYn"            value="">
            <input type="hidden" id="refineSearchYn"       name="refineSearchYn"       value="">
            <input type="hidden" id="pageNum"              name="pageNum"              value="">
            <input type="hidden" id="pageSize"             name="pageSize"             value="">
            <input type="hidden" id="orderBy"              name="orderBy"              value="">
            <input type="hidden" id="topMainMenuCode"      name="topMainMenuCode"      value="">
            <input type="hidden" id="topSubMenuCode"       name="topSubMenuCode"       value="">
            <input type="hidden" id="totalSize"            name="totalSize"            value="">
            <input type="hidden" id="totalSizeByMenu"      name="totalSizeByMenu"      value="">
            <input type="hidden" id="seqNo"                name="seqNo"                value="">
            <input type="hidden" id="hanjaYn"              name="hanjaYn"              value="">
            <input type="hidden" id="knowPub"              name="knowPub"              value="" >

            <input type="hidden" id="isdb"                 name="isdb"                 value="">
            <input type="hidden" id="isdbsvc"              name="isdbsvc"              value="">
            <input type="hidden" id="tt1"                  name="tt1"                  value="">
            <input type="hidden" id="down"                 name="down"                 value="">

            <!-- 외부기관 전용 -->
            <input type="hidden" id="checkedDbIdList"        name="checkedDbIdList"       value="">
            <input type="hidden" id="baseDbId"               name="baseDbId"              value="">
            <input type="hidden" id="selectedDbIndexIdList"  name="selectedDbIndexIdList" value="">
            <input type="hidden" id="caller"                 name="caller"                value="">
            <!-- end   : hidden parameter value -->

			<!-- 오른쪽 Quick메뉴 -->
			<input type="hidden" id="asideState"             name="asideState"            value="">

			<!-- 소장도서관 체크값 -->
			<input type="hidden" id="dpBranch"         		 name="dpBranch"              value="">
			<!-- 학술지종류 선택값 -->
			<input type="hidden" id="journalKind"  	  		 name="journalKind"      	  value="">


            <fieldset>
                <legend class="skip">검색</legend>
                <div class="selectW">
                    
                        
                        
                            <div class="select selectBoxW">
                                <a href="#none" id="selZoneLabel" title="기본검색">기본검색</a>
                                <!-- selectbox display:none -->
                                <select id="selZone" name="selZone" title="검색분류 선택">
                                    <option value="ALL_NI_TOC">기본검색</option>
	                                <option value="ALL">전체(초록·목차·본문포함)</option>
	                                <option value="(^TITLE^TITLE_BI^)^TITLE_WS">자료명</option>
	                                <!--
	                                <option value="TITLE_SORT_WS">자료명(완전일치)</option>
	                                -->
	                                <option value="AUTHOR_WS^DP_AUTHOR_WS">저자</option>
	                                <option value="PUB_WS^DP_PUB_WS">발행자</option>
	                                <option value="(^SUBJECT^SUBJECT_BI^)^SUBJECT_WS">키워드</option>
	                                <option value="CALL_NO">청구기호</option>
                                </select>
                                <!-- selectbox display:none-->
                            </div>
                            <div class="srchSelectBox">
                                <div class="optList">
                                    <ul>
                                        <li><a href="#" title="기본검색">기본검색</a></li>
                                        <li><a href="#" title="전체(초록·목차·본문포함)">전체(초록·목차·본문포함)</a></li>
                                        <li><a href="#" title="자료명">자료명</a></li>
                                        <!--
                                        <li><a href="#" title="자료명(완전일치)">자료명(완전일치)</a></li>
                                        -->
                                        <li><a href="#" title="저자">저자</a></li>
                                        <li><a href="#" title="발행자">발행자</a></li>
                                        <li><a href="#" title="키워드">키워드</a></li>
                                        <li><a href="#" title="청구기호">청구기호</a></li>
                                    </ul>
                                </div>
                            </div>
                        
                    
                </div>
                <!-- start : 다국어 page -->
                <div class="keyboard" id="keyboard">
                    





<script src="/script/search/multiLang.js"></script>

<h3>다국어입력</h3>
<ol>
    <li>
        <input type="radio" name="keyboard" id="keyboard1" />
        <label for="keyboard1">언어</label>
        <div class="wrap">
            <div class="list">
                <ul>
                    <li class="on">
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode3');" title="한글고어">한글고어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode24');" title="중국간체">중국간체</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode25');" title="중국번체">중국번체</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode1');" title="히라가나">히라가나</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode2');" title="가타카나">가타카나</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode8');" title="프랑스어">프랑스어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode9');" title="스페인어">스페인어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode10');" title="독일어">독일어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode6');" title="러시아문자">러시아문자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode4');" title="그리스어">그리스어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode5');" title="라틴문자">라틴문자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode26');" title="라틴확장-A">라틴확장-A</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode27');" title="라틴확장-B">라틴확장-B</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode7');" title="로마자">로마자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode11');" title="아르메니아어">아르메니아어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode12');" title="티아나어">티아나어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode45');" title="인도어">인도어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode28');" title="아랍어">아랍어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode29');" title="베트남">베트남</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode30');" title="신할라어">신할라어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode31');" title="크메르어">크메르어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode32');" title="타이어">타이어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode33');" title="라오어">라오어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode34');" title="티베트어">티베트어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode35');" title="몽골어">몽골어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode36');" title="노르웨이어">노르웨이어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode37');" title="체코어">체코어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode38');" title="폴란드어">폴란드어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode39');" title="터키어">터키어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode40');" title="포르투칼어">포르투칼어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode41');" title="키릴문자">키릴문자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode42');" title="히브리어">히브리어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode43');" title="벵골어">벵골어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode44');" title="이란어">이란어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </li>
    <li>
        <input type="radio" name="keyboard" id="keyboard2" />
        <label for="keyboard2">기호</label>
        <div class="wrap">
            <div class="list">
                <ul>
                    <li class="on">
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode13');" title="괄호기호">괄호기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode14');" title="학술기호">학술기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode15');" title="기술기호">기술기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode16');" title="단위기호">단위기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode17');" title="일반기호">일반기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode18');" title="첨자">첨자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode19');" title="일반 구두점">일반 구두점</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode20');" title="화폐 기호">화폐 기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode21');" title="글자꼴 기호">글자꼴 기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode22');" title="여러 가지 수">여러 가지 수</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode23');" title="도형 기호">도형 기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode46');" title="수학연산자">수학연산자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode47');" title="수학연산자보충">수학연산자보충</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </li>
</ol>
<div class="close">
    <a href="#none" title="닫기">닫기</a>
</div>

                </div>
                <!-- end : 다국어 page -->
                <form method="get" name="mainsearch" id="mainsearch" data-ajax="false">
                <input type="text" class="inputText" id=mainkey name="mainkey" onkeydown="javascript:if(event.keyCode == 13) pushSearch();" title="검색 입력창"
                value="" autocomplete="off" placeholder="검색어를 입력해주세요">
                <div class="autoComplete">
                    <!--  ajax 데이터 처리 영역 -->
                </div>
                <input type="button" value="다국어입력" title="다국어입력" class="searchKeyboard" />
                <input type="submit" id="searchBtn" class="searchBtn" onclick="pushSearch();" title="검색" value="검색" disabled=disabled />
                <a class="searchBottom" onclick="pushSearch();" href="#none"><img src="resource/images/btn_search_white.png" alt="검색"></a>
</form>
            </fieldset>
        </form>
        
            
            
                <a href="#detailSearch" rel="modal:open" class="searchBtn2" title="상세 검색">상세<br>검색</a>
                
                	<a href="javascript:searchOuterList();" class="searchBtn3" title="외부기관 검색">외부기관<br>검색</a>
                
            
        
    </div>
    
    
</section>

<!-- start : 상세검색 팝업 -->






<div id="detailSearch" class="modal">
    <div class="wrap">
        <div class="top">
            <h2>상세검색</h2>
            <div class="right">
                <ul>
                    <li>
                        <input type="button" title="다국어입력" value="다국어입력" class="language searchKeyboard" />
                        <div class="keyboard" id="detailKeyboard">
                            





<script src="/script/search/multiLang.js"></script>

<h3>다국어입력</h3>
<ol>
    <li>
        <input type="radio" name="keyboard" id="keyboard1" />
        <label for="keyboard1">언어</label>
        <div class="wrap">
            <div class="list">
                <ul>
                    <li class="on">
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode3');" title="한글고어">한글고어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode24');" title="중국간체">중국간체</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode25');" title="중국번체">중국번체</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode1');" title="히라가나">히라가나</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode2');" title="가타카나">가타카나</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode8');" title="프랑스어">프랑스어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode9');" title="스페인어">스페인어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode10');" title="독일어">독일어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode6');" title="러시아문자">러시아문자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode4');" title="그리스어">그리스어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode5');" title="라틴문자">라틴문자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode26');" title="라틴확장-A">라틴확장-A</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode27');" title="라틴확장-B">라틴확장-B</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode7');" title="로마자">로마자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode11');" title="아르메니아어">아르메니아어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode12');" title="티아나어">티아나어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode45');" title="인도어">인도어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode28');" title="아랍어">아랍어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode29');" title="베트남">베트남</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode30');" title="신할라어">신할라어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode31');" title="크메르어">크메르어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode32');" title="타이어">타이어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode33');" title="라오어">라오어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode34');" title="티베트어">티베트어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode35');" title="몽골어">몽골어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode36');" title="노르웨이어">노르웨이어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode37');" title="체코어">체코어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode38');" title="폴란드어">폴란드어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode39');" title="터키어">터키어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode40');" title="포르투칼어">포르투칼어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode41');" title="키릴문자">키릴문자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode42');" title="히브리어">히브리어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode43');" title="벵골어">벵골어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode44');" title="이란어">이란어</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </li>
    <li>
        <input type="radio" name="keyboard" id="keyboard2" />
        <label for="keyboard2">기호</label>
        <div class="wrap">
            <div class="list">
                <ul>
                    <li class="on">
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode13');" title="괄호기호">괄호기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode14');" title="학술기호">학술기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode15');" title="기술기호">기술기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode16');" title="단위기호">단위기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode17');" title="일반기호">일반기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode18');" title="첨자">첨자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode19');" title="일반 구두점">일반 구두점</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode20');" title="화폐 기호">화폐 기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode21');" title="글자꼴 기호">글자꼴 기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode22');" title="여러 가지 수">여러 가지 수</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode23');" title="도형 기호">도형 기호</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode46');" title="수학연산자">수학연산자</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                    <li>
                        <a href="#none" onclick="changeMultiLang(this, 'marrCode47');" title="수학연산자보충">수학연산자보충</a>
                        <div class="content">
                            <div class="box"></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </li>
</ol>
<div class="close">
    <a href="#none" title="닫기">닫기</a>
</div>

                        </div>
                    </li>
                    <!--
                    <li>
                        <a href="#none" class="help" title="도움말">도움말</a>
                    </li>
                    -->
                    
                    	
                    	
                    		<li><a href="#none" class="help" onclick="openPopupNoResizing('/upload/guide/dlib_manual.pdf','searchGuide','760','740','no');return false;" title="도움말 새창열림">도움말</a></li>
                    	
                    
                </ul>
            </div>
        </div>
        <div class="bottom">
            <form id="criteriaForm" name="criteriaForm" action="">
                <fieldset>
                    <legend class="skip">상세검색</legend>
                    <div class="section first">
                        <h3><label for="ALL">자료구분</label></h3>
                        <div>
                            
                                <ol>
                                    
                                    
                                        
                                        
                                            
                                            
                                                <li>
                                                    <input type="radio" id="ALL" name="mainDbDivCode" value="ALL" />
                                                    <label for="ALL">전체</label>
                                                </li>
                                            
                                        
                                    
                                        
                                        
                                            
                                                <li>
                                                    <input type="radio" id="MONO_ALL" name="mainDbDivCode" value="MONO_ALL"/>
                                                    <label for="MONO_ALL">도서자료</label>
                                                    <div class="secondDepth">
                                                        <h4>도서자료</h4>
                                                        <div>
                                                            <ol>
                                                                <li>
                                                                    <input type="radio" id="SUB_MONO_ALL" name="subDbDivCode" value="MONO_ALL"/>
                                                                    <label for="SUB_MONO_ALL">전체</label>
                                                                </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="MONO" name="subDbDivCode" value="MONO" />
                                                                        <label for="MONO">일반도서</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="EBOK" name="subDbDivCode" value="EBOK" />
                                                                        <label for="EBOK">E-BOOK</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="OLDP" name="subDbDivCode" value="OLDP" />
                                                                        <label for="OLDP">고서</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="PAMP" name="subDbDivCode" value="PAMP" />
                                                                        <label for="PAMP">세미나자료</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="WNET" name="subDbDivCode" value="WNET" />
                                                                        <label for="WNET">웹자료</label>
                                                                    </li>
                                                                
                                                            </ol>
                                                            
                                                            
			                                                

                                                        </div>
                                                    </div>
                                                </li>
                                            
                                            
                                        
                                    
                                        
                                        
                                            
                                                <li>
                                                    <input type="radio" id="KDMT_ALL" name="mainDbDivCode" value="KDMT_ALL"/>
                                                    <label for="KDMT_ALL">학위논문</label>
                                                    <div class="secondDepth">
                                                        <h4>학위논문</h4>
                                                        <div>
                                                            <ol>
                                                                <li>
                                                                    <input type="radio" id="SUB_KDMT_ALL" name="subDbDivCode" value="KDMT_ALL"/>
                                                                    <label for="SUB_KDMT_ALL">전체</label>
                                                                </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="KDMT" name="subDbDivCode" value="KDMT" />
                                                                        <label for="KDMT">학위논문</label>
                                                                    </li>
                                                                
                                                            </ol>
                                                            
                                                                <input type="button" class="btnList" style="height: 28px; display: none;" id="btnDegree"  onclick="openViewAltDegree();" title="대체학위" value="대체학위" />
                                                            
                                                            
			                                                

                                                        </div>
                                                    </div>
                                                </li>
                                            
                                            
                                        
                                    
                                        
                                        
                                            
                                                <li>
                                                    <input type="radio" id="KINX_ALL" name="mainDbDivCode" value="KINX_ALL"/>
                                                    <label for="KINX_ALL">연속간행물&middot;학술기사</label>
                                                    <div class="secondDepth">
                                                        <h4>연속간행물&middot;학술기사</h4>
                                                        <div>
                                                            <ol>
                                                                <li>
                                                                    <input type="radio" id="SUB_KINX_ALL" name="subDbDivCode" value="KINX_ALL"/>
                                                                    <label for="SUB_KINX_ALL">전체</label>
                                                                </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="KINX" name="subDbDivCode" value="KINX" />
                                                                        <label for="KINX">국내기사</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="FINX" name="subDbDivCode" value="FINX" />
                                                                        <label for="FINX">국외기사</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="SERL" name="subDbDivCode" value="SERL" />
                                                                        <label for="SERL">학술지·잡지</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="NEWS" name="subDbDivCode" value="NEWS" />
                                                                        <label for="NEWS">신문</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="WEDB" name="subDbDivCode" value="WEDB" />
                                                                        <label for="WEDB">전자저널</label>
                                                                    </li>
                                                                
                                                            </ol>
                                                            
                                                            
                                                                <input type="button" class="btnList" style="height: 28px; display: none;" id="btnSeries"  onclick="openViewSerials();" title="국회도서관 연속간행물리스트" value="국회도서관 연속간행물리스트"/>
			                                                
			                                                

                                                        </div>
                                                    </div>
                                                </li>
                                            
                                            
                                        
                                    
                                        
                                        
                                            
                                                <li>
                                                    <input type="radio" id="NONB_ALL" name="mainDbDivCode" value="NONB_ALL"/>
                                                    <label for="NONB_ALL">멀티미디어</label>
                                                    <div class="secondDepth">
                                                        <h4>멀티미디어</h4>
                                                        <div>
                                                            <ol>
                                                                <li>
                                                                    <input type="radio" id="SUB_NONB_ALL" name="subDbDivCode" value="NONB_ALL"/>
                                                                    <label for="SUB_NONB_ALL">전체</label>
                                                                </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="VDBK" name="subDbDivCode" value="VDBK" />
                                                                        <label for="VDBK">동영상자료</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="ADBK" name="subDbDivCode" value="ADBK" />
                                                                        <label for="ADBK">오디오자료</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="CDBK" name="subDbDivCode" value="CDBK" />
                                                                        <label for="CDBK">전자매체</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="MIFO" name="subDbDivCode" value="MIFO" />
                                                                        <label for="MIFO">마이크로폼자료</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="MAPI" name="subDbDivCode" value="MAPI" />
                                                                        <label for="MAPI">지도/기타자료</label>
                                                                    </li>
                                                                
                                                            </ol>
                                                            
                                                            
			                                                
                                                                <input type="button" class="btnList" style="height: 28px; display: none;" id="btnVideoDataList"  onclick="openViewVideoDataList();" title="영상자료목록" value="영상자료목록" />
			                                                

                                                        </div>
                                                    </div>
                                                </li>
                                            
                                            
                                        
                                    
                                        
                                        
                                            
                                                <li>
                                                    <input type="radio" id="ASSM_ALL" name="mainDbDivCode" value="ASSM_ALL"/>
                                                    <label for="ASSM_ALL">국회자료</label>
                                                    <div class="secondDepth">
                                                        <h4>국회자료</h4>
                                                        <div>
                                                            <ol>
                                                                <li>
                                                                    <input type="radio" id="SUB_ASSM_ALL" name="subDbDivCode" value="ASSM_ALL"/>
                                                                    <label for="SUB_ASSM_ALL">전체</label>
                                                                </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="TLAW" name="subDbDivCode" value="TLAW" />
                                                                        <label for="TLAW">외국법률번역DB</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="PROC" name="subDbDivCode" value="PROC" />
                                                                        <label for="PROC">국회회의록</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="NABI" name="subDbDivCode" value="NABI" />
                                                                        <label for="NABI">국회의안정보</label>
                                                                    </li>
                                                                
                                                            </ol>
                                                            
                                                            
			                                                

                                                        </div>
                                                    </div>
                                                </li>
                                            
                                            
                                        
                                    
                                        
                                        
                                            
                                                <li>
                                                    <input type="radio" id="SPEC_ALL" name="mainDbDivCode" value="SPEC_ALL"/>
                                                    <label for="SPEC_ALL">특화자료</label>
                                                    <div class="secondDepth">
                                                        <h4>특화자료</h4>
                                                        <div>
                                                            <ol>
                                                                <li>
                                                                    <input type="radio" id="SUB_SPEC_ALL" name="subDbDivCode" value="SPEC_ALL"/>
                                                                    <label for="SUB_SPEC_ALL">전체</label>
                                                                </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="REFD" name="subDbDivCode" value="REFD" />
                                                                        <label for="REFD">표·그림DB</label>
                                                                    </li>
                                                                
                                                                    <li>
                                                                        <input type="radio" id="KSDB" name="subDbDivCode" value="KSDB" />
                                                                        <label for="KSDB">지식공유</label>
                                                                    </li>
                                                                
                                                            </ol>
                                                            
                                                            
			                                                

                                                        </div>
                                                    </div>
                                                </li>
                                            
                                            
                                        
                                    
                                </ol>
                            
                        </div>
                    </div>
                    <div class="section" id="keywordField">
                        <!--  ajax 호출 후, 데이터 로드 -->
                    </div>
                    <ul class="section" id="limitField">
                        <!--  ajax 호출 후, 데이터 로드 -->
                    </ul>
                    <div class="btnWrap">
                        <input type="button" title="검색하기" value="검색하기" class="search" onclick="searchListByCriteria();"/>
                        <input type="button" title="초기화" value="초기화"  class="reset"  onclick="resetForm();"/>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>
<!-- end   : 상세검색 팝업 -->

<!-- start : 처음방문이세요 레이어 팝업 -->






<!-- 레이어팝업 : 처음방문이세요? -->
<div id="firstVisit" class="modal">
    <div class="wrap">
        <div class="contentBox">
            <div class="tit">
                <h2><img src="/images/ko/fvTxtImg.png" alt="국회전자도서관에 처음 방문이세요?" /></h2>
                <p>국회도서관 서비스 이용에 대한 안내를 해드립니다.</p>
            </div>
            <div class="con">
                <ul class="infoList">
                    <li><a href="http://www.nanet.go.kr/usermadang/etc/openApiView.do"                                         target="_blank" title="Open API 이용안내"><span>Open API 이용안내</span></a></li>
                    <li><a href="http://www.nanet.go.kr/comnet/knowshare/knowShareView.do"                                     target="_blank" title="저작물등록 및 이용허락"><span>저작물등록 및 이용허락</span></a></li>
                    <li><a href="http://nanet.go.kr/libaryuseinfo/faqServiceList.do?isdl=Y&searchTabNo=07&searchGubunCode=07"  target="_blank" title="저작물 이용료에 대한 안내"><span>저작물 이용료에 대한 안내</span></a></li>
                    <li><a href="http://www.nanet.go.kr/libaryuseinfo/mobileServiceView.do"                                    target="_blank" title="모바일서비스 이용안내"><span>모바일서비스 이용안내</span></a></li>
                    <li><a href="#none" onclick="openPopupNoResizing('/upload/guide/dlib_manual.pdf','searchGuide','760','740','no');return false;" title="통합검색 이용안내 새창열림"><span>통합검색 이용안내</span></a></li>
                    <li><a href="http://www.nanet.go.kr/datasearch/finalbook/selectFinalBookList.do"                           target="_blank" title="신간단행본 안내"><span>신간단행본 안내</span></a></li>
                    <li><a href="http://www.nanet.go.kr/usermadang/etc/nightUseReqView.do"                                     target="_blank" title="야간이용 신청안내"><span>야간이용 신청안내</span></a></li>
                    <li><a href="/html/local.do?htmlName=contact"                                                   		   target="_blank" title="전화번호 안내"><span>전화번호 안내</span></a></li>
                </ul>
            </div>
        </div>
        <a href="#close-modal" rel="modal:close" class="close" title="닫기">닫기</a>
    </div>
</div>


<!-- end   : 처음방문이세요 레이어 팝업 -->

    </header>
    <!-- end   : header -->
    <div id="container">
        <!-- start : contents  -->





<script	src="/script/search/inner2.js"></script>
<script	src="/js/loan/loan.js"></script>
<style>
.btn.del2 { background-color: #444; }
</style>
<script>

$(document).ready(function(){
	document.title = "국회전자도서관 내서재 상세보기";
	//내보내기
	$('#exportPop .save').click(function(){
		var chkRadio = $('input[name="exportForm"]:checked').val();
		var frm	= document.searchExportForm;
		var action = frm.action;
		if(chkRadio == "html"){
			$('input[name="contentHtml"]').val(getHtmlDiv());
			frm.action = "/result/search/createHtml.do";
			frm.submit();
			frm.action = action;
			$.modal.close();
		} else if(chkRadio == "email") {
			var email = $('input[name="email"]', frm).val();
			if(email == ""){
				alert("이메일은 필수 항목 입니다.");
				return false;
			}
			$('input[name="contentHtml"]').val(getHtmlDiv());
			frm.action = "/result/search/getMailBody.do";
			frm.submit();
			$.modal.close();
		} else if(chkRadio == "print") {
			$('input[name="contentHtml"]').val(getHtmlDiv());
		} else if(chkRadio == "view") {
			$('input[name="contentHtml"]').val(getHtmlDiv());
		} else if(chkRadio == "endNote") {
			return false;
		} else if(chkRadio == "riss") {
			$('input[name="cnArr"]').val(getCnDiv());
			frm.action = "/result/search/rissSave.do";
			frm.submit();
			frm.action = action;
			$.modal.close();
		} else if(chkRadio == "excel") {
			$('input[name="cnArr"]').val(getCnDiv());
			frm.action = "/result/search/excelSave.do";
			frm.submit();
			frm.action = action;
			$.modal.close();
		} else {
			alert("error");
			return false;
		}

		$('input[name="handlerType"]').val(chkRadio);

		if(chkRadio != 'html' && chkRadio != 'email' &&	chkRadio != 'excel' && chkRadio	!= 'riss'){
			var rWin = window.open("about:blank", "export");
			frm.target="export";
			frm.submit();
		}
		$.modal.close();
	});
});

function fn_export() {
	if($("input:checkbox[name=checkbox]:checked").length < 1){
		alert("선택한 항목이 없습니다");
		return false;
	}

	$("#ef1").click();

	$("#exportPop").modal();
}

function getCnDiv(){

	var cnArr = "";
	var cnLength = $("input:checkbox[name=checkbox]:checked").length;
	$("input:checkbox[name=checkbox]:checked").each(function(i) {

		var cn = this.value.split("-@@-")[1];
		cnArr += cn;
		if(cnLength - 1	> i) { cnArr +=	","; }
	});
	//console.log(cnArr);
	return cnArr;
}

function getHtmlDiv(){

	var reform = "<div class=\"tWrap\"><table class=\"tStyle3\">";
	reform+="<colgroup>			  ";

	reform+="	<col width=\"3%\">	   ";
	reform+="	<col width=\"5%\">	   ";
	reform+="	<col width=\"10%\">	  ";
	reform+="	<col >			      ";
	reform+="	<col width=\"20%\">	  ";
	reform+="	<col width=\"10%\">	  ";
	reform+="</colgroup>			  ";


	$("input:checkbox[name=checkbox]:checked").each(function(i) {
		if(i==0) {
			reform+="<thead>"
		}

		var parent = $(this).closest('tr').clone();

		//$(parent).find('.infoBtn2').remove();
		//$(parent).find('.infoBtn1').remove();
		//$(parent).find('a').attr("href", "#");

		reform += "<tr >"+$(parent).html()+"</tr>";
		if(i==0) {
			reform+="</thead>"
		}
	});
	reform+="</table></div>";
	return reform;
}

function changePage(){
	location.href = "/mylist/detail.do?listNo=2914475&pageNum=1&pageSize="+$("#selPageSize option:checked").val();
}

function searchInnerDetails(controlNo) {
    // 변경 할 사항을 hidden에 저장
    $("#searchType").val("INNER_SEARCH");
    $("#resultType").val("INNER_SEARCH_DETAIL");
    $("#controlNo").val(controlNo);
    $("#searchQuery").val(controlNo);
    $("#searchMehtod").val("P");
    $("#asideState").val("false");
    $("#hanjaYn").val("Y");

    $("#totalSize").val("1");
    $("#totalSizeByMenu").val("1");

    var form = $("#searchForm");
    var formData = $("#searchForm").serialize();
    form.attr("action", "/search/searchInnerDetail.do?"+formData);
    form.submit();
}

</script>



	
	
	
	

<script	type="text/javascript">
	var userId = "theand17";
</script>

<section class="inner">
	<!-- leftMenu -->
		
















	
	
	
	
	



<div class="menu">
	<h2>My Library</h2>
	<div class="wrap">
		<ul>
		<!-- 서비스모드 -->

			
			<li ><a href="/mylist/usedLibList.do" title="주 이용도서관 설정">주 이용도서관 설정</a></li>
			



			<li ><a href="/mylist/list.do" title="내서재">내서재</a></li>
			
				

		<!-- 서비스모드 -->
		
		
			
			
			
				
				
					<li ><a href="/loan/loanBasketList.do?loanGubun=R" title="야간이용 신청목록">야간이용 신청목록</a></li>
					<li ><a href="/loan/loanList.do?loanGubun=R" title="야간이용 신청조회">야간이용 신청조회</a></li>
				
			
		
		
		
				


				
				
				
			

			<!-- 상호이용 서비스모드, 20210830 KHJ -->
			
				<li ><a href="/loan/loanBasketList.do?loanGubun=M" title="상호이용 신청목록">상호이용 신청목록</a></li>
				<li ><a href="/loan/loanList.do?loanGubun=M" title="상호이용 신청조회">상호이용 신청조회</a></li>
			


			
				
					
						
					
					
				

			
			
			<li ><a href="/loan/postCopyList.do" title="우편복사 신청목록">우편복사 신청목록</a></li>
		</ul>
	</div>
</div>


	<!-- start : 내보내기-->
	

<div id="exportPop" class="modal exportPop"> <!-- 내보내기 형식이 E-mail 일 때 class email 추가 / 내보내기 형식이 EndNote, RefWorks, MARC 일 때 class info 추가 -->
	<div class="wrap">
		<div class="top">
			<h2>내보내기</h2>
		</div>
		<div class="bottom">
			<form action="/result/search/output.do" name="searchExportForm" id="searchExportForm" method="post">
				<input type="hidden" name="contentHtml">
				<input type="hidden" name="handlerType">
				<input type="hidden" name="cnArr">
				<input type="hidden" name="query" value="">
				<fieldset>
					<legend class="skip">내보내기</legend>
					<div class="form mb30">
						<p class="mb20">내보내기 형식을 선택하세요.</p>
						<ul class="fStyle1">
							<li class="html">
								<input type="radio" name="exportForm" id="ef1" title="HTML" value="html" tabindex="-1"/>
								<label for="ef1" tabindex="0">HTML</label>
							</li>
							<li class="eMail">
								<input type="radio" name="exportForm" id="ef2" title="E-Mail" value="email" tabindex="-1"/>
								<label for="ef2" tabindex="0">E-Mail</label>
							</li>
							<li class="print2">
								<input type="radio" name="exportForm" id="ef3" title="인쇄" value="print" tabindex="-1"/>
								<label for="ef3" tabindex="0">인쇄</label>
							</li>
							<li class="preview">
								<input type="radio" name="exportForm" id="ef4" title="미리보기" value="view" tabindex="-1"/>
								<label for="ef4" tabindex="0">미리보기</label>
							</li>
							<li class="excel">
								<input type="radio" name="exportForm" id="ef7" title="Excel" value="excel" tabindex="-1"/>
								<label for="ef7" tabindex="0">Excel</label>
							</li>
							<li class="riss">
								<input type="radio" name="exportForm" id="ef6" title="RIS" value="riss" tabindex="-1"/>
								<label for="ef6" tabindex="0">RIS</label>
							</li>
							<!-- <li class="endNote">
								<input type="radio" name="exportForm" id="ef5" value="endNote"/>
								<label for="ef5">EndNote</label>
							</li>
							<li class="refWorks">
								<input type="radio" name="exportForm" id="ef6" value="reWorks"/>
								<label for="ef6">ReWorks</label>
							</li>
							-->
						</ul>
					</div>

					<div class="scope mb30">
						<!-- <p class="mb20">내보내기 범위를 선택하세요.</p>
						<ul class="fStyle1">
							<li>
								<input type="checkbox" name="exportScope" id="es1" />
								<label for="es1">간략정보</label>
							</li>
							<li>
								<input type="checkbox" name="exportScope" id="es2" />
								<label for="es2">상세정보</label>
							</li>
							<li>
								<input type="checkbox" name="exportScope" id="es3" />
								<label for="es3">도서정보</label>
							</li>
							<li>
								<input type="checkbox" name="exportScope" id="es4" />
								<label for="es4">초록</label>
							</li>
							<li>
								<input type="checkbox" name="exportScope" id="es5" />
								<label for="es5">목차</label>
							</li>
						</ul> -->
					</div>

					<!-- 내보내기 형식이 E-mail 일 때 -->
					<div class="inputWrap mb30">
						<div class="mb10">
							<label for="email">이메일</label>
							<input type="email" id="email" name="email" title="이메일 입력칸" class="inputText"/>
						</div>
						<div>
							<label for="title">제목</label>
							<input type="text" id="title" name="title" title="제목 입력칸" class="inputText title_init"/>
						</div>
					</div>

					<!-- 내보내기 형식이 EndNote / RefWorks / MARC 일 때 -->
					<p class="txt dash mb30"><span>EndNote</span>에서 이용 가능한 형식으로 반출합니다.</p>

					<div class="btnWrap tc">
						<a href="#myLibExportFin" class="btnD btn3 save" title="확인">확인</a>
						<a href="#close-modal" rel="modal:close" class="btnD btn4" title="취소">취소</a>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>

	<!-- end   : 내보내기-->
	<!-- start : 목차보기 팝업 -->
    





<!-- 레이어팝업 : 목차보기 -->
<div id="volumeToc" class="modal">
    <div class="wrap">
        <div class="top">
            <h2>목차보기</h2>
        </div>
        <div class="bottom">
			<div class="tableWrap">
				<p id="VOLUME_TOC_TBODY"></p>
				<!-- ajax setting -->
			</div>

			<div class="btnWrap tc">
				<a href="#none" onclick="javascript:printVolumeToc(this);" class="btnD btn3" title="인쇄">인쇄</a>
				<a href="#close-modal" rel="modal:close" class="btnD btn4" title="닫기">닫기</a>
			</div>
        </div>
    </div>
</div>
    <!-- end   : 목차보기 팝업 -->

	<!-- leftMenu -->
	<div id="wrapper" class="wrapper">
		<div class="location">
			<ul>
				<li class="home">Home</li>
				<li>My Library</li>
				<li>내서재</li>
			</ul>
		</div> <!-- location -->
		<div id="tab">
			<ul class="tab">
				<li class="item	on">
					<h3>
						<a href="#tab1"	title="내서재">내서재</a>
					</h3>
					<div id="tab1" class="content">
						<div>

<form id="searchForm" name="searchForm" method="post" action="" >
	<input type="hidden" id="searchType"     	 name="searchType"          value="">
    <input type="hidden" id="resultType"    	 name="resultType"          value="">
    <input type="hidden" id="controlNo"      	 name="controlNo"     		value="">
    <input type="hidden" id="searchQuery"        name="searchQuery"         value="">
    <input type="hidden" id="searchMehtod"       name="searchMehtod"        value="">
    <input type="hidden" id="asideState"     	 name="asideState"    		value="">
    <input type="hidden" id="hanjaYn"        	 name="hanjaYn"       		value="">
    <input type="hidden" id="totalSize"          name="totalSize"           value="">
    <input type="hidden" id="totalSizeByMenu"    name="totalSizeByMenu"     value="">
</form>

							

							
							<form id="frm" name="frm" method="post"	action="/mylist/handler">
								<div class="listTable2"	id="printContent">
									<input type="hidden" name="listNo" value="2914475">
									<fieldset>
										<legend	class="skip">내서재 등록 자료 목록입니다.</legend>
										<table class="tStyle2">
										
											<colgroup>
												<col width="3%">
												<col width="45%">
			
												<col >
			
											</colgroup>
											<caption class="skip">내서재 등록 자료	테이블로 순번, 선택, 자료구분, 서명, 등록일등으로 구성되어 있습니다.</caption>
											<thead>
												<tr>
													<th scope="col">
														<label><input type="checkbox" title="전체선택" name="checkbox" id="chkAll" /></label>
													</th>
													<th scope="col">목록</th>
								
												</tr>
											</thead>
											<tbody>
		
			
		<c:choose>
			<c:when test="${mylist==null}">
				<tr>
					<td></td>
					<td>내 서재에 저장된 책이 없습니다.</td>					
				</tr>
			</c:when>
			
			<c:when test="${mylist != null}">
				
				<c:forEach var="list" items="${mylist}">
					<tr>
						<td><label><input type="checkbox" title="선택" name="checkbox" class="chk" id="chk1"	/></label></td>	
						<td class="tl">
							${list.book_title} / ${list.author} / ${list.publishing} / ${list.book_sorting} 
						</td>
					</tr>
				</c:forEach>
				</ul>		
			</c:when>		
		</c:choose>
												
													
													
												
												
											
											</tbody>
										</table>
									</fieldset>
								</div>
								<div class="paging">
									<div class="f-L">
										<!-- start : 페이징 -->
										
										<!-- end : 페이징	-->
									</div>
										<div class="f-R	buttons	btnWrap">
									
											
											<div class="selectD selectBox1" style="height:42px;">
												<div class="select selectBoxD">
													<a href="#none" title="선택항목 이동" style="padding-top:2px;">선택항목 이동</a>
													<!--selectbox display:none-->
													<select	name="cboList" id="cboList" title="선택항목 이동 선택">
														<option	value="0">선택항목 이동</option>
														
															
														
													</select>
													<!--//selectbox	display:none-->
												</div>
												<div class="selectBox">
													<div class="optList">
														<ul>
															
																
															
														</ul>
													</div>
												</div>
											</div>
											<br class="mview_400"/>
											<!-- onclick="actionChange('moveitem');" -->
											<a href="#" class="btn move" title="이동">이동</a>
											
											<input type="button" title="삭제" value="삭제"	class="btn del"/>
											
												
<!-- 													<a href="#"	class="btn " title="열람예약신청목록담기"	onclick="javascript:loanBasketInsert_list('B');">열람예약신청목록담기</a> -->
													
														
														
															<!-- <a href="#" class="btn" onclick="javascript:alert('코로나19로 인하여 야간 개관은 실시하지 않습니다');" title="야간이용신청목록담기">야간이용신청목록담기</a> -->
															<a href="#"	class="btn " title="야간이용신청목록담기"	onclick="javascript:loanBasketInsert_list('R');">야간이용신청목록담기(서울 본관)</a>
														
													
												
												
												
												
											
										
										
										
											
										
										</div>
								</div> <!-- //table -->
							</form>
						</div>
					</div>
				</li> <!-- 내서재 -->
				<li class="item">
					<h3>
						<a href="/mylist/searchlist.do"	title="이용자공유서재">이용자공유서재</a>
					</h3>
					<div id="tab2" class="content"></div>
				</li> <!-- 이용자공유서재 -->
				
				<li class="item">
					<h3>
						<a href="/mylist/watchlist.do" title="관심서재">관심서재</a>
					</h3>
					<div id="tab3" class="content"></div>
				</li> <!-- 관심서재	-->
				
			</ul>
		</div> <!-- //board -->
	</div>

	<!-- 이동	modal -->
	

<!-- 레이어팝업 : 선택항목 이동 -->
<div id="myLibMove" class="modal alert">
	<div class="wrap">
		<div class="top">
			<h2>확인</h2>
		</div>
		<div class="bottom">
			<p class="mb30">항목을 선택하세요.</p>
			<div class="btnWrap tc">
				<a href="#close-modal" rel="modal:close" class="btnD btn3" title="확인">확인</a>
			</div>
		</div>
	</div>
</div>

	<!-- 알림	modal -->
	

<!-- 확인 -->
<div id="alert" class="modal">
	<div class="wrap">
		<div class="top">
			<div class="img save">알림</div>
		</div>
		<div class="bottom">
			<p class="tc mb70" id="msg">저장 되었습니다.</p>
			<div class="btnWrap tc">
				<a href="#close-modal" rel="modal:close" class="btn close" title="닫기">닫기</a>
			</div>
		</div>
	</div>
</div>

	<!-- 레이어팝업 : 검색대 로그인 -->
	
<a id="searchPcLoginPopup" href="#loginP" rel="modal:open" class="btn" style="display:none;" title="로그인 팝업 열기"></a>
<div id="loginP" class="modal">
	<div class="wrap">
		<div class="top">
			<h2>로그인</h2>
		</div>
		<div class="bottom">
			<div class="login">
				<div class="txt">
					<p>
						<span>국회전자도서관에 오신 것을 환영합니다. 로그인을 하시려면 아이디와 비밀번호를 입력해주세요.</span>
						<span>모바일 간편 열람증으로 입실한 경우 회원가입을 해야합니다.</span>
					</p>
					<p class="mt10 blue">공용 PC이므로 한번 더 로그인 해 주시기 바랍니다.</p>
				</div>
				<div class="input">
					<input type="hidden" id="actionType" />
					<div class="item">
						<input type="text" title="아이디" id="searchPcLoginId" placeholder="아이디" />
					</div>
					<div class="item">
						<input type="password" title="비밀번호" id="searchPcLoginPw" placeholder="비밀번호" onkeydown="if(event.keyCode == 13) searchPcLoginProc();" />
					</div>
					<div style="font-size: 14px; color: #4b4b4b; padding-bottom: 20px; display: none;" id="pwdErrorDiv">
						<p style="color: #ee145b;">아이디 또는 비밀번호를 확인해주세요</p>
					</div>
					<div class="item btn5">
						<input id="loanBasketLogin" title="로그인" type="button" value="로그인" onclick="javascript:searchPcLoginProc();"/>
					</div>
					<ul class="link">
						<li>
							<a href="http://www.nanet.go.kr/member/searchIdPwdForm.do" target="_blank" class="blank" title="아이디찾기(새창)">아이디찾기</a>
						</li>
						<li>
							<a href="http://www.nanet.go.kr/member/searchPwdForm.do" target="_blank" class="blank" title="비밀번호변경(새창)">비밀번호변경</a>
						</li>
						<li>
							<a href="http://www.nanet.go.kr/member/insertMemberForm1.do" target="_blank" class="blank" title="회원가입(새창)">회원가입</a>
						</li>
					</ul>
				</div>
			</div> <!-- //login -->
		</div>
	</div>
</div>

	<!-- start : 연속간행물 열람신청 팝업 -->
	








    
    

<script type="text/javascript">
$(document).ready(function(){
	$("#loanSerlPopupList #chkAll").click(function(){
		if($("#loanSerlPopupList #chkAll").is(":checked")){
			$("#loanSerlPopupList .chk").each(function(){
				if(!$(this).attr('disabled')){
					$(this).prop("checked", true);
				}
			})
		} else {
			$("#loanSerlPopupList .chk").prop("checked", false);
		}
	});
});
function searchButton(){
	selectSerlVolumnList($('#loanSerlPopupList input[name="loanGubun"]').val(), $('#loanSerlPopupList input[name="check_cn"]').val(), $('#loanSerlPopupList #year').val());
}
</script>
<a id="btnLoanSerlPopupOpen" href="#loanSerlPopupList" rel="modal:open" class="dNone" title="연속간행물 팝업 열기">연속간행물 팝업 열기</a>
<div id="loanSerlPopupList" class="modal serial">
<input type="hidden" name="loanGubun" value=""/>
<input type="hidden" name="check_cn" value=""/>
<input type="hidden" name="current_year" value=""/>
	<div class="wrap">
		<div class="top">
			<h2>연속간행물 권호 선택</h2>
		</div>
		<div class="bottom">
			<div class="tableWrap mb20">
				<table class="tStyle2">
					<caption class="skip">연속간행물 상세정보 입니다.</caption>
					<colgroup>
						<col width="20%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">청구기호</th>
							<td class="tl" id="callNo"></td>
						</tr>
						<tr>
							<th scope="row">자료명/저자사항</th>
							<td class="tl" id="title"></td>
						</tr>
						<tr>
							<th scope="row">발행사항</th>
							<td class="tl" id="pub"></td>
						</tr>
						<tr>
							<th scope="row">형태사항</th>
							<td class="tl" id="page"></td>
						</tr>
						<tr>
							<th scope="row">ISSN</th>
							<td class="tl" id="issn"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="year mb10">
				[서울 본관]
				
				
				<div class="selectD selectBox1">
					<div class="select selectBoxD">
						<a href="#none" title="연도"></a>
						<select id="year" name="pubYear" title="연도 선택">
						</select>
					</div>
					<div class="selectBox">
						<div class="optList">
							<ul id="yearList">
							</ul>
						</div>
					</div>
				</div> <!-- //select -->
				<input type="button" class="btn" title="조회" value="조회" onclick="searchButton();"/>
			</div>
			<p class="mb10">원문구축 및 2018년 이후 자료는 524호에서 직접 열람하십시요.</p>
			<div class="tableWrap tNone">
				<table class="tStyle1" id="dataTable">
					<caption class="skip">권호 정보를 보여주는 표이며 번호, 발행일자, 권호명, 제본정보, 자료실, 원문 순으로 되어있습니다.</caption>
					<colgroup>
						<col width="12%">
						<col width="20%">
						<col>
						<col width="11%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" name="check" id="chkAll" /><label for="chkAll">번호</label></th>
							<th scope="col">발행일자</th>
							<th scope="col">권호명</th>
							<th scope="col">제본정보</th>
							<th scope="col">자료실</th>
							<th scope="col">원문</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="btnWrap">
				<div id="btn_r">
<!-- 					<input type="button" title="열람예약신청목록담기" value="열람예약신청목록담기" class="btnD btn3" onclick="javascript:loanBasketInsertSerl('B');"/> -->
<!-- 					<input type="button" title="야간이용신청목록담기" value="야간이용신청목록담기" class="btnD btn3" onclick="javascript:loanBasketInsertSerl('R');"/> -->
					
						
						
							<!-- <input type="button" title="야간이용신청목록담기" value="야간이용신청목록담기" class="btnD btn3" onclick="javascript:alert('코로나19로 인하여 야간 개관은 실시하지 않습니다');"/> -->
							<input type="button" title="야간이용신청목록담기" value="야간이용신청목록담기(서울 본관)" class="btnD btn3" onclick="javascript:loanBasketInsertSerl('R');"/>
						
					
					
					<a href="#loanSerlPopupList" rel="modal:close" class="btnD btn4" title="닫기">닫기</a>
				</div>
				<div id="btn_b">
<!-- 					<input type="button" title="열람예약신청목록담기" value="열람예약신청목록담기" class="btnD btn3" onclick="javascript:loanBasketInsertSerl('B');"/> -->
<!-- 					<input type="button" title="야간이용신청목록담기" value="야간이용신청목록담기" class="btnD btn3" onclick="javascript:loanBasketInsertSerl('R');"/> -->
					
						
						
							<!-- <input type="button" title="야간이용신청목록담기" value="야간이용신청목록담기" class="btnD btn3" onclick="javascript:alert('코로나19로 인하여 야간 개관은 실시하지 않습니다');"/> -->
							<input type="button" title="야간이용신청목록담기" value="야간이용신청목록담기(서울 본관)" class="btnD btn3" onclick="javascript:loanBasketInsertSerl('R');"/>
						
					
					
					<a href="#loanSerlPopupList" rel="modal:close" class="btnD btn4" title="닫기">닫기</a>
				</div>
				<div id="btn_l">
					<input type="button" title="열람신청목록담기" value="열람신청목록담기" class="btnD btn3" onclick="javascript:loanBasketInsertSerl('L');"/>
					<a href="#loanSerlPopupList" rel="modal:close" class="btnD btn4" title="닫기">닫기</a>
				</div>
				<div id="btn_o">
					<input type="button" title="열람 신청목록담기" value="열람 신청목록담기" class="btnD btn3" onclick="javascript:loanBasketInsertSerl('L');"/>
					<input type="button" title="국회의원실 간편 대출서비스 목록담기" value="국회의원실 간편 대출서비스 목록담기" class="btnD btn3" onclick="javascript:loanBasketInsertSerl('O');"/>
					<a href="#loanSerlPopupList" rel="modal:close" class="btnD btn4" title="닫기">닫기</a>
				</div>
			</div>
		</div>
	</div>
</div>

	<!-- end   : 연속간행물 열람신청 팝업 -->
</section>
<script	type="text/javascript">
//<!--

	$(document).ready(function(){
		$('input[type=number]').keydown(function(key){
			if(key.keyCode == 13){
				$(location).attr('href', "/mylist/detail.do/2914475?pn="+$(this).val());
			}
		})
	});

	//수정
	$(".modifyBtn").click(function() {
		$(location).attr('href', "/mylist/modify.do?listNo=2914475");
	});

	$(".deleteBtn").click(function() {
		if(!confirm('서재를 삭제하시겠습니까?'))
		{
			return false;
		}
		var listNo = $('#listNo').val();
		$.ajax({
			type: "POST",
			url: "/mylist/delete.do?listNo="+listNo,
			success: function(msg) {
				if(msg != null){
					//결과 modal
					$("#alert").modal();
					//modal	메시지 변경
					$('#alert #msg').text("삭제 되었습니다.");
					$('#alert').on($.modal.BEFORE_CLOSE, function(event, modal){
						location.href =	msg.returnUrl;
					});
				}
			},
			error: function() {
				console.log("collection	Save API FAIL");
			}
		});
	});

	$(".del").click(function() {

		if($("input:checkbox[name=checkbox]:checked").length < 1){
			$("#myLibMove").modal();
			return false;
		}

		var formData = $("#frm").serialize();

		$.ajax({
			type: "POST",
			url: "/mylist/deleteitem.do",
			data: formData,
			cache:false,
			success: function(msg) {
				if(msg != null){
					//결과 modal
					$("#alert").modal();
					//modal	메시지 변경
					$('#alert #msg').text("삭제 되었습니다.");
					$('#alert').on($.modal.BEFORE_CLOSE, function(event, modal){
						location.href =	msg.returnUrl;
					});
				}
			},
			error: function() {
				console.log("collection	Save API FAIL");
			}
		});
	});

	$(".move").click(function() {

		if($("input:checkbox[name=checkbox]:checked").length < 1){
			$("#myLibMove").modal();
			return false;
		}

		if($("[name='cboList'] > option:selected").val() == '0'){
			$("#myLibMove").modal();
			return false;
		}

		var formData = $("#frm").serialize();

		$.ajax({
			type: "POST",
			url: "/mylist/moveitem.do",
			data: formData,
			cache:false,
			success: function(msg) {
				if(msg != null){
					//결과 modal
					$("#alert").modal();
					//modal	메시지 변경
					$('#alert #msg').text("이동 되었습니다.");
					$('#alert').on($.modal.BEFORE_CLOSE, function(event, modal){
						location.href =	msg.returnUrl;
					});
				}
			},
			error: function() {
				console.log("collection	Save API FAIL");
			}
		});
	});

	function actionChange(action) {

		var frm	= document.frm;
		if (action == 'delete')	{ frm.action = '/mylist/deleteitem.do';	}
		else if	(action	== 'moveitem') { frm.action = '/mylist/moveitem.do'; }

	}

	//목록
	$(".listBtn").click(function() {
		$(location).attr('href', "/mylist/list.do");
	});

	function loanBasketInsert_list(loanGubun, control_no) {

		var check_cn = '';
		var cnCnt = 0;

		$('input.chk:checked').each(function(){
			//제어번호 형태가 아닐 경우 제외 처리
			var vals = this.value.split('-@@-');

			cnCnt++;
			check_cn  += vals[1] + ",";

		});

		if(($('input.chk:checked').length == 0 && !control_no) || ($('input.chk:checked').length > 0 &&	check_cn == '')){
			alert('신청할 항목을 선택하십시오.');
			return;
		}

		if(control_no){
			check_cn = control_no;
		}

		//SERL이 포함되어 있거나 여러 건의 SERL 정보가 있을 경우에는 안내 OR 전용 팝업으로 안내
		if(check_cn.match(/SERL/gi)){
			if(check_cn.match(/SERL/gi).length > 1 || cnCnt	> 1){
				alert('학술지나 신문 자료는 1개만 선택하여 신청할 수 있습니다.');
			}else{
				check_cn = check_cn.replace(',','');
				selectSerlVolumnList(loanGubun,	check_cn);
			}

			return;
		}

		var html = "<input type='hidden' name='check_cn' value='" + check_cn + "'>";

		var form = document.createElement("form");
		form.action = "/loan/loanBasketInsert.do?loanGubun=" + loanGubun;
		form.method = "post";
		form.innerHTML = html;

		$("body").append(form);

		form.submit();
	}

	function searchPcLoginView(actionType){
		if(actionType == "SEND") {
			if($('input.chk:checked').length == 0) {
				alert('내서재 보내기 할 항목을 선택하십시오.');
				return;
			}
		}
		
		$('#actionType').val(actionType);
		$('#pwdErrorDiv').hide();
		$('#searchPcLoginPopup').click();
	}

	//검색대 로그인 처리
	function searchPcLoginProc(){
		if($("input:checkbox[name=checkbox]:checked").length < 1 && actionType == 'SEND'){
			$("#myLibMove").modal();
			return false;
		}

		$.ajax({
			type: "POST",
			url: "/loan/myLibLoginProc.do",
			data: {
				userid : $('#searchPcLoginId').val()
				, password: $('#searchPcLoginPw').val()
			},
			success: function(msg) {
				if(msg != null && msg.status ==	'fail' && msg.error_msg == 'search.pc.check.idpwd'){
					$('#searchPcLoginId').val('');
					$('#searchPcLoginPw').val('');
					$('#pwdErrorDiv').show();
				}else if(msg != null && msg.status ==	'fail' && msg.error_msg != 'search.pc.check.idpwd'){
					$('#alert #msg').html(msg.error_msg);
					$("#alert").modal();
				}else if(msg !=	null &&	msg.status == 'success'){
					var userId = msg.userId;
					if($('#actionType').val() == 'GET'){
						getUserMyLib(userId);
					}else if($('#actionType').val() == 'SEND'){
						sendUserMyLib(userId, msg.userName);
					}
				}
			},
			error: function(e) {
				console.log(e);
			}
		});
	}

	//내서재 가져오기
	function getUserMyLib(userId) {
		var formData = $("#frm").serialize();
		formData += '&userId=' + userId;

		$.ajax({
			type: "POST",
			url: "/mylist/getUserMyLib.do",
			data: formData,
			cache:false,
			success: function(msg) {
				if(msg != null){
					//결과 modal
					$("#alert").modal();
					//modal	메시지 변경
					$('#alert #msg').text("처리 되었습니다.");
					$('#alert').on($.modal.BEFORE_CLOSE, function(event, modal){
						window.location.reload();
					});
				}
			},
			error: function() {
				console.log("collection	Save API FAIL");
			}
		});
	}

	//내서재 보내기
	function sendUserMyLib(userId, userName) {
		var formData = $("#frm").serialize();
		formData += '&userId=' + userId;

		$.ajax({
			type: "POST",
			url: "/mylist/sendUserMyLib.do",
			data: formData,
			cache:false,
			success: function(msg) {
				if(msg != null){
					//결과 modal
					$("#alert").modal();
					//modal	메시지 변경
					$('#alert #msg').text("처리 되었습니다.");
					$('#alert').on($.modal.BEFORE_CLOSE, function(event, modal){
						window.location.reload();
					});
				}
			},
			error: function() {
				console.log("collection	Save API FAIL");
			}
		});
	}

//-->
</script><!-- start : contents  --><!-- 모바일 하단 메뉴 -->
    </div>
    <!-- start : footer -->
    <footer id="footer">
        









<div>
    <div class="footerMenu">
        <ul>
			
	         <li class="footerMenu1"><a href="https://www.nanet.go.kr/comnet/academeet/academPubView.do" target="_blank" title="협정기관 PC 인증안내">협정기관 PC 인증안내</a></li>
            <li class="footerMenu2"><a href="javascript:viewDownloadProgram();" title="프로그램 다운로드">프로그램 다운로드</a></li>
            
           	<li class="footerMenu3"><a href="/SearchCoopMap.do?gubun=1" title="가까운도서관 찾기">가까운도서관 찾기</a></li>
           	<li class="footerMenu4">
				
						
				
			</li>
        </ul>
    </div>
    <div class="address">
        <address>우07233 서울특별시 영등포구 의사당대로 1(여의도동) <span>/</span> 전화문의:02-6788-4211,080-788-4211(수신자 부담)</address>
        <p class="copyright">Copyright &copy; 대한민국 국회도서관 All rights reserved.</p>
    </div>
</div>

<!-- start : 프로그램 다운로드 -->






<div id="donwloadProgram" class="modal">
    <div class="wrap">
    	<div class="content">
	        <h2>프로그램 다운로드</h2>
	        <ul>
	        	<!-- 2021-12-28 국회도서관 통합뷰어  항목 수정 -->
	            <!-- <li>
	                <h3>국회도서관 통합뷰어 (원문보기 프로그램)</h3>
	                <div class="content">
	                    <p>국회도서관에서 제공하는 원문을 보기 위한 프로그램입니다.</p>
	                    <a id="downloadViewer" href="https://viewer.nanet.go.kr/assets/nanet/nalsvc/StreamdocsAgentSetup_portable.exe" class="download" target="_blank" title="다운로드">다운로드</a>
	                </div>
	            </li> -->
	            <li>
	                <h3>국회전자도서관 뷰어 플러그인(원문인쇄)</h3>
	                <div class="content">
	                    <p>국회전자도서관에서 제공하는 원문을 인쇄하기 위한 프로그램입니다.</p>
	                    <a id="downloadViewer" href="https://docviewer.nanet.go.kr/dist/NADLPlugin-setup.exe" class="download" target="_blank" title="다운로드">다운로드</a>
	                </div>
	            </li>
	            <li>
	                <h3>협정기관 지원 프로그램</h3>
	                <div class="content">
	                    <p>협정기관에서 국회전자도서관을 이용하기 위해 필요한 프로그램입니다.</p>
	                    <a href="/viewer3/download/installer/nalsvc_install_3.1.2.10.exe" class="download" title="다운로드">다운로드</a>
	                </div>
	            </li>
	            <li>
	                <h3>원격 지원 서비스</h3>
	                <div class="content">
	                    <p>국회전자도서관에서 협정기관 PC 원격지원을 위한 프로그램입니다.</p>
	                    <a href="https://remote.nanet.go.kr" class="download" title="원격지원서비스 바로가기" target="_blank">바로가기</a>
	                </div>
	            </li>
	        </ul>
        </div>
        <a href="#close-modal" rel="modal:close" class="close" title="닫기">닫기</a>
    </div>
</div>
<!-- end   : 프로그램 다운로드 -->
    </footer>
    <!-- end   : footer -->
</div>

<script src="/script/bs_trk.js"></script>

</body>
</html>

