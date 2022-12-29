<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="usermadang.board.model.FreeboardDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
   

<% 	 
	String sessionId = (String) session.getAttribute("sessionId");
	FreeboardDAO dao = FreeboardDAO.getInstance();
	String member_name = (String) session.getAttribute("sessionName");
%> 
    
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="icon" href="/images/logo/favicon.png" sizes="16x16" />
        
        <title>국회도서관</title>
        <script src="resource/js/jquery-1.11.2.min.js"></script>
        <script src="resource/js/jquery.bxslider.min.js"></script>
        <script type="text/javascript" src="/resource/js/nanet.autocomplete.js"></script>
        <link href="resource/css/welcome.css" rel="stylesheet">
        <link href="resource/css/fonts.css" rel="stylesheet">
    </head>
    <body>
    <form name="headerForm"	id="headerForm"	method="post">
        <input type="hidden" name="ret_url" value="" />
        <input type="hidden" name="inter_system" value="" />
        <input type="hidden" name="system" value="" />
        <input type="hidden" name="retURL" value="" />
        <input type="hidden" name="deviceType" id ="deviceType"/>
    </form>    
    <!-- 슬라이드 -->
    <div class="classy">
        <ul class="bxslider">
            
                <li style="background-image: url('https://www.nanet.go.kr/attachfiles/welcome/1670997250811.jpg');">
                    <p class="ex">12월 국회도서관 중앙홀</p>
                </li>
            
                <li style="background-image: url('https://www.nanet.go.kr/attachfiles/welcome/1670997323582.jpg');">
                    <p class="ex">국회도서관 겨울 전경</p>
                </li>
            
                <li style="background-image: url('https://www.nanet.go.kr/attachfiles/welcome/1646020966082.jpg');">
                    <p class="ex">국회도서실 설치에 관한 결의안</p>
                </li>
            
                <li style="background-image: url('https://www.nanet.go.kr/attachfiles/welcome/1663315957448.jpg');">
                    <p class="ex">국회도서관 모바일 간편출입증</p>
                </li>
        </ul>
    </div>
    <!-- //슬라이드 -->
    
    <div class="introWrap">
        <div class="header">
            <div class="logo"><a href="http://localhost:8080/nal" title="메인페이지로 이동"><img src="resource/images/logo_white.png" alt="국회도서관 로고"/></a></div>
            <!-- <div class="btn_menu"><a href="#"><img src="/resource/images/btn_hambuger_white.png" alt="메뉴"/></a></div> -->
            <div class="menu">
                <!-- <div class="dim"></div> -->
                <ul>
                    <!-- <li class="close"><a href="#"><img src="/resource/images/btn_close_white.png" alt="닫기"/></a></li> -->
                    <li>입법서비스</li>
                    <li>책이야기</li>
                    <li><a href="./freeBoardList.do">이용자마당</a></li>
                    <li class="last"><a href="./GuideServlet">도서관소개</a></li>
                    <!-- <li class="home"><a href="/main.do">국회도서관 홈</a></li> -->
                </ul>
            </div>
        </div>

        <div class="contents">
            <div class="cell">
                <p style="font-weight: bold; color: #ffffff;
                         ">초대합니다. 국민여러분!</p>
                <div class="searchForm">
                    <form method="get" name="mainsearch" id="mainsearch" data-ajax="false">
                        <!-- 20190219 추가 -->
                        
                        <fieldset>
                            
                            <input type="hidden" id="queryText" name="queryText" />
                            
                        </fieldset>
                        <input type="text" id="mainkey" name="mainkey" value="" title="검색어 입력" onkeydown="javascript:if(event.keyCode == 13) pushSearch();" autocomplete="off" />
                        <a href="#none" onclick="openMultiLanguage();" class="btn_lang" title="새창 열림">다국어 입력기</a>
                        <a class="searchBottom" onclick="pushSearch();" href="#none"><img src="resource/images/btn_search_white.png" alt="검색"></a>
                    </form>
                </div>
                <div id="autoLayer" style="display: none;">
                    <ul class="newly"></ul>
                </div>
            </div>
        </div>
        <div class="linkArea">
            <ul>
                
                    
                        
                <c:choose>
                
                <c:when test = "${sessionScope.sessionId == null}">
                
                <li class="login" >
                	<a href="./login.do">로그인</a>
                	</li>
                </c:when>
                
                
	         
				<c:otherwise >
                  <li class="login">
                  <a href="#"><%=member_name%>님!</a>
                  
                  </li> <!-- 로그인 시, 노출 -->
                 </c:otherwise>
				
			</c:choose>
                        
                        
                        
                        
                        
                    
                    
               
                <li class="closeday"><a href="http://localhost:8080/nal">휴관일 안내</a></li>
                <li class="notice"><a href="./freeBoardList.do">자유게시판</a></li>
                <li class="map"><a href="./GuideServlet">도서관소개</a></li>
                <li class="help"><a href="http://localhost:8080/nal">물어보세요</a></li>
            </ul>
        </div>
    </div>
    
    <script type="text/javascript" src="/js/bs_trk.js"></script>
    <script type="text/javascript">
        
        // getCookie
        function getCookie(name){
            var allCookies = decodeURIComponent(document.cookie);
            var strCnt = name.length;
            var pos = allCookies.indexOf(name+"=");
        
            if(pos == -1) return undefined;
        
            var start = pos + strCnt+1;
            var end = allCookies.indexOf(";", start);
            if(end == -1) end = allCookies.length;
            var value = allCookies.substring(start, end);
            return value = decodeURIComponent(value);
        }
            
            if(getCookie("isTodayClose") != "Y" ){
                //window.open('/main/popupNotice.do','mainPopup','width=407,height=710');
        } 
        
        $(document).ready(function() { 	
               
            access_log();
    
            //[start] 퍼블
            $('.bxslider').bxSlider({
                mode : 'fade',
                auto: true,
                pause: 5000,
                controls: false
            });
            var windowWidth = $(window).width(),
                windowHeight = $(window).height(),
                adjHeight = windowHeight;
            $('.classy').css({
                'width': windowWidth + 'px',
                'height': adjHeight + 'px'
            });
            $(".introWrap .linkArea").hover(function(){
                var mobileW = window.outerWidth;
                var $linkArea =  $(this);
    
                if(mobileW > 1023){
                    if($linkArea.css("right")=="-150px"){
                        $linkArea.animate({
                            right: '0'
                        },800)
                    }else{
                        $linkArea.animate({
                            right: '-150'
                        },800)
                    }
                }
            });
            $(".close").click(function(){
                $(".menu").hide();
            });
            $(".btn_menu").click(function(){
                $(".menu").show();
            });
            //[end] 퍼블
    
            // DR
            // [start] 검색어 자동완성 2020.12.18
            $('#query').on('input', function(){
                var keyword = $(this).val();
                
    //             if(keyword.length > 1){
                if(keyword.length >= 1){
                    $('#autoLayer > ul > li').remove();
                    var url = '/main/ajaxAutoKeywordSearch2.do';
                    var innerHtml = '';
    
                    $.ajax({
                        type: 'POST',
                        async: false,
                        url: url,
                        data: 'q=' + keyword,
                        success: function(data){
                            if(data.data[0].list.length > 0){
                                for(var i=0; i<data.data[0].list.length; i++){
                                    var tempKeyword = data.data[0].list[i].DP_TITLE_FULL;
                                    innerHtml += "<li id='"+i+"'><a href='#'>" + tempKeyword + "</a></li>";
                                }
                                $("#autoLayer > ul").append(innerHtml);
                                $("#autoLayer").show();
                            }
                        },
                        error: function(data, status, err){
                            console.log('auto keyword error');
                        }
                    });
                }
            });
            // [end]
    
            /* --X
            $("#query").on("input", function() {
                var keyword = $(this).val();
    
                if (keyword.length > 1) {
                    $("#autoLayer > ul > li").remove();
                    var innerHtml = "";
    
                    $.ajax({
                        type: "post"
                        , async: false
                        , dataType: "json"
                        , url: '/main/ajaxAutoKeywordSearch2.do'
                        , data: "sel=ALL"+"&q="+keyword+"&qu="+keyword
                        , success: function(resultData) {
                            if(resultData.data.length > 0){
                                for(var i = 0; i < resultData.data.length; i++){
                                    var tempKeyword = resultData.data[i].keyword;
                                    innerHtml += "<li id='"+i+"'><a href='#'>" + tempKeyword + "</a></li>";
                                }
                                $("#autoLayer > ul").append(innerHtml);
                                $("#autoLayer").show();
                            }
                        }, error: function(data, status, err) {
                            alert("서버와의 통신이 실패했습니다.");
                        }
                    });
                }
            });*/
    
            $(document).click(function(){
                $("#autoLayer").hide();
            });
    
            // 자동완성 목록 클릭 이벤트 주입
            $(document).on("click", "#autoLayer  ul  li ", function(e) {
                e.preventDefault();
                $("#query").val($(this).text());
                $(".searchBottom").click();
            });
            // [end] 검색어 자동완성
    
            // chat bot
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
    
        $(window).resize(function() {
            var windowWidth = $(window).width(),
                windowHeight = $(window).height(),
                adjHeight = windowHeight;
            $('.classy').css({
                'width': windowWidth + 'px',
                'height': adjHeight + 'px'
            });
            $('.classy video').css({
                'min-width': windowWidth + 'px',
                'min-height': adjHeight + 'px'
            });
        });
    
    
        // 접근로그
        function access_log(){
            var access_type = "PC";
            if(navigator.userAgent.toLowerCase().search('mobile') > -1){
                access_type = "MOBILE";
            }
            $.ajax({
                type: "post"
                ,async: false
                ,dataType: "json"
                ,data : {accessType : access_type}
                ,url: '/main/insertAccessLog.do'
                ,success: function(resultData) {
    
                }
                ,error: function(data, status, err) {
    
                }
            });
        }
    
        function isValid(){
            var keyWord = $("#query").val();
            if (keyWord == "") {
                alert("검색어를 입력하세요.");
                $("#query").focus();
                return false;
            }
            return true;
        }
    
        function goSearch(){
            var form = document.mainVO;
            
    //         if(form.query.value != null && form.query.value.length > 1){
            if(form.query.value != null && form.query.value.length >= 1){        	
                if (form.query.value.indexOf('?') > -1)
                    form.query.value = form.query.value.replace(/\?/g, '');
    
                var obj = form.query.value;
                if (obj.substring(0, 1) == '*')
                    form.query.value = form.query.value.substring(1, obj.length - 1);
    
                if (form.query.value != ""){
                    var searchQueryValue = encodeURI(form.query.value);
                    var uagent = navigator.userAgent.toLowerCase();
    
                    var iosStoreUrl = "http://itunes.apple.com/kr/app/gughoe-jeonjadoseogwan/id995150111?mt=8";
                    var androidStoreUrl = "market://details?id=kr.go.nanet.mdl";
                    var openAt = new Date; // 현재 시간 체크
                    var param = "?Text="+searchQueryValue+"&dbDiv=ALL&zone=ALL_NI_TOC&pageSize=10&currentPage=1&totalDocs=0&selCate=ALL&flagweb=Y";
                    if (uagent.indexOf('iphone') > -1 || uagent.indexOf('ipad') > -1 || uagent.indexOf('ipod') > -1){
                        // 일정시간 후 앱스토어 연결
                        setTimeout(function() {
                            if (new Date - openAt < 2500)
    // 		 				    	location.href = iosStoreUrl;
    // 		 				    	$("#mainVO").attr("target","_blank");
    // 		 			    		$("#mainVO").attr("action", "http://mdl.nanet.go.kr:7000/mobile/freeSearchListNew.do" + "?Text="+searchQueryValue);
    // 		 			    		$("#mainVO").submit();
                                location.href = "https://dl.nanet.go.kr/search/searchInnerList.do?queryText=" + obj + ':ALL_NI_TOC:AND';
                        }, 1500); // 1.5초 후
    
                        try{
                            location.href = "Nviewer://jsCall?Function=searchCall&searchWord=" + searchQueryValue;
                        }catch(e){
                            $("#frame").attr("src", "mdlapp://?Function=searchCall&searchWord=" + searchQueryValue);
                        }
    
                    }
                    else if (uagent.indexOf('android') > -1){
                        // 일정시간 후 플레이스토어 연결
                        setTimeout(function(e) {
                            if (new Date - openAt < 2500)
    // 								location.href = androidStoreUrl;
                                location.href = "https://dl.nanet.go.kr/search/searchInnerList.do?queryText=" + obj + ':ALL_NI_TOC:AND';
                        }, 1000); // 1초 후
                        //
                        try{
                            location.href = "mdlapp://?Function=searchCall&searchWord=" + searchQueryValue;
                        }catch(e){
                            $("#frame").attr("src", "mdlapp://?Function=searchCall&searchWord=" + searchQueryValue);
    
                        }
    
                    }else{ // Default : 안드로이드
                        // 일정시간 후 플레이스토어 연결
                        setTimeout(function() {
                            if (new Date - openAt < 2500)
    // 								location.href = androidStoreUrl;
                                location.href = "https://dl.nanet.go.kr/search/searchInnerList.do?queryText=" + obj + ':ALL_NI_TOC:AND';
                        }, 1000); // 1초 후
                        try{
                            location.href = "mdlapp://?Function=searchCall&searchWord=" + searchQueryValue;
                        }catch(e){
                            $("#frame").attr("src", "mdlapp://?Function=searchCall&searchWord=" + searchQueryValue);
                        }
                    }
    
                }else
                    alert('검색어를 입력하세요.');
                    $("#query").focus();
            }else{
    //         	alert('검색어는 2글자 이상 입력하셔야 합니다.');
                alert('검색어를 입력하세요.');
                $("#query").focus();
            }
                
        }
    
        function checkValue(obj, event){
            if(event.keyCode == 13){
                goSearch();
                return;
            }
    
            if(obj.indexOf('?') > -1){
                obj = obj.replace(/\?/g, '');
                document.mainVO.query.value = obj;
            }else if(obj.substring(0, 1) == '*'){
                obj = obj.substring(1, obj.length - 1);
                document.mainVO.query.value = obj;
            }
        }
    
        function librarySearch(event){
    
            if(event){
                try{
                    event.stopPropagation();
                    event.preventDefault();
                }catch(e){
                    event.returnValue = false;
                }
            }
    
            $('#query').val( fn_removeSpecialChar($('#query').val()) );
    
            if(navigator.userAgent.toLowerCase().search('mobile') > -1)
            {
                goSearch();
            }
            else
            {
    // 	    	if(isValid()){
    // 	    		if(navigator.userAgent.toLowerCase().search('trident') > -1){
    // 	    			var win = window.open('','dl_popup');
    // 	    			setTimeout(function(){
    // 	    				$("#mainVO").attr("target","dl_popup");
    // 				    	$("#mainVO").attr("action", "https://dl.nanet.go.kr/search/searchInnerList.do");
    // 				    	$("#mainVO").submit();
    // 	    			},500);
    // 	    		}else{
    // 			    	$("#mainVO").attr("target","_blank");
    // 			    	$("#mainVO").attr("action", "https://dl.nanet.go.kr/search/searchInnerList.do");
    // 			    	$("#mainVO").submit();
    // 	    		}
    // 	    	}
    
                //검색 로그
                _trk_clickTrace("EVT", "전자도서관 검색");
                /* 20180113 수정
                $("#mainVO").attr("target","_blank");
                $("#mainVO").attr("action", "http://dl.nanet.go.kr/SearchList.do" + "?query="+encodeURI($('#query').val())+"&homepageSearchYn=Y&source=https://www.nanet.go.kr");
                */
    
    
                //20181128 추가 직원 시작
                var ccd = '';
                var id = '';
                var pwd = '';
    
                //20200512 운영
                /*var urlAction = "http://dl.nanet.go.kr/tsch/list.do"; //직원이 아닐때..*/
                var urlAction = "https://dl.nanet.go.kr/search/searchInnerList.do"; //직원이 아닐때..J
                //20200512 개발
                /*var urlAction = "http://dl-dev2.nanet.go.kr/SearchList.do"; //직원이 아닐때..*/
    
                if(ccd == "E"){ //직원로그인
                    $("#emp_id").val(id);
                    $("#emp_pw").val(pwd);
                    $("#emp_yn").val('Y');
    
                    //20200512 운영
                    urlAction = "https://dl.nanet.go.kr/search/searchInnerList.do"; //직원일때..
                    //20200512 개발
                    /*urlAction = "http://dl-dev2.nanet.go.kr/SearchList.do"; //직원이 아닐때..*/
                }
                //20181128 추가 직원 끝
    
                var queryText = $('#query').val();
                
                if(queryText == ""){
                    alert('검색어를 입력하세요.');
                    $('#query').focus();
                    return false;
                }
                
                $("#queryText").val(queryText + ':ALL_NI_TOC:AND');
    
    // 	    	$("#mainVO").attr("action", "http://dl.nanet.go.kr/tsch/list.do" + "?query="+encodeURI($('#query').val())+"&homepageSearchYn=Y&source=https://www.nanet.go.kr");
    // 	    	$("#mainVO").attr("action", "http://dl.nanet.go.kr/tsch/list.do" );
    // 	    	$("#mainVO").attr("action", "http://dl.nanet.go.kr/tsch/list.do" ); //운영
    
                $("#mainVO").attr("target","_blank");
                $("#mainVO").attr("action", urlAction );
                $("#mainVO").submit();
    
            }
    
            return false;
        }
    
        /*
         * 자취통감 전자도서관 검색
         */
        function oldlibrarySearch(cn){
            $("#query").val(cn);
            if(navigator.userAgent.toLowerCase().search('mobile') > -1)
            {
                goSearch();
            }
            else
            {
                if(isValid()){
                    $("#mainVO").attr("target","_blank");
                    $("#mainVO").attr("action", "http://dl.nanet.go.kr/SearchDetailView.do?cn="+cn+"&sysid=nadl").submit();
                }
            }
            $("#query").val("");
        }
    
        function fn_removeSpecialChar(str){
            if (str == null) {
                return "";
            }
    
            try {
                var ch = '';
                for (var i = 0; i < str.length;) {
                    ch = str.charAt(i).charCodeAt();
    
                    if ((ch >= 33 && ch <= 47) || (ch >= 58 && ch <= 64)
                        || (ch >= 91 && ch <= 96) || (ch >= 123 && ch <= 126)) {
    
                        str = str.substr(0,i) + str.substr(i+1);
    
                        i = 0;
                    } else {
                        i++;
                    }
                }
    
            } catch (e) {
    
            }
    
            return str;
        }
    
        //다국어입력기
        function openMultiLanguage(){
            window.open("/html/popup_multi_language.html","multiLanguagaePopup","width=600,height=420");
        }
    
        var tip_box_id;
    
        function DisplayTip(me,content,width) {
            var tipO = me;
            var offX = getOffsetLeft(me);
            var offY = getOffsetTop(me);
            tip_box_id = document.getElementById('TipBox');
            tip_box_id.style.left = String(parseInt(offX) + 20 + 'px');
            tip_box_id.style.top = String(parseInt(offY) - 40 + 'px');
            tip_box_id.style.width = width + 'px';
            tip_box_id.innerHTML = content;
            tip_box_id.style.display = "block";
            tipO.onmouseout = HideTip;
        } // function DisplayTip()
    
        function HideTip() { document.getElementById('TipBox').style.display = "none"; }
    
        function getOffsetLeft(target){
            var left = 0;
            if(target.offsetParent){
                left += getOffsetLeft(target.offsetParent);
            }
            return left + target.offsetLeft;
        }
    
        function getOffsetTop(target){
            var top = 0;
            if(target.offsetParent){
                top += getOffsetTop(target.offsetParent);
            }
            return top + target.offsetTop;
        }
    
    
        function logout(){
            if(confirm("로그아웃을 하시겠습니까?")){
                if('null' == "Y"){
                    document.headerForm.action="/nexess/sso/sloExe.jsp?RelayState=/logout.do";
                }else{
                    document.headerForm.action="/logout.do";
                }
                document.headerForm.submit();
            }
        }
        
        function docsLogout(){
            if(confirm("로그아웃을 하시겠습니까?")){
                document.headerForm.action="/logout.do";
                document.headerForm.submit();
            }
        }
        
    </script>
    
    <script>
	function pushSearch() {
		$("#mainsearch").attr("method", "post");
		$("#mainsearch").attr("action", "./main.nal").submit();
	}
	</script>
    <!-- [start] 접속 로그 -->
    <script type="text/javascript">
    
        //컨텐츠 경로 구분 값(전체페이지 공통)
        var _TRK_CP = "";
        var TEXT = "";
        /*
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
    */
    
    
    
    
    
        
    
    
    
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
    
    <script type="text/javascript" defer='defer'>/* CLICKZONE SCRIPT V.V.4 *//*X*//* COPYRIGHT 2002-2020 BIZSPRING INC. *//*X*//* DO NOT MODIFY THIS SCRIPT. *//*X*/
    
    
        var _CZN = "24"; //운영서버 : 10
    
    </script>
    <script type='text/javascript' defer="defer" src="https://webstat.nanet.go.kr/InsightTrk/js/InsightClickZone.js"></script>
    <!-- [end] 접속 로그 -->
    
    </body>
    </html>