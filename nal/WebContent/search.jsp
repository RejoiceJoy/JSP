<!-- 국회소장자료 : 일반자료 상단 메뉴 --><!-- 국회소장자료 : 공공정책자료 상단 메뉴 --><!-- 국회소장자료 : 왼쪽 메뉴 --><!-- 외부기관소장자료 : 왼쪽메뉴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="main.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
<script src="./plugin/jquery/jquery-1.8.3.min.js"></script>
<script src="./plugin/jquery/jquery-ui-1.9.2.custom.min.js"></script>
<script src="./plugin/jquery/jquery.i18n.js"></script>
<script src="./plugin/jquery/jquery.i18n.messagestore.js"></script>
<script src="./plugin/jquery/jquery.modal.min.js"></script>
<script src="./plugin/rangechart/Nwagon.js"></script>
<script src="./script/footable.js"></script>
<script src="./script/slick.js"></script>
<script src="./script/lib.js"></script>
<script src="./script/sub.js"></script>
<script src="./script/search/common.js"></script>
<script src="./script/search/facet.js"></script>
<script src="./script/search/brief.js"></script>
<script src="./script/search/detail.js"></script>
<script src="./script/search/autocomplete.js"></script>
<script src="./script/slider.js"></script>
<script src="./script/mobile.js"></script>

<script src="./script/class/AjaxUtil.class.js"></script>
<script src="./script/class/JSUtil.class.js"></script>
<script src="./script/class/Logger.class.js"></script>
<script src="./script/class/Map.class.js"></script>
<script src="./script/class/PopupUtil.class.js"></script>

<script src="./script/prototype/Array.prototype.js"></script>
<script src="./script/prototype/String.prototype.js"></script>
<script src="./script/popup.js"></script>
<script src="./script/title.js"></script>







<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$("#showbookinfo").click(function() {
			var putkeyword = $("#putkeyword").val();
			if(putkeyword == '') {
				alert("검색어를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"post",	//post 방식으로 전송
				async:false,	//동기식으로 처리
				url:"${contextPath}/search.nal",			//전송할 서블릿 지정
				data: {keyword: putkeyword},
				success:function (data, textStatus){	//전송과 응답이 성공했을 경우 작업 설정
					var jsoninfo = JSON.parse(data);	//서블릿에서 가져온 데이터를 받음
					var bookinfo = "<ol id = 'asearch'>";
					for(var i in jsoninfo.books) {
						bookinfo += "<li><fieldset><p><h4>";
						bookinfo += jsoninfo.books[i].book_title + "/";
						bookinfo += jsoninfo.books[i].author + "</h4></p><p>";
						bookinfo += jsoninfo.books[i].publishing + " | ";
						bookinfo += jsoninfo.books[i].room_name + " | ";
						bookinfo += jsoninfo.books[i].book_sorting + " | ";
						bookinfo += jsoninfo.books[i].shape + " | ";
						bookinfo += jsoninfo.books[i].isbn + "</p></fieldset></li>";
					} //end for
					bookinfo += "</ol>"
					$("#output").html(bookinfo);
				}, //end success function
				error: function (data, textStatus) {
					alert("에러가 발생했습니다.");
				}//end error
			}); //end ajax
		});//end showbookinfo function
	});//end function
</script>

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
    var uri = '/search/searchInnerList.do';
    titleSet(uri);
});

function searchCom()
{

	
	$("#searchBtn").attr("disabled", false);
	
	//alert(("#searchBtn").attr("disabled"));
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
	<h1><a href="http://localhost:8080/nal" onclick="getInSession()" title="국회전자도서관"><img src="images/ko/logo.png" alt="국회전자도서관"></a></h1>

</div>
<nav id="gnb" class="pcMenu">
    <h2 class="skip">탑메뉴</h2>
    <ul>
        
            
            
                <li><a href="#firstVisit" rel="modal:open" title="처음방문이세요?">처음방문이세요?</a></li>
                <li><a href="./login.do" title="로그인">로그인</a></li>
                <li><a href="./selectMember.do" title="회원가입">회원가입</a></li>
            
        
        <li class="myLibrary"><a href="/mylist/usedLibList.do" title="My Library" id="myLib">My Library</a></li>
    </ul>
</nav>


<section id="search">
    <h2 class="skip">검색</h2>
    <div class="searchForm">
        <form method="post" id="searchForm" name="searchForm" action="" onsubmit="javascript:putSearchHistory();">
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
                
<!--                 start : 다국어 page               

                end : 다국어 page
 -->                
             <!--    <input type = "text" id = "putkeyword" /> -->
                <input type="text" class="inputText" id="putkeyword" name="searchQuery" onfocus="setFocusIdForMultiLang('searchQuery');this.select();" title="검색 입력창"
                 autocomplete="off" placeholder="검색어를 입력해주세요"
                 >
                <div class="autoComplete">
                    <!--  ajax 데이터 처리 영역 -->
                </div>
                <input type="button" value="다국어입력" title="다국어입력" class="searchKeyboard" />
<!--                 <a id="showbookinfo">
                <input type="button" class="searchBtn"  disabled=disabled />
            	</a> -->
            	<a id="showbookinfo" class="searchBtn"  disabled=disabled style = "cursor:pointer"></a><br><br>
 
            </fieldset>
        </form>
        
            
            
                <a href="#detailSearch" rel="modal:open" class="searchBtn2" title="상세 검색">상세<br>검색</a>
                
                	<a href="javascript:searchOuterList();" class="searchBtn3" title="외부기관 검색">외부기관<br>검색</a>
                
            
        
    </div>
    
	    <div class="searchMore">
	    	<ul>
	    		
	    		<li>
	    			<input type="checkbox" id="chkRefineSearchYn" name="chkRefineSearchYn" tabindex="-1"/>
	    			<label for="chkRefineSearchYn" tabindex="0">결과 내 검색</label>
	    		</li>
	    		
		    		<li>
		    			<input type="checkbox" id="chkSynonymYn" name="chkSynonymYn" tabindex="-1"/>
		    			<label for="chkSynonymYn" tabindex="0">동의어 검색</label>
		    		</li>
	    		
	    	</ul>
	    </div>
	    <dl>
	        
	        <dt></dt>
	        <dd>
	            <ul>
	                
	                
	                    
	                        
	                        <li><a href="javascript:changeSearchQuery('자바')" title="자바"></a></li>
	                    
	                
	            </ul>
	        </dd>
	        
	    </dl>
	
    
</section>


<!-- start : 상세검색 팝업 -->




<!-- end   : 상세검색 팝업 -->


<!-- start : 처음방문이세요 레이어 팝업 -->






<!-- 레이어팝업 : 처음방문이세요? -->


<!-- end   : 처음방문이세요 레이어 팝업 -->

    </header>
    <!-- end   : header -->
    <div id="container">
        <!-- start : contents  -->
















<!-- 수정예정20211108 -->

<!-- 수정예정20211108 -->
<script type="text/javascript">
    // 국회소장자료 검색 관련 전역변수
    var prevSearchQuery      = " 자바애플";
    var searchClass          = "S";
    var zone                 = "ALL_NI_TOC";
    var pageNum              = "1";
    var pageSize             = "10";
    var orderBy              = "WEIGHT";
    var topMainMenuCode      = "MONO_ALL";
    var topSubMenuCode       = "MONO_ALL";
    var hanjaYn              = "Y";
    var isdb                 = "";
    var isdbsvc              = "";
    var tt1                  = "";
    var down                 = "";
    var languageCode         = "";
    var fieldText            = "";
    var prevPubYearFieldText = "";
    var totalSize            = "42";
    var totalSizeByMenu      = "1";
 	//소장도서관 패킷정보 추가, 20211125 KHJ
    var dpBranch       		 = "ALL";
    //학술지종류 정보 추가, 20211224 KHJ
	var journalKind       	 = "";

    var userId               = "";
    var userClass1           = "0";
    var isMobile			 = ("false" === "true");
    var colorType = "";
    var INTERNET_R           = "0";
</script>

<script src="/script/search/inner.js"></script>
<script src="/script/search/innerList.js"></script>

<link rel="stylesheet" href="/plugin/chart/style.css">
<link rel="stylesheet" href="/plugin/chart/searchlist2015.css">
<link rel="stylesheet" href="/style/ko/search/searchlist2020.css">

<script src="/plugin/chart/highstock.js"></script>
<script src="/plugin/chart/highcharts-more.js"></script>
<script src="/plugin/chart/d3.min.js"></script>
<script src="/plugin/chart/chart.js"></script>
<script src="/plugin/chart/chartTrend.js"></script>
<script src="/plugin/chart/chartCount.js"></script>
<script src="/plugin/chart/bubble.js"></script>

	<script src="/plugin/chart/radial.js"></script>

<script src="/plugin/chart/jquery.tbodyscroll.js"></script>
<!-- 수정예정20211108 -->
<script src="/plugin/chart/core_NEW.js"></script>
<script src="/plugin/chart/chart_NEW.js"></script>

<script src="/plugin/chart/wordBunpo_NEW.js"></script>
<script src="/plugin/chart/wordCloud_NEW.js"></script>
<script src="/plugin/chart/rangeSelector_NEW.js"></script>
<script src="/plugin/chart/material_NEW.js"></script>
<script src="/plugin/chart/animated_NEW.js"></script>
<script src="/plugin/chart/forceDirected_NEW.js"></script>
<script src="/plugin/chart/wordRelationChart_NEW.js"></script>
<script src="/plugin/chart/wordFigure_NEW.js"></script>
<script src="/plugin/chart/wordKeyword_NEW.js"></script>
<script src="/script/ldLayer/ldLayer.js"></script>

<link rel="stylesheet" type="text/css" href="/plugin/chart/demo_NEW.css" />
<link rel="stylesheet" type="text/css" href="/script/ldLayer/ldLayer.css" />
<link href="resource/css/fonts.css" rel="stylesheet">

<!-- Styles -->
<style>
#chartCloud {
  /* width: 1038px;
  height: 475px; */
  width: 100%;
  height: 520px;
}
#chartRel {
  width: 100%;
  height: 480px;
}

#controls {
  overflow: hidden;
  padding-bottom: 3px;
}

#chartFigure {
  width: 100%;
  height: 520px;
}

#chartKeyword {
	position:absolute;
	width: 100%;
	/* max-width: 1038px; */
  	height: 450px;
  	top:64px;
}
#chartKeywordBtn {
	padding-top: 10px;
	/* margin-top : 5%; */
}


/* 이미지 넣어야함 */
#chartKeywordBtn .btn_daily {position:absolute;top:43px;right: 15px;width: 49px;height:23px;background:url(/plugin/chart/btn_daily.png) no-repeat;font-size:11px;color:#777;}
#chartKeywordBtn .btn_daily.on {position:absolute;top:43px;right:15px;width:49px;height:23px;background:url(/plugin/chart/btn_daily_on.png) no-repeat;font-size:11px;color:#777;}
#chartKeywordBtn .btn_weekly {position:absolute;top:43px;right: 15px;width: 49px;height:23px;background:url(/plugin/chart/btn_weekly.png) no-repeat;font-size:11px;color:#777;}
#chartKeywordBtn .btn_weekly.on {position:absolute;top:43px;right:15px;width:49px;height:23px;background:url(/plugin/chart/btn_weekly_on.png) no-repeat;font-size:11px;color:#777;}
#chartKeywordBtn .btn_montly {position:absolute;top:43px;right:65px;width:49px;height:23px;background:url(/plugin/chart/btn_montly.png) no-repeat;font-size:11px;color:#777;}
#chartKeywordBtn .btn_montly.on {position:absolute;top:43px;rigt:65px;width:49px;height:23px;background:url(/plugin/chart/btn_montly_on.png) no-repeat;font-size:11px;color:#777;}

</style>
<!-- 수정예정20211108 -->

<div class="searchBrief">
    <!-- 프린트용 form -->
    <form action="/result/search/output.do" name="exportForm" id="exportForm" method="post">
        <input type="hidden" name="contentHtml">
        <input type="hidden" name="handlerType">
    </form>
    
        <section class="category">
            <!-- start : 상단 메뉴  -->
            





<h2 class="skip">자료 카테고리</h2>
<div id="category" class="category1">
    <ul class="firstDepth">
        <li id="s_menu" class="on">
            <a href="javascript:changeSearchClass('S')" title="자료구분" id="dataCategory">자료구분</a>
            <ol class="secondDepth">
                
                
                    
                    
                        
                        
                            <li id="s_ALL" data-api="ALL" data-api-name="전체"><a href="javascript:changeDbDiv('ALL')" title="전체">전체<span>42</span></a></li>
                        
                    
                
                    
                    
                        
                            <li id="s_MONO_ALL" data-api="MONO_ALL" data-api-name="도서자료">
                                
                                <a href="javascript:changeDbDiv('MONO_ALL', 'MONO_ALL');" title="도서자료">
                                
                                
                                
                                도서자료<span>1</span>
                                </a>

                                <div class="thirdDepth">
                                    <div class="inner">
                                        <ol>
                                            <li id="s_MONO_ALL" data-api="MONO_ALL" data-api-name="전체"><a href="javascript:changeDbDiv('MONO_ALL', 'MONO_ALL')" title="전체">전체<span>(1)</span></a></li>
                                            
                                                <li id="s_MONO" data-api="MONO" data-api-name="일반도서">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('MONO_ALL', 'MONO');" title="일반도서">
				                                
				                                
				                                
                                                일반도서<span>(1)</span>
                                                </a></li>
                                           
                                                <li id="s_EBOK" data-api="EBOK" data-api-name="E-BOOK">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('MONO_ALL', 'EBOK');" title="E-BOOK">
				                                
				                                
				                                
                                                E-BOOK<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_OLDP" data-api="OLDP" data-api-name="고서">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('MONO_ALL', 'OLDP');" title="고서">
				                                
				                                
				                                
                                                고서<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_PAMP" data-api="PAMP" data-api-name="세미나자료">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('MONO_ALL', 'PAMP');" title="세미나자료">
				                                
				                                
				                                
                                                세미나자료<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_WNET" data-api="WNET" data-api-name="웹자료">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('MONO_ALL', 'WNET');" title="웹자료">
				                                
				                                
				                                
                                                웹자료<span>(0)</span>
                                                </a></li>
                                           
                                        </ol>
                                    </div>
                                </div>
                            </li>
                        
                        
                    
                
                    
                    
                        
                            <li id="s_KDMT_ALL" data-api="KDMT_ALL" data-api-name="학위논문">
                                
                                <a href="javascript:changeDbDiv('KDMT_ALL', 'KDMT_ALL');" title="학위논문">
                                
                                
                                
                                학위논문<span>0</span>
                                </a>

                                <div class="thirdDepth">
                                    <div class="inner">
                                        <ol>
                                            <li id="s_KDMT_ALL" data-api="KDMT_ALL" data-api-name="전체"><a href="javascript:changeDbDiv('KDMT_ALL', 'KDMT_ALL')" title="전체">전체<span>(15)</span></a></li>
                                            
                                                <li id="s_KDMT" data-api="KDMT" data-api-name="학위논문">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('KDMT_ALL', 'KDMT');" title="학위논문">
				                                
				                                
				                                
                                                학위논문<span>(15)</span>
                                                </a></li>
                                           
                                        </ol>
                                    </div>
                                </div>
                            </li>
                        
                        
                    
                
                    
                    
                        
                            <li id="s_KINX_ALL" data-api="KINX_ALL" data-api-name="연속간행물&amp;middot;학술기사">
                                
                                <a href="javascript:changeDbDiv('KINX_ALL', 'KINX_ALL');" title="연속간행물&middot;학술기사">
                                
                                
                                
                                연속간행물&middot;학술기사<span>0</span>
                                </a>

                                <div class="thirdDepth">
                                    <div class="inner">
                                        <ol>
                                            <li id="s_KINX_ALL" data-api="KINX_ALL" data-api-name="전체"><a href="javascript:changeDbDiv('KINX_ALL', 'KINX_ALL')" title="전체">전체<span>(26)</span></a></li>
                                            
                                                <li id="s_KINX" data-api="KINX" data-api-name="국내기사">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('KINX_ALL', 'KINX');" title="국내기사">
				                                
				                                
				                                
                                                국내기사<span>(26)</span>
                                                </a></li>
                                           
                                                <li id="s_FINX" data-api="FINX" data-api-name="국외기사">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('KINX_ALL', 'FINX');" title="국외기사">
				                                
				                                
				                                
                                                국외기사<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_SERL" data-api="SERL" data-api-name="학술지·잡지">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('KINX_ALL', 'SERL');" title="학술지·잡지">
				                                
				                                
				                                
                                                학술지·잡지<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_NEWS" data-api="NEWS" data-api-name="신문">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('KINX_ALL', 'NEWS');" title="신문">
				                                
				                                
				                                
                                                신문<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_WEDB" data-api="WEDB" data-api-name="전자저널">
                                              <!-- 2020.12.07 -->
                                                
				                                <a href="javascript:changeDbDiv('KINX_ALL', 'WEDB');" title="전자저널">
				                                
				                                
				                                
                                                전자저널<span>(0)</span>
                                                </a></li>
                                           
                                        </ol>
                                    </div>
                                </div>
                            </li>
                        
                        
                    
                
                    
                    
                        
                            <li id="s_NONB_ALL" data-api="NONB_ALL" data-api-name="멀티미디어">
                                
                                
                                <a href="#" title="멀티미디어">
                                
                                
                                멀티미디어<span>0</span>
                                </a>

                                <div class="thirdDepth">
                                    <div class="inner">
                                        <ol>
                                            <li id="s_NONB_ALL" data-api="NONB_ALL" data-api-name="전체"><a href="javascript:changeDbDiv('NONB_ALL', 'NONB_ALL')" title="전체">전체<span>(0)</span></a></li>
                                            
                                                <li id="s_VDBK" data-api="VDBK" data-api-name="동영상자료">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="동영상자료">
				                                
				                                
                                                동영상자료<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_ADBK" data-api="ADBK" data-api-name="오디오자료">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="오디오자료">
				                                
				                                
                                                오디오자료<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_CDBK" data-api="CDBK" data-api-name="전자매체">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="전자매체">
				                                
				                                
                                                전자매체<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_MIFO" data-api="MIFO" data-api-name="마이크로폼자료">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="마이크로폼자료">
				                                
				                                
                                                마이크로폼자료<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_MAPI" data-api="MAPI" data-api-name="지도/기타자료">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="지도/기타자료">
				                                
				                                
                                                지도/기타자료<span>(0)</span>
                                                </a></li>
                                           
                                        </ol>
                                    </div>
                                </div>
                            </li>
                        
                        
                    
                
                    
                    
                        
                            <li id="s_ASSM_ALL" data-api="ASSM_ALL" data-api-name="국회자료">
                                
                                
                                <a href="#" title="국회자료">
                                
                                
                                국회자료<span>0</span>
                                </a>

                                <div class="thirdDepth">
                                    <div class="inner">
                                        <ol>
                                            <li id="s_ASSM_ALL" data-api="ASSM_ALL" data-api-name="전체"><a href="javascript:changeDbDiv('ASSM_ALL', 'ASSM_ALL')" title="전체">전체<span>(0)</span></a></li>
                                            
                                                <li id="s_TLAW" data-api="TLAW" data-api-name="외국법률번역DB">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="외국법률번역DB">
				                                
				                                
                                                외국법률번역DB<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_PROC" data-api="PROC" data-api-name="국회회의록">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="국회회의록">
				                                
				                                
                                                국회회의록<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_NABI" data-api="NABI" data-api-name="국회의안정보">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="국회의안정보">
				                                
				                                
                                                국회의안정보<span>(0)</span>
                                                </a></li>
                                           
                                        </ol>
                                    </div>
                                </div>
                            </li>
                        
                        
                    
                
                    
                    
                        
                            <li id="s_SPEC_ALL" data-api="SPEC_ALL" data-api-name="특화자료">
                                
                                
                                <a href="#" title="특화자료">
                                
                                
                                특화자료<span>0</span>
                                </a>

                                <div class="thirdDepth">
                                    <div class="inner">
                                        <ol>
                                            <li id="s_SPEC_ALL" data-api="SPEC_ALL" data-api-name="전체"><a href="javascript:changeDbDiv('SPEC_ALL', 'SPEC_ALL')" title="전체">전체<span>(0)</span></a></li>
                                            
                                                <li id="s_REFD" data-api="REFD" data-api-name="표·그림DB">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="표·그림DB">
				                                
				                                
                                                표·그림DB<span>(0)</span>
                                                </a></li>
                                           
                                                <li id="s_KSDB" data-api="KSDB" data-api-name="지식공유">
                                              <!-- 2020.12.07 -->
                                                
				                                
				                                <a href="#" title="지식공유">
				                                
				                                
                                                지식공유<span>(0)</span>
                                                </a></li>
                                           
                                        </ol>
                                    </div>
                                </div>
                            </li>
                        
                        
                    
                
            </ol>
        </li>
        <li id="g_menu" >
            <a href="javascript:changeSearchClass('G')" title="공공정책정보">공공정책정보</a>
            <ol class="secondDepth">
                
                    
                    
                        
                        
                            <li id="g_ALL" data-api="ALL" data-api-name="전체"><a href="javascript:changeDbDiv('ALL')" title="전체">전체<span>42</span></a></li>
                        
                    
                
                    
                    
                        
                            <li id="g_10" data-api="10" data-api-name="국내공공정책정보">
                                <a href="javascript:changeDbDiv('10', '10');" title="국내공공정책정보">국내공공정책정보<span></span></a>
                                <div class="thirdDepth">
                                    <div class="inner">
                                        <ol>
                                            <li id="g_10" data-api="10" data-api-name="전체"><a href="javascript:changeDbDiv('10', '10')" title="전체">전체<span>()</span></a></li>
                                            
                                                <li id="g_10_AA" data-api="10_AA" data-api-name="정부기관"><a href="javascript:changeDbDiv('10', '10_AA')" title="정부기관">정부기관<span>()</span></a></li>
                                           
                                                <li id="g_10_BB" data-api="10_BB" data-api-name="지방자치단체"><a href="javascript:changeDbDiv('10', '10_BB')" title="지방자치단체">지방자치단체<span>()</span></a></li>
                                           
                                                <li id="g_10_CC" data-api="10_CC" data-api-name="공공기관"><a href="javascript:changeDbDiv('10', '10_CC')" title="공공기관">공공기관<span>()</span></a></li>
                                           
                                                <li id="g_10_DD" data-api="10_DD" data-api-name="싱크탱크"><a href="javascript:changeDbDiv('10', '10_DD')" title="싱크탱크">싱크탱크<span>()</span></a></li>
                                           
                                                <li id="g_10_GG" data-api="10_GG" data-api-name="국제기구"><a href="javascript:changeDbDiv('10', '10_GG')" title="국제기구">국제기구<span>()</span></a></li>
                                           
                                        </ol>
                                    </div>
                                </div>
                            </li>
                        
                        
                    
                
                    
                    
                        
                            <li id="g_20" data-api="20" data-api-name="국외공공정책정보">
                                <a href="javascript:changeDbDiv('20', '20');" title="국외공공정책정보">국외공공정책정보<span></span></a>
                                <div class="thirdDepth">
                                    <div class="inner">
                                        <ol>
                                            <li id="g_20" data-api="20" data-api-name="전체"><a href="javascript:changeDbDiv('20', '20')" title="전체">전체<span>()</span></a></li>
                                            
                                                <li id="g_20_AA" data-api="20_AA" data-api-name="정부기관"><a href="javascript:changeDbDiv('20', '20_AA')" title="정부기관">정부기관<span>()</span></a></li>
                                           
                                                <li id="g_20_HH" data-api="20_HH" data-api-name="의회기관"><a href="javascript:changeDbDiv('20', '20_HH')" title="의회기관">의회기관<span>()</span></a></li>
                                           
                                                <li id="g_20_DD3" data-api="20_DD3" data-api-name="싱크탱크"><a href="javascript:changeDbDiv('20', '20_DD3')" title="싱크탱크">싱크탱크<span>()</span></a></li>
                                           
                                                <li id="g_20_GG" data-api="20_GG" data-api-name="국제기구"><a href="javascript:changeDbDiv('20', '20_GG')" title="국제기구">국제기구<span>()</span></a></li>
                                           
                                        </ol>
                                    </div>
                                </div>
                            </li>
                        
                        
                    
                
                    
                    
                        
                            <li id="g_10_HH" data-api="10_HH" data-api-name="국회자료">
                                <a href="javascript:changeDbDiv('10_HH', '10_HH');" title="국회자료">국회자료<span></span></a>
                                <div class="thirdDepth">
                                    <div class="inner">
                                        <ol>
                                            <li id="g_10_HH" data-api="10_HH" data-api-name="전체"><a href="javascript:changeDbDiv('10_HH', '10_HH')" title="전체">전체<span>()</span></a></li>
                                            
                                                <li id="g_10_HH_Y" data-api="10_HH_Y" data-api-name="국회의원정책자료"><a href="javascript:changeDbDiv('10_HH', '10_HH_Y')" title="국회의원정책자료">국회의원정책자료<span>()</span></a></li>
                                           
                                                <li id="g_10_HH_N" data-api="10_HH_N" data-api-name="입법기관자료"><a href="javascript:changeDbDiv('10_HH', '10_HH_N')" title="입법기관자료">입법기관자료<span>()</span></a></li>
                                           
                                        </ol>
                                    </div>
                                </div>
                            </li>
                        
                        
                    
                
            </ol>
        </li>
    </ul>
</div>
            <!-- end   : 상단 메뉴  -->
        </section>
        <div class="btns">
            <ul>
                <li class="item1"><a href="#refAuthor" rel="modal:open" title="저자명참조">저자명참조</a></li>
                
                	<li class="item2"><a href="#termDict"  rel="modal:open" title="용어관계사전">용어관계사전</a></li>
                
            </ul>
        </div>
    
    <section class="brief">
        <h2 class="skip">검색결과</h2>
        <div class="briefHead">
            <!-- start : 리스트 건수 및 정렬  -->
            







    
    
	    
	    	 
	    	
	    	
	    	
	    	
	    	
	    	
	    

        <p>검색결과 ( 1건 / 전체 <span class="count">42</span>건)</p>
    


<!-- 국회도서관 소장자료이고 검색리스트 조회인 경우만 표시 -->

    <div class="inquire">
        <fieldset>
            <legend class="skip">페이지 보기 설정</legend>
            <div class="selectD selectBox1" id="selpageView">
                <div class="select selectBoxD">
                    <a href="#none" id="selPageSizeLabel" title="10개씩 보기">10개씩 보기</a>
                    <!--selectbox display:none-->
                    
                    
                    
                    <select id="selPageSize" name="selPageSize" title="디스플레이 수 선택">
                        <option value="10" selected="selected">10개씩 보기</option>
                        <option value="20">20개씩 보기</option>
                        <option value="30">30개씩 보기</option>
                        <option value="40">40개씩 보기</option>
                        <option value="50">50개씩 보기</option>
                    </select>
                    
                    
                    <!--//selectbox display:none-->
                </div>
                <div class="selectBox">
                    <div class="optList">
                        <ul>
                    
                    
                    
                            <li><a href="#" title="10개씩 보기" >10개씩 보기</a></li>
                            <li><a href="#" title="20개씩 보기" >20개씩 보기</a></li>
                            <li><a href="#" title="30개씩 보기" >30개씩 보기</a></li>
                            <li><a href="#" title="40개씩 보기" >40개씩 보기</a></li>
                            <li><a href="#" title="50개씩 보기" >50개씩 보기</a></li>

                    
                    



                        </ul>
                    </div>
                </div>
            </div>
            <div class="selectD selectBox1 w135">
                <div class="select selectBoxD">
                    <a href="#none" id="selOrderByLabel" title="정렬항목">정확도</a>
                    <!--selectbox display:none-->
                    <select id="selOrderBy" name="selOrderBy" title="정렬항목 선택">
                    	<option value="WEIGHT">정확도</option>
                        <option value="DP_PUB_YEAR_DESC" selected="selected">발행년도(최신순)</option>
                        <option value="DP_PUB_YEAR_ASC">발행년도(과거순)</option>
                        <option value="DP_TITLE_ASC">서명(ㄱ~ㅎ순)</option>
                        <option value="DP_TITLE_DESC">서명(ㅎ~ㄱ순)</option>
                        <option value="DP_POPULAR_SCORE_DESC">인기도</option>
                    </select>
                    <!--//selectbox display:none-->
                </div>
                <div class="selectBox">
                    <div class="optList">
                        <ul>
                        	<li><a href="#" title="정확도" >정확도</a></li>
                            <li><a href="#" title="발행년도(최신순)" >발행년도(최신순)</a></li>
                            <li><a href="#" title="발행년도(과거순)" >발행년도(과거순)</a></li>
                            <li><a href="#" title="서명(ㄱ~ㅎ순)" >서명(ㄱ~ㅎ순)</a></li>
                            <li><a href="#" title="서명(ㅎ~ㄱ순)" >서명(ㅎ~ㄱ순)</a></li>
                            <li><a href="#" title="인기도(내림차순)" >인기도</a></li>

                        </ul>
                    </div>
                </div>
            </div>
            <input type="button" id="btnApply" name="btnApply" onclick="changePageSizeAndOrderBy();" title="적용" value="적용">
        </fieldset>
    </div>

            <!-- end   : 리스트 건수 및 정렬   -->
        </div>
        <div class="briefContent">
            <!-- start : 좌측 메뉴  -->
            





<style>
	.openBranch{
		color:blue;
	}
</style>
<div class="facet">
<!-- 탭추가, 해당처리방식 보류, 20211124 KHJ-->




	<div class="m top">
		<h3>검색결과제한</h3>
		<a href="#none" title="열기">열기</a>
	</div>
    <ul>
    	<li class="type4 on" style="display:none;" id="FACET_SEARCH_CANCEL">
    	    <a href="#none" title="검색 결과 취소"><span>검색 결과 취소</span></a>
    		<div class="searchCancel">
                <!-- 후처리 부분 (in common.js) -->
    		</div>
    	</li>



		<li class="type1 height on" id="FACET_DPBRANCH">
            <a href="#none" title="소장도서관" style="background:#f8b858;"><span>소장도서관</span></a>
            
                <div>
	                <ul style="height:auto;">
	                     
			                
			                
			                
			                  
			 				<li class="" data-api-type="dpBrahch" data-api="ULK"  data-api-name="국회도서관[서울 본관]">
			 					<a href="javascript:changeDpBranch('ULK');" class="selDpBranch ">
			 					<!-- 국회도서관[서울 본관] (1)</a> -->
			 						국회도서관[서울 본관]&nbsp;
			 					</a>
			 				</li>
			            
	                </ul>
                </div>
            
        </li>



    	
    	

        <li class="type1 on" id="FACET_ORG_DOC">
            <a href="#none" title="원문"><span>원문</span></a>
            
                <div>
                    <ul>
                        
                            
                            
                                
                                
                                    
                                    
                                        
                                            
                                        
                                        
                                        
                                    
                                    <li class="" data-api-type="isdb" data-api="N" data-api-name="원문 없는 자료">
                                        <a href="javascript:changeOrgDoc('isdb', 'N');" title="원문 없는 자료">원문 없는 자료&nbsp;</a>
                                    </li>
                                
                            
                        
                    </ul>
                </div>
            
        </li>

         <script type="text/javascript">
            var pubYearJSON;
            var pubYearMap = '{&#034;2015&#034;:&#034;1.0&#034;}';
            if (pubYearMap.length > 0) {
            	pubYearMap = pubYearMap.replace(/&#034;/gi, "\"");
            	pubYearJSON = JSON.parse(pubYearMap);
            }
        </script>
        <li class="type1 pubYearData on" id="pubYearGraphArea">
            <a href="#none" title="발행년도"><span>발행년도</span></a>
            <div id="pubYear">
                <dl>
                    <dd>
                        <div class="graphWrap">
                            <div id="graphInner" class="graph"></div>
                            <div id="graph" class="graph">
                                <div id="graphOuter" class="graph"></div>
                            </div>
                         </div>
                         <div id="slider"></div>
                         <div class="graphDate">
                             <input type="text" id="startPubYear" name="startPubYear" maxlength="4" title="발행 시작년"><span>-</span><input type="text" id="endPubYear" name="endPubYear" maxlength="4" title="발행 종료년">
                             <input type="button" class="pubYearBtn" title="적용" value="적용" onclick="changePubYear();" />
                         </div>
                    </dd>
                </dl>
            </div>
        </li>

        <li class="type1 height on" id="FACET_LANGUAGE">
            <a href="#none" title="언어"><span>언어</span></a>
            
                <div>
	                <ul>
	                     
	                        
	                        
                            
	                        <li class="" data-api-type="language" data-api="KOR" data-api-name="한국어">
	                           <a href="javascript:changeLanguage('KOR');" title="한국어">한국어&nbsp;</a>
	                        </li>
	                     
	                </ul>
	                <div class="more"><button>더보기</button></div>
                </div>
            
        </li>



	<!-- 학술지종류 추가, 20211224 KHJ -->
	



        

        
        <li class="type3"><span>원문이용안내</span>
            <div>
                <ul>
                    <li>
                        <div class="left">
                            <img src="images/ko/ico/pdf4.png" alt="pdf 파일 아이콘" />
                        </div>
                        <div class="right">모든 이용자</div>
                    </li>
                    <li>
                        <div class="left">
                            <img src="images/ko/ico/pdf6.png" alt="협정기관 이용자용 pdf 파일 아이콘" />
                            <img src="images/ko/ico/pdf7.png" alt="협정기관 이용자용 pdf 파일 아이콘" />
                        </div>
                        <div class="right">협정기관 이용자</div>
                    </li>
                    <li>
                        <div class="left">
                            <img src="images/ko/ico/pdf8.png" alt="국회도서관 방문 이용자용 pdf 파일 아이콘" />
                            <img src="images/ko/ico/pdf9.png" alt="국회도서관 방문 이용자용 pdf 파일 아이콘" />
                        </div>
                        <div class="right">국회도서관 방문 이용자</div>
                    </li>
                    <li>
                        <p>원문아이콘이 없는 자료는 국회도서관에 방문하여 책자로만 이용이 가능합니다.</p>
                    </li>
                </ul>
            </div>
        </li> <!-- 원문이용안내 -->
    </ul>
</div>
            <!-- end   : 좌측 메뉴  -->

            <!-- start : 인포그래픽 -->
            <form name="frmChartTopic" id="frmChartTopic">
                <input type="hidden" name="host"            id="Host" value="">
                <input type="hidden" name="dramaCollection" id="dramaCollection" value="NADL">
                <input type="hidden" name="dramaOption"     id="dramaOption"     value="XQ">
                <input type="hidden" name="dataOption"      id="dataOption"      value="Y">
                <input type="hidden" name="useRepreterms"   id="useRepreterms"   value="Y">
                <input type="hidden" name="searchTerm"      id="chartTerm"       value="자바애플">
                <input type="hidden" name="chartFlag"       id="chartFlag"       value="trend">
                <input type="hidden" name="listPage"        id="chartListPage"   value="1">
                <input type="hidden" name="listCount"       id="chartListCount"  value="2">
                <input type="hidden" name="selectTerm"      id="chartSelectTerm" value="">
                <input type="hidden" name="vflag"      id="vflag" value="">
            </form>
            <div id="search_graph" style="display:none;">
                <ul class="tab">
                    <li id="buttonTopicTrend_new">
                        <a href="#tab1" class="selected" title="연관어 트랜드">연관어 트랜드</a>
                    </li>
                    <li id="buttonTopicCount_new">
                        <a href="#tab2" title="연관어 분포">연관어 분포</a>
                    </li>
                    <li id="buttonTopicCount_new">
                        <a href="#tab3" title="연관어  인물">연관어  인물</a>
                    </li>
                    <li id="buttonTopicCount_new">
                        <a href="#tab4" title="연관어  인기도">연관어  인기도</a>
                    </li>
                </ul>
                <a href="#blank" class="search_close" title="닫기">닫기</a>
                <ul class="panel">
                    <li class="tab1" id="tab1">
                        <div id="graph_area">
                            <span  id='loadingBarDiv' style='display:none;position:relative;z-Index:9999;'><img src="images/ko/chart/ajaxloader.gif" border="0" alt="로딩중"></span>
                            <div class="graph_box">
                                <!-- <div class="sc_graph" id="chart"></div> -->
                                <!--  연관어 트랜드 start  -->
                                <div class="demo-body" style = "display:none">
									<div id="controls" style = "display:none"></div>
									<div id="chartRel"></div>
								</div>
								<!-- // 연관어 트랜드 end   -->

								<!--  연관어 분포도 start  -->
                                <div class="sc_graph" id="chartCloud" style="display:none"></div>
                                <!-- // 연관어 분포도 end   -->

                                <!--  연관어 관련인물 start  -->
                                <div class="sc_graph" id="chartFigure" style="display:none"></div>
                                 <!-- // 연관어 관련인물 end   -->

                                 <!--  연관어 관련 인기도 start  -->
                                <div class="chartKeyword" style="display:none">
									<div  id="chartKeywordBtn" style = "display:none">
			 							<a href="#" class="btn_montly" title="월간"></a>
										<a href="#" class="btn_weekly" title="주간"></a>
									</div>
									<br>
	                                <br>
									<div id="chartKeyword" style = "display:none"></div>
								</div>
								<!-- // 연관어 관련 인기도 end   -->
                                <div class="search_cat">
                                    <a href="#" class="btn_cat_more" title="지식맵 연관어보기"><span class="blind">연관어보기</span></a>
                                    <ul class="more_cat_list"></ul>
                                </div>
                                <a href="#" class="btn_view_large" id="buttonPopupChart" title="지식맵 크게보기"></a>
                                <a href="#" class="btn_table" title="지식맵 표로 보기"></a>
                                <div class="sc_page">
                                    <div class="prevnext_page">
                                        <p class="text" id="chartPage"></p>
                                    </div>
                                    <!-- &nbsp;&nbsp;<span id="chartNoticeGraph">* 연관 주제어에 대한 분석 결과 입니다.</span> -->
                                </div>
                            </div>
                            <div class="table_box" style="display:none">
                                <div class="search_cat">
                                    <a href="#" class="btn_cat_more" title="지식맵 연관어보기"><span class="blind">연관어보기</span></a>
                                    <ul class="more_cat_list"></ul>
                                </div>
                                <a href="#" class="btn_view_large" id="buttonPopupChart" title="지식맵 크게보기"></a>
                                <a href="#" class="btn_graph" title="지식맵 차트 보기"></a>
                                <div class="search_table_01"></div>
                                <div class="sc_page">
                                    <div class="prevnext_page">
                                        <p class="text" id="chartPage"></p>
                                    </div>
                                   <!--  &nbsp;&nbsp;<span id="chartNoticeTable">* 연관 주제어에 대한 분석 결과 입니다.</span> -->
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <script>
                $(function() {
                    initFlag = "Y";
                    checkResearchList();
                    $('#chartFlag').val('trend');
                    $('#chartListPage').val(1);
                    $('#chartListCount').val(2);
                });
            </script>
            <!-- end   : 인포그래픽 -->

            <div id="wrapper" class="briefList">
                <div class="searchOptions">
                    <div class="f-L">
                    
                    
                        <a href="#" class="searchOption1" onclick="fn_myLibrary('list');" title="내서재담기">내서재담기</a>
                        
	                        
	                            

	                            <!-- 서비스모드 -->
								
									
										<!-- <a href="#" class="searchOption2" onclick="javascript:loanBasketInsert('B');" title="열람예약신청목록담기">열람예약신청목록담기</a> -->
										<!-- <a href="#" class="searchOption2" onclick="javascript:loanBasketInsert('R');" title="야간이용신청목록담기">야간이용신청목록담기</a> -->
										
											
											
												<!-- <a href="#" class="searchOption2" onclick="javascript:alert('코로나19로 인하여 야간 개관은 실시하지 않습니다');" title="야간이용신청목록담기">야간이용신청목록담기(서울 본관)</a> -->
												<a href="#" class="searchOption2" onclick="javascript:loanBasketInsert('R');" title="야간이용신청목록담기">야간이용신청목록담기(서울 본관)</a>
											
										
									
									
								
	                            
	                            
	                            
	                            
	                        
                        
                        
                           
                                <a href="javascript:changeHanjaYnByList('N');" class="searchOption3" title="한자 한글변환">한자 한글변환</a>
                           
                           
                        
                    </div>
                    <div class="f-R">
                        <div class="chkAll">
                            <input type="checkbox" class="chk" id="chkAll" tabindex="-1"/>
                            <label for="chkAll" tabindex="0">전체선택</label>
                        </div>
                        
                            <a href="#" onclick="javascript:fn_export();" class="searchOption4" title="내보내기">내보내기</a>

                            
	                           
	                                <a href="#" onclick="javascript: fn_export_excel();" class="searchOption4" style="margin-left: 10px !important;" title="Excel 파일 전체 다운로드">Excel</a>
	                            	
	                           
	                           
	                        
                        
                    </div>
                </div>
                <div class="searchList">
                 
                 <div id="output">
                 <c:choose>
			<c:when test="${(count == 0) && (infoArr==null)}">
				<tr>
					<td>책이 없습니다.</td>					
				</tr>
			</c:when>
			<c:when test="${(count == 0) && (infoArr != null)}">
				<ol id = "asearch">
				<c:forEach var="list" items="${infoArr}">
					
					<li><fieldset ><p><h4>
						${list.book_title} / 
				<%-- 		<td><a href="./BoardViewAction.do?articleno=${list.articleno}&pagenum=<%=pagenum%>">${list.title}</a></td> --%>
						${list.author}</h4></p>
						<p>${list.publishing} |
						${list.room_name}</p></fieldset></li>
					
									
				</c:forEach>
				</ol>				
			</c:when>
			

			
		</c:choose>
                 
                 </div>
                 
                 
                </div>
                
                
                <!-- start : 페이징 -->
                
                    








    
    
        <div class="page">
            
            
            <ul>
            
                
                    <li><a class="num on" title="1">1</a></li>
                
                
            
            </ul>
            
            
        </div>
    


                
                <!-- end : 페이징 -->
                <!-- start : 표그림 DB -->
                
                <!-- END : 표그림 DB -->
            </div>
        </div>
    </section>
<input type="hidden" id="infographicDrMode" value="false">
    <!-- start : aside -->
  
    <!-- end   : aside -->

    <!-- start : 내서재 담기-->

    
<!-- 레이어팝업 : 내서재담기 -->
<div id="myLibrary2" class="modal">
	<div class="wrap">
		<div class="top">
			<h2>내서재에 담기</h2>
		</div>
		<div class="bottom">
			<ul>
				<li>
					<div class="tit">담을 곳</div>
					<div class="con">
						<form action="/mylist/insertitem.do" name="myListForm" id="myListForm" method="POST">
							<div id="itemInput"></div>
							<fieldset>
								<legend class="skip">내서재 담기</legend>
								<div class="ib">
									<label for="listNo" class="skip">새로운서재</label>
									<select id="listNo" name="listNo" title="새로운서재 선택" class="select2">
										<option value="0">새로운서재</option>
									</select>
								</div>
							</fieldset>
						</form>
					</div>
				</li>
			</ul>
			<div class="btnWrap">
				<input type="button" title="저장" value="저장" class="btnD btn3 save" />
				<input type="button" title="닫기" value="닫기" class="btnD btn4 close" />
			</div>
		</div>
	</div>
</div>

<!-- 레이어팝업 : 새로운서재 -->
<div id="favoriteLib" class="modal">
	<div class="wrap">
		<div class="top">
			<h2>새로운 서재</h2>
		</div>
		<div class="bottom">
			<p class="tr mb10 f14"><span class="red">*</span> 표시는 필수사항 입니다.</p>
			<div class="viewTable">
				<form action="/mylist/pop/insert.do" name="myListNewForm" id="myListNewForm" method="POST">
					<div id="itemInput"></div>
					<table class="tStyle2">
						<colgroup>
							<col width="20%">
							<col >
						</colgroup>
						<caption class="skip">내서재 추가 테이블로 서재, 실명, 공개수준으로 구성되어 있습니다.</caption>
						<tbody>
							<tr>
								<th scope="row"><span class="red">*</span> 서재</th>
								<td class="tl">
									<input type="text" name="listName" title="서재 입력창"/>
									<input type="hidden" name="chkOk" value="0"/>
									<a href="#" class="button" title="중복체크" id="btnChk">중복체크</a>
									<div id="resultMsg"></div>
								</td>
							</tr>
							<tr>
								<th scope="row">설명</th>
								<td class="tl">
									<input type="text" name="description" title="설명 입력창"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="red">*</span> 공개수준</th>
								<td class="tl">
									<input type="radio" name="listPrivacy" id="open2" value="3" checked="checked"/>
									<label for="open2">비공개</label>
									<input type="radio" name="listPrivacy" id="open1" value="1"/>
									<label for="open1">완전공개</label>
									<p id="msg" style="display:none;" class="red"> * 주의: 국회도서관 이용자 모두에게 공유서재로 서비스 됩니다.</p>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="btnWrap tc">
				<input type="button" title="저장" value="저장" class="btn newSave" />
				<input type="button" title="다시쓰기" value="다시쓰기" class="btn reset" />
			</div>
		</div>
	</div>
</div>

<!-- 확인 -->
<div id="alert" class="modal">
	<div class="wrap">
		<div class="top">
			<div class="img save">저장</div>
		</div>
		<div class="bottom">
			<p class="tc mb70">저장 되었습니다.</p>
			<div class="btnWrap tc">
				<a href="#close-modal" rel="modal:close" class="btn" title="닫기">닫기</a>
			</div>
		</div>
	</div>
</div>
    <!-- end   : 내서재 담기-->

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
				<input type="hidden" name="query" value="자바애플">
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

    <!-- start : 커버이미지 팝업  -->
    

<div id="coverImg" class="modal imgOriginal">
    <div class="wrap">
        <img src="" id="orgCoverImg" alt="표지이미지" />
    </div>
</div>
    <!-- end   : 커버이미지 팝업   -->

    <!-- start : 저자명참조 -->
    





<!-- 레이어팝업 : 저자명참조 -->
<div id="refAuthor" class="modal height">
    <div class="wrap">
        <div class="top">
            <h2>저자명 참조</h2>
        </div>
        <div class="bottom">
            <div class="selectWrap">
                <fieldset>
                    <legend class="skip">저자명 참조 검색</legend>
                    <div class="item">
                        <label for="inputName1">인명/단체명</label>
                        <input type="text"   class="inputText"      id="authorName" name="authorName" title="인명/단체명 입력창" onkeydown="if(event.keyCode == 13) insertSearchPopupLog('NADL', 'A');" />
                        <div class="authorNameAutocomplete" style="display: none;">
		                    <!--  ajax 데이터 처리 영역 -->
		                </div>

                        <input type="hidden" id="orderByFirst" value="start_date asc"/>
                        <input type="hidden" id="orderBySecond" value="book_cnt desc"/>
                        <input type="hidden" id="bookCntFirst" value="N"/>


                        <input type="button" class="btnD btn3 view" value="검색"  title="검색" onclick="insertSearchPopupLog('NADL', 'A');"/>
                        <input type="button" class="btnD btn3"      value="적용"  title="적용" onclick="applyRefAuthor();"/>
                    </div>
                </fieldset>
            </div>
            <div class="tableWrap">
                <form action="">
                    <fieldset>
                        <legend class="skip">저자명 참조 목록</legend>
                        <div class="tableBox">
	                        <table class="tStyle1 btNone" style="table-layout: fixed;">
	                            <caption class="skip">인명/단체명을 보여주는 테이블로 선택, 대표형, 생몰정보, 이형, 소속, 직위, 직업, 활동분야, 주기 순으로 되어있습니다.</caption>
	                            <colgroup>
	                                <col width="5%">
	                                <col width="11%">
	                                <col width="11%">
	                                <col width="11%">
	                                <col width="8%">
	                                <col width="8%">
	                                <col width="10%">
	                                <col width="12%">
	                                <col width="16%">
	                                <col width="8%">
	                            </colgroup>
	                            <thead>
	                                <tr>
	                                    <th scope="col"><label><input type="checkbox" title="전체선택" name="chk2" class="chk2" id="chk2All"  /></label></th>
	                                    <th scope="col">대표형(전거형, Authority)</th>
	                                    <th scope="col" id="authorTh0" class="authorOrderByTh" onclick="orderByChange(this,'start_date')"><p class="arrow on">생몰정보</p></th>
	                                    <th scope="col">이형(異形, Variant)</th>
	                                    <th scope="col" id="authorTh1" class="authorOrderByTh" onclick="orderByChange(this,'inst_name')"><p>소속</p></th>
	                                    <th scope="col" id="authorTh2" class="authorOrderByTh" onclick="orderByChange(this,'position')"><p>직위</p></th>
	                                    <th scope="col" id="authorTh3" class="authorOrderByTh" onclick="orderByChange(this,'job')"><p>직업</p></th>
	                                    <th scope="col" id="authorTh4" class="authorOrderByTh" onclick="orderByChange(this,'activity')"><p>활동분야</p></th>
	                                    <th scope="col" id="authorTh5" class="authorOrderByTh" onclick="orderByChange(this,'remark')"><p>주기</p></th>
	                                    <th scope="col" id="authorTh6" class="authorOrderByTh" onclick="orderByChange(this,'book_cnt')"><p>서지</p></th>
	                                </tr>
	                            </thead>
	                            <tbody id="AUTHOR_TBODY">
	                                <tr>
	                                    <td colspan="10" class="tc">인명/단체명을 입력하세요.</td>
	                                </tr>
	                            </tbody>
	                        </table>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
    <!-- end   : 저자명참조 -->

    <!-- start : 용어관계사전 -->
    






<!-- 레이어팝업 : 용어관계사전 -->
<div id="termDict" class="modal height">
    <div class="wrap">
        <div class="top">
            <h2>용어관계사전</h2>
        </div>
        <div class="bottom">
            <div class="selectWrap">
                <fieldset>
                    <legend class="skip">저자명 참조 검색</legend>
                    <div class="item">
                        <label for="matchLeft">검색종류</label>
                        <ul>
                            <li>
                                <input type="radio" id="matchSelf" name="match" value="self" />
                                <label for="matchSelf">완전일치</label>
                            </li>
                            <li>
                                <input type="radio" id="matchLeft" name="match" value="left" checked="checked" />
                                <label for="matchLeft">전방일치</label>
                            </li>
                            <li>
                                <input type="radio" id="matchRight" name="match" value="right" />
                                <label for="matchRight">후방일치</label>
                            </li>
                            <li>
                                <input type="radio" id="matchDouble" name="match" value="double" />
                                <label for="matchDouble">부분일치</label>
                            </li>
                        </ul>
                    </div>
                    <div class="item">
                        <label for="terms">용어명</label>
                        <input type="text"   class="inputText"      id="term"   name="term"   onkeydown="if(event.keyCode == 13) insertSearchPopupLog('NADL', 'T');" title="용어명 입력창"/>
                        <input type="hidden"                        id="termId" name="termId" value="" />
                        <input type="button" class="btnD btn3 view" title="검색" value="검색"               onclick="insertSearchPopupLog('NADL', 'T');"/>
                        <input type="button" class="btnD btn4"      title="다시쓰기" value="다시쓰기"            onclick="initThesaurusSearchCondition();"/>
                    </div>
                    <div class="searchInfo">
                         <div class="item">
                             <span class="tit">대표어</span>
                             <span class="con" id="representativeWord"></span>
                             <input type="button" id="btnRepresentativeWord" class="btnD btn3 mt2 ml10 dNone" onclick="applyThesaurus('REP');" title="적용" value="적용" />
                         </div>
                         <div class="item">
                             <span class="tit">외국어</span>
                             <span class="con" id="foreignLanguage"></span>
                         </div>
                         <div class="item">
                             <span class="tit naver">네이버 백과사전</span>
                             <span class="con" id="naverLibarayInfo"></span>
                         </div>
                     </div>
                </fieldset>
            </div>
            <div class="resultNone" id="thesaurusNoData">
            	<!-- <p>"<span>검색어</span>"에 대한 검색결과가 없습니다.</p> -->
            </div>
            <div class="dict" id="thesaurusList">
                <div class="tableWrap">
                    <div class="tableWrap">
	                    <form action="">
	                        <fieldset>
	                            <legend class="skip">용어관계사전</legend>
	                            <table class="tStyle1">
	                                <caption class="skip">용어관계사전 테이블로 대표어, 동의어, 상위어, 하위어, 관련어으로 구성 되어있습니다.</caption>
	                                <colgroup>
	                                    <col width="16.666%">
	                                    <col width="16.666%">
	                                    <col width="16.666%">
	                                    <col width="16.666%">
	                                    <col width="16.666%">
	                                    <col width="16.666%">
	                                </colgroup>
	                                <thead>
	                                    <tr>
	                                        <th scope="col" class="tl">
	                                            <input type="checkbox" class="chk3" id="chk3All" name="chk3" />
	                                            <label for="chk3All">대표어</label>
	                                        </th>
	                                        <th scope="col" class="tl">
	                                            <input type="checkbox" class="chk4" id="chk4All" name="chk4" />
	                                            <label for="chk4All">동의어</label>
	                                        </th>
	                                        <th scope="col" class="tl">
	                                            <input type="checkbox" class="chk5" id="chk5All" name="chk5" />
	                                            <label for="chk5All">상위어</label>
	                                        </th>
	                                        <th scope="col" class="tl">
	                                            <input type="checkbox" class="chk6" id="chk6All" name="chk6"/>
	                                            <label for="chk6All">하위어</label>
	                                        </th>
	                                        <th scope="col" class="tl">
	                                            <input type="checkbox" class="chk7" id="chk7All" name="chk7" />
	                                            <label for="chk7All">관련어</label>
	                                        </th>
	                                        <th scope="col" class="tl">
                                                <input type="checkbox" class="chk8" id="chk8All" name="chk8" />
                                                <label for="chk8All">대립어</label>
                                            </th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td class="tl">
	                                            <ul id="representativeItem"></ul>
	                                        </td>
	                                        <td class="tl">
	                                            <ul id="synonymItem"></ul>
	                                        </td>
	                                        <td class="tl">
	                                            <ul id="hyperonymItem"></ul>
	                                        </td>
	                                        <td class="tl">
	                                            <ul id="hyponymItem"></ul>
	                                        </td>
	                                        <td class="tl">
	                                            <ul id="relatedItem"></ul>
	                                        </td>
	                                        <td class="tl">
                                                <ul id="antonymItem"></ul>
                                            </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </fieldset>
	                    </form>
                    </div>
                </div>
            </div>
            <div id="btnThesaurusWord" class="btnWrap tc pt0 dNone">
            	<input type="button" class="btnD btn3 submit" onclick="applyThesaurus('ALL');" title="적용" value="적용" />
            	<a href="#close_modal" rel="modal:close" class="btnD btn4" title="닫기">닫기</a>
            </div>
            <div class="dlist">
                <h3>관련 기본어 리스트</h3>
                <ul id="wordItem"></ul>
            </div>
        </div>
    </div>
</div>
    <!-- end   : 용어관계사전 -->

    <!-- start : 표그림DB -->
    

<div id="refdImg" class="modal imgOriginal dbTableImage">
    <div class="wrap">
        <div class="bottom">
            <div class="imgBox">
                <img src="" id="orgREFDImg" onerror="thumbImageOnError(this)" alt="표그림 이미지" />
            </div>
            <div class="btnWrap">
                <a href="#none" id="viewPdfByREFDImg"       class="btnD btn3" style="display:none;" title="뷰어로 보기">뷰어로 보기</a>
                <a href="#none" id="viewOrgPdfByREFDImg"    class="btnD btn3" style="display:none;" title="출처 보기">출처 보기</a>
                <a href="#none" id="downloadExcelByREFDImg" class="btnD btn3" style="display:none;" title="엑셀 다운로드">엑셀 다운로드</a>

                <!--
                <a href="#none" class="btnD btn3" title="출처 보기">출처 보기</a>
                <a href="#none" class="btnD btn3" title="엑셀 다운로드">엑셀 다운로드</a>
                -->
            </div>
        </div>
    </div>
</div>
    <!-- end   : 표그림DB -->

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

    <!-- start : 권호기사 레이어 팝업  -->
    





<!-- 레이어팝업 : MARC -->
<div id="article" class="modal height">
    <div class="wrap">
        <div class="top">
            <h2>권호기사보기</h2>
        </div>
        <div class="bottom">
            <div class="tableWrap">
            	<table class="table tStyle1">
                    <caption class="skip">권호기사 목록 테이블로 기사명, 저자명, 페이지, 원문, 기사목차 순으로 되어있습니다.</caption>
                    <colgroup>
                        <col>
                        <col width="12%">
                        <col width="15%">
                        <col width="20%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">기사명</th>
                            <th scope="col">저자명</th>
                            <th scope="col" data-breakpoints="xs">페이지</th>
                            <th scope="col" data-breakpoints="xs sm">원문</th>
                            <th scope="col" data-breakpoints="xs sm md">기사목차</th>
                        </tr>
                    </thead>
                    <tbody id="articleContents">
						<!-- ajax 데이터 처리 -->
					</tbody>
                </table>
            </div>
        </div>
    </div>
</div>
    <!-- end   : 권호기사 레이어 팝업   -->

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

    <!-- start : ocr 관련 처리 -->

    <!-- end   : ocr 관련 처리 -->

<!-- 레이어팝업 : 안내확인 -->
<a href="#confirmPopup" rel="modal:open" class="btn" style="display:none;" id="confirmPopupOpenLink" title="확인"></a>
<div id="confirmPopup" class="modal alert line2">
	<div class="wrap">
		<div class="top">
			<h2>확인</h2>
		</div>
		<div class="bottom">
			<p class="mb30"></p>
			<div class="btnWrap tc">
				<a href="#close-modal" rel="modal:close" class="btnD btn4" title="닫기">닫기</a>
			</div>
		</div>
	</div>
</div>

<!-- 레이어팝업 : 로그인 -->
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
					<div class="item">
						<input type="hidden" id="searchPcItemRegNo" >
						<input type="hidden" id="searchPcBranchCode" >
						<input type="text" id="searchPcLoginId" title="아이디" placeholder="아이디" />
					</div>
					<div class="item">
						<input type="password" id="searchPcLoginPw" title="비밀번호" placeholder="비밀번호" onkeydown="if(event.keyCode == 13) searchPcLoginForReservationProc('loanReservation');" />
					</div>
					<div style="font-size: 14px; color: #4b4b4b; padding-bottom: 20px; display: none;" id="pwdErrorDiv">
						<p style="color: #ee145b;">아이디 또는 비밀번호를 확인해주세요</p>
					</div>
					<div class="item btn5">
						<input id="loanBasketLogin" type="button" value="로그인" title="로그인" onclick="javascript:searchPcLoginForReservationProc('loanReservation');"/>
						<input id="loanFailLogin" style="display:none;" type="button" title="로그인" value="로그인" onclick="javascript:searchPcLoginForReservationProc('loanFail');"/>
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


<script type="text/javascript">
//내서재 담기 팝업
function fn_myLibrary(type){

    var isLogin = '';
    if(!isLogin) {
        alert("로그인후 이용가능합니다.");
        return false;
    }

    if($("input:checkbox[name=chk]:checked").length < 1){
        alert("선택한 항목이 없습니다");
        return false;
    }

    var pDataId = new Array();
    $("input:checkbox[name=chk]:checked").each(function(i) {
        pDataId.push($(this).val());
    });

    jQuery.ajaxSettings.traditional=  true;

    $.ajax({
        type: "POST",
        url: "/mylist/pop/writeitem.do",
        data: {"data": pDataId},
        dataType: "json",
        success: function(data) {
        	previousFocus = document.activeElement;
            $("#myLibrary2").modal();

            $('#myLibrary2 #listNo').empty();
            $('#myLibrary2 #itemInput').empty();

            if(data != null){
                var content = "";
                var inputVal = "";
                for(var i=0; i<data.mylistList.length; i++){
                    content +=    '<option value=\"'+data.mylistList[i].listNo+'\">'+data.mylistList[i].listName+'</option>';
                }
                
                content +=    "<option value=\"0\">[새로운 서재 추가]</option>";
                
                for(var i=0; i<data.items.length; i++){
                    inputVal += "<input type=\"hidden\" name=\"item\" value="+data.items[i]+">";
                }
                $('#myLibrary2 #listNo').append(content);
                $('#myLibrary2 #itemInput').append(inputVal);
            }
        },
        error: function() {
            alert("basket input fail!");
        }
    });
}

//검색대 로그인 처리
function searchPcLoginForReservationProc(viewType){
	if($('#searchPcLoginId').val() == ''){
		alert('아이디를 입력해 주세요.');
		return;
	}
	if($('#searchPcLoginPw').val() == ''){
		alert('비밀번호를 입력해 주세요.');
		return;
	}

	if(viewType == 'loanFail'){
		$('#searchPcLoginPopup a.close-modal ').click();
	}if(viewType == 'loanReservation'){
		
		var param = {
				itemRegNo : $('#searchPcItemRegNo').val()
				,branchCode : $('#searchPcBranchCode').val()
				,userid : $('#searchPcLoginId').val()
				,password : $('#searchPcLoginPw').val()
		};
		
		$.ajax({
	        type: "POST",
	        url: "/loan/loanReservation.do",
	        data: param,
	        dataType: "json",
	        success: function(data) {
	        	if(data != null && data.error_msg == 'search.pc.not.login' ){
	        		$('#searchPcLoginPw').val('');
					$('#searchPcLoginId').val('');
// 	        		$('#pwdErrorDiv').show();
// 	        		alert('일치하는 사용자 정보가 없습니다.');
// 					$('#searchPcItemRegNo').val(data.itemRegNo);
// 					$('#searchPcBranchCode').val(data.branchCode);
					//검색대에서 열람 신청 시 실제 사용자 정보를 얻기 위한 로그인 처리 화면
// 					$('#searchPcLoginPopup a.close-modal ').click();
// 					$('#searchPcLoginPopup').click();
	        	}else if(data != null && data.error_msg == 'search.pc.check.idpwd' ){
	        		$('#searchPcLoginPw').val('');
					$('#searchPcLoginId').val('');
	        		$('#pwdErrorDiv').show();
// 	        		alert('일치하는 사용자 정보가 없습니다.');
// 					$('#searchPcItemRegNo').val(data.itemRegNo);
// 					$('#searchPcBranchCode').val(data.branchCode);
					//검색대에서 열람 신청 시 실제 사용자 정보를 얻기 위한 로그인 처리 화면
// 					$('#searchPcLoginPopup a.close-modal ').click();
// 					$('#searchPcLoginPopup').click();
					
				}else{
					var msg_type_code = null;
					var msg_content = null;
					var msg_name = null;
					if(null != data.message){
						msg_type_code = data.message[0].msg_type_code;
						msg_content = data.message[0].msg_content;
						msg_name = data.message[0].msg_name;
					}else{
						msg_name = data.error_msg;
					}

					if(msg_name == null){
						$('#confirmPopup p.mb30').text(msg_content);
					}else{
						$('#confirmPopup p.mb30').text(msg_name);
					}
					$('#searchPcLoginPopup a.close-modal ').click();
					$('#confirmPopupOpenLink').click();
					
				}
	        },
	        error: function() {
	            alert("e");
	        }
	    });
	}
}
</script>

<script type="text/javascript" defer='defer'>
	/* CLICKZONE SCRIPT V.V.4 *//*X*//* COPYRIGHT 2002-2020 BIZSPRING INC. *//*X*//* DO NOT MODIFY THIS SCRIPT. *//*X*/var _CZN="26";
</script>
<script type='text/javascript' defer="defer" src="https://webstat.nanet.go.kr/InsightTrk/js/InsightClickZone.js"></script>

</div><!-- start : contents  --><!-- 모바일 하단 메뉴 -->
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


	<div id="output"></div>

</body>
</html>

