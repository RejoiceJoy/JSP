$(document).ready(function () {
    tabList(); // 메인 팝업존
});
 
// GNB
function gnbMenu() {

//	if(arguments.length>0){
//		$("#gnb .menu"+arguments[0]+" h2 a").attr("class","active");
//	}
//	
//	var menu = $("#gnb > ul.parent > li > h2 > a");
//    var menuSub = $("#gnb > ul.parent > li > ul.subMenu");
//    var gnbBackground = $(".gnbBackground");
//    
//    $(menu).on("mouseenter focus", function () {    
//        $(menuSub).stop(true, true).css({ 'opacity': '1' }).slideDown(100);
//        $(gnbBackground).stop(true, true).css({ 'opacity': '1' }).slideDown(100);
//    });
//
//    $("#header .headerNemoTop").on("mouseenter focus", function () {
//        $(menuSub).stop(true, true).css({ 'opacity': '1' }).slideUp(100);
//        $(gnbBackground).stop(true, true).css({ 'opacity': '1' }).slideUp(100);
//
//    });
//
//    $("#content").on("mouseenter focus", function () {
//        $(menuSub).stop(true, true).css({ 'opacity': '1' }).slideUp(100);
//        $(gnbBackground).stop(true, true).css({ 'opacity': '1' }).slideUp(100);
//
//    });

//    $("#gnb ul.parent li.menu07 ul.subMenu li:last a").on("mouseout blur", function () {
//        $(menuSub).stop(true, true).css({ 'opacity': '1' }).slideUp(100);
//        $(gnbBackground).stop(true, true).css({ 'opacity': '1' }).slideUp(100);
//
//    });
    
}


// 사이드바 메뉴
function snbMenu() {

	if(arguments.length == 1){
		$("#sideBar .menu_sub"+arguments[0]).addClass("active");	
	}else if(arguments.length==2){
		$("#sideBar .menu_sub"+arguments[0]).addClass("active");
		$("#sideBar .menu_sub"+arguments[0]+arguments[1]+" a").addClass("active");
	}else if(arguments.length==3){
		$("#sideBar .menu_sub"+arguments[0]).addClass("class","active");
		$("#sideBar .menu_sub"+arguments[0]+arguments[1]+" a").addClass("active");
		$("#sideBar .menu_sub"+arguments[0]+arguments[1]+arguments[2] + " a").addClass("active");
	}

    var menu = $("#sideBar > ul.snbulParent > li > h3 > a");
    var menuSub = $("#sideBar > ul.snbulParent > li >  ul.snbUlChirdren");
    var menuSubActiveTitle = $("#sideBar ul.snbulParent li.active h3 a");
    var menuSubActive = $("#sideBar ul.snbulParent > li.active");
    var menuBg = $("#sideBar > ul.snbulParent > li > h3 > a");

    $(menuSub).css("display", "none");
    $(menuSubActive).children("ul").css("display", "block");
    $(menuSubActiveTitle).addClass("sideBarTitleBg");
    
    $(menu).on("click", function () {
		if($(this).parent().parent().find(".snbUlChirdren").size()>0){
			$(this).parent().stop().siblings().slideToggle("fast");
			$(this).toggleClass("sideBarTitleBg");
			return false;
		}
    });
}




// 1-4 페이지 : 모바일 화면에서 검색항목 열기
function mobileSearchOpenBtn() {
    var btn = $(".listSelectArea1 .btn a");

    $(btn).on("click", function (e) {
        e.preventDefault();
        //$(".listSelectArea1 .selectRightBox .rightAlign").toggleClass("blockBox");
        
        var box = $(".listSelectArea1 .selectRightBox .rightAlign");
        if ($(box).is(".blockBox")) {
            $(box).removeClass("blockBox");
        } else {
            $(box).addClass("blockBox");
        }
        
        $(this).toggleClass("hover");

        if ($(btn).is(".closeTxt")) {
            $(btn).removeClass("closeTxt").text("검색항목 열기");
        } else {
            $(btn).addClass("closeTxt").text("검색항목 접기");
        }

    });
}


function mobileSearchOpenBtn009() {
    var btn = $(".listSelectArea009 .btn a");

    $(btn).on("click", function (e) {
        e.preventDefault();
        //$(".listSelectArea1 .selectRightBox .rightAlign").toggleClass("blockBox");
        
        var box = $(".listSelectArea009 .selectRightBox .rightAlign");
        if ($(box).is(".blockBox")) {
            $(box).removeClass("blockBox");
        } else {
            $(box).addClass("blockBox");
        }
        
        $(this).toggleClass("hover");

        if ($(btn).is(".closeTxt")) {
            $(btn).removeClass("closeTxt").text("도서관이용");
        } else {
            $(btn).addClass("closeTxt").text("도서관이용");
        }

    });
}


//모바일 화면에서 전체 열기3
function mobileSearchOpenBtn3() {
 var btn = $(".oneLineBoxWrap .btn a");

 $(btn).on("click", function (e) {
     e.preventDefault();
     //$(".oneLineBoxWrap .selectRightBox .rightAlign").toggleClass("blockBox");

     var box = $(".oneLineBoxWrap .selectRightBox .rightAlign");
     if ($(box).is(".blockBox")) {
         $(box).removeClass("blockBox");
     } else {
         $(box).addClass("blockBox");
     }

     
     $(this).toggleClass("hover");

     if ($(btn).is(".closeTxt")) {
         $(btn).removeClass("closeTxt").text("검색항목 열기");
     } else {
         $(btn).addClass("closeTxt").text("검색항목 접기");
     }
 });
 
 var box = $(".oneLineBoxWrap .selectRightBox .rightAlign");
 $(".mSearchBtn input").on("click",function(){
 	$(box).addClass("blockBox");
 });
}




//모바일 화면에서 전체 열기2
function mobileSearchOpenBtn2() {
 var btn = $(".listSelectArea2 .btn a");

 $(btn).on("click", function (e) {
     e.preventDefault();
     //$(".listSelectArea2 .selectRightBox .rightAlign").toggleClass("blockBox");

     var box = $(".listSelectArea2 .selectRightBox .rightAlign");
     if ($(box).is(".blockBox")) {
         $(box).removeClass("blockBox");
     } else {
         $(box).addClass("blockBox");
     }

     
     $(this).toggleClass("hover");

     if ($(btn).is(".closeTxt")) {
         $(btn).removeClass("closeTxt").text("전체");
     } else {
         $(btn).addClass("closeTxt").text("전체");
     }

 });
}


//시각장애인용 컴퓨터
function mobileSearchOpenBtn10() {
    var btn = $(".listSelectArea10 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea10 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

//시각장애인용 노트북
function mobileSearchOpenBtn11() {
    var btn = $(".listSelectArea11 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea11 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

//점자프린터
function mobileSearchOpenBtn12() {
    var btn = $(".listSelectArea12 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea12 .selectRightBox .rightAlign").toggleClass("blockBox");

    });
}

//스캐너와 프린터
function mobileSearchOpenBtn13() {
    var btn = $(".listSelectArea13 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea13 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

//스캐너와 프린터
function mobileSearchOpenBtn14() {
    var btn = $(".listSelectArea14 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea14 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

//스크린리더 [Sense Reader]
function mobileSearchOpenBtn15() {
    var btn = $(".listSelectArea15 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea15 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

//약시자용 확대키보드
function mobileSearchOpenBtn16() {
    var btn = $(".listSelectArea16 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea16 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

//문자인식프로그램 아르미6.0
function mobileSearchOpenBtn17() {
    var btn = $(".listSelectArea17 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea17 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

//화면확대 프로그램 [Zoom Text]
function mobileSearchOpenBtn18() {
    var btn = $(".listSelectArea18 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea18 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}





function mobileSearchOpenBtn19() {
    var btn = $(".listSelectArea19 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea19 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn20() {
    var btn = $(".listSelectArea20 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea20 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn21() {
    var btn = $(".listSelectArea21 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea21 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn22() {
    var btn = $(".listSelectArea22 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea22 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn23() {
    var btn = $(".listSelectArea23 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea23 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn24() {
    var btn = $(".listSelectArea24 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea24 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn25() {
    var btn = $(".listSelectArea25 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea25 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn26() {
    var btn = $(".listSelectArea26 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea26 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn27() {
    var btn = $(".listSelectArea27 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea27 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn28() {
    var btn = $(".listSelectArea28 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea28 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn29() {
    var btn = $(".listSelectArea29 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea29 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}
function mobileSearchOpenBtn30() {
    var btn = $(".listSelectArea30 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea30 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn31() {
    var btn = $(".listSelectArea31 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea31 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn32() {
    var btn = $(".listSelectArea32 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea32 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn33() {
    var btn = $(".listSelectArea33 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea33 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}

function mobileSearchOpenBtn34() {
    var btn = $(".listSelectArea34 .btn a");
    $(btn).on("click", function (e) {
        e.preventDefault();
        $(".listSelectArea34 .selectRightBox .rightAlign").toggleClass("blockBox");
        $(this).toggleClass("hover");
    });
}
//공지사항, 보도자료, 채용공지 
function tabList() {
    var menu01 = $(".smallTabList > ul.parent > li.titleList01 > h3 > a");
    var menu02 = $(".smallTabList > ul.parent > li.titleList02 > h3 > a");
    var menu03 = $(".smallTabList > ul.parent > li.titleList03 > h3 > a");
    var menu01Con01 = $(".smallTabList > ul.parent > li.titleList01 > .tabCon01");
    var menu02Con01 = $(".smallTabList > ul.parent > li.titleList02 > .tabCon01");
    var menu03Con01 = $(".smallTabList > ul.parent > li.titleList03 > .tabCon01");

    $(menu01).addClass("maintabMenuOn");
    $(menu01Con01).css("display", "block");

    //공지사항
    $(menu01).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("maintabMenuOn");
        $(menu02).removeClass("maintabMenuOn");
        $(menu03).removeClass("maintabMenuOn");

        $(menu01Con01).css("display", "block");
        $(menu02Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
    });

    //보도자료
    $(menu02).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("maintabMenuOn");
        $(menu01).removeClass("maintabMenuOn");
        $(menu03).removeClass("maintabMenuOn");

        $(menu02Con01).css("display", "block");
        $(menu01Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
        
        if($(menu02Con01).children().length == 0)
        {
	        $.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/main/ajaxSelectBodoList.do'
				, success: function(resultData) {
					
					var resultValue = '';
					resultValue += '    <div class="topBox">';
					resultValue += '    	<ul class="subUl">';
					for(i = 0; i < resultData.data.length; i++)
					{
					resultValue += '		 	<li>';
					resultValue += '		 		<a href="javascript:listView(\'7\');" title="' + resultData.data[i].title + '">' + resultData.data[i].title + '</a>';
					resultValue += '		 	</li>';
					}		 	
					resultValue += '		</ul>';
	                resultValue += '    	<div class="more">';
	                resultValue += '    		<a href="javascript:listView(\'7\');" title="보도자료 더보기">더보기 +</a>';
	                resultValue += '    	</div>';
	                resultValue += '    </div>';
	                menu02Con01.append(resultValue);
				}, error: function(data, status, err) {
					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
        }
    });

    //채용정보
    $(menu03).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("maintabMenuOn");
        $(menu01).removeClass("maintabMenuOn");
        $(menu02).removeClass("maintabMenuOn");

        $(menu03Con01).css("display", "block");
        $(menu01Con01).css("display", "none");
        $(menu02Con01).css("display", "none");
        
        if($(menu03Con01).children().length == 0)
        {
	        $.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/main/ajaxSelectRecruitNoticeList.do'
				, success: function(resultData) {
					
					var resultValue = '';
					resultValue += '    <div class="topBox">';
					resultValue += '    	<ul class="subUl">';
					for(i = 0; i < resultData.data.length; i++)
					{
					resultValue += '		 	<li>';
					resultValue += '		 		<a href="javascript:listView(\'' + resultData.data[i].noSeq + '\',\'8\');" title="' + resultData.data[i].nmTitle + '">' + resultData.data[i].nmTitle + '</a>';
					resultValue += '		 	</li>';
					}		 	
					resultValue += '		</ul>';
	                resultValue += '    	<div class="more">';
	                resultValue += '    		<a href="javascript:listView(\'8\');" title="채용공지 더보기">더보기 +</a>';
	                resultValue += '    	</div>';
	                resultValue += '    </div>';
	                menu03Con01.append(resultValue);
				}, error: function(data, status, err) {
					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
        }
    });

}



//탭 - 컨텐츠 없는 탭
function tab() {
	$(" .tabbox .tab ").on("click", function (e) {
		$(" .tabbox .tab").removeClass("on");
		$(this).addClass("on");
	});
}



//탭 - 컨텐츠 있는 탭

function tabContents() {
	$(".tabbox .tab").on("click", function (e) {
		
		//자료검색 > 전자도서관 > 검색 예외 처리
		if(window.location.href.indexOf('selectElectLibary') > -1 && $('#query').is(":focus")){
			return false;
		}
		
		$(this).parent().find("li").removeClass("on");
		$(this).addClass("on");
		
		$(".tabContent").css("display", "none");
		$("#tabContent" + ($(this).index() + 1)).css("display", "block");
		var leftmargin = $(this).index()*100;
		$("#tabContent" + ($(this).index() + 1)).css("margin-left", "-"+leftmargin+"%");
	});
}


//금주의 서평
function tabList2() {
    var menu01 = $(".smallTabList2 > ul.parent > li.titleList01 > h3 > a");
    var menu02 = $(".smallTabList2 > ul.parent > li.titleList02 > h3 > a");
    var menu03 = $(".smallTabList2 > ul.parent > li.titleList03 > h3 > a");
    var menu01Con01 = $(".smallTabList2 > ul.parent > li.titleList01 > .tabCon01");
    var menu02Con01 = $(".smallTabList2 > ul.parent > li.titleList02 > .tabCon01");
    var menu03Con01 = $(".smallTabList2 > ul.parent > li.titleList03 > .tabCon01");

    $(menu01).addClass("tabMenuOn");
    $(menu01Con01).css("display", "block");

    $(menu01).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu02).removeClass("tabMenuOn");
        $(menu03).removeClass("tabMenuOn");

        $(menu01Con01).css("display", "block");
        $(menu02Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
    });

    $(menu02).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu01).removeClass("tabMenuOn");
        $(menu03).removeClass("tabMenuOn");

        $(menu02Con01).css("display", "block");
        $(menu01Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
    });

    $(menu03).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu01).removeClass("tabMenuOn");
        $(menu02).removeClass("tabMenuOn");

        $(menu03Con01).css("display", "block");
        $(menu01Con01).css("display", "none");
        $(menu02Con01).css("display", "none");
    });

}



//학술 DB
function tabList3() {
    var menu01 = $(".smallTabList3 ul.parent li.titleList01 h3 a");
    var menu02 = $(".smallTabList3 ul.parent li.titleList02 h3 a");
    var menu01Con01 = $(".smallTabList3 > ul.parent > li.titleList01 > .tabCon01");
    var menu02Con01 = $(".smallTabList3 > ul.parent > li.titleList02 > .tabCon01");

    $(menu01).addClass("tabMenuOn");
    $(menu01Con01).css("display", "block");

    $(menu01).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu02).removeClass("tabMenuOn");

        $(menu01Con01).css("display", "block");
        $(menu02Con01).css("display", "none");
    });

    $(menu02).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu01).removeClass("tabMenuOn");

        $(menu02Con01).css("display", "block");
        $(menu01Con01).css("display", "none");
    });
}


//국회의원·입법부 보도자료
function tabList5() {
    var menu01 = $(".smallTabList5 ul.parent li.titleList01 h3 a");
    var menu02 = $(".smallTabList5 ul.parent li.titleList02 h3 a");
    var menu03 = $(".smallTabList5 ul.parent li.titleList03 h3 a");
    var menu04 = $(".smallTabList5 ul.parent li.titleList04 h3 a");
    var menu05 = $(".smallTabList5 ul.parent li.titleList05 h3 a");
    var menu01Con01 = $(".smallTabList5 > ul.parent > li.titleList01 > .tabCon01");
    var menu02Con01 = $(".smallTabList5 > ul.parent > li.titleList02 > .tabCon01");
    var menu03Con01 = $(".smallTabList5 > ul.parent > li.titleList03 > .tabCon01");
    var menu04Con01 = $(".smallTabList5 > ul.parent > li.titleList04 > .tabCon01");
    var menu05Con01 = $(".smallTabList5 > ul.parent > li.titleList05 > .tabCon01");

    $(menu01).addClass("tabMenuOn");
    $(menu01Con01).css("display", "block");
    $(menu02Con01).css("display", "none");
    $(menu03Con01).css("display", "none");
    $(menu04Con01).css("display", "none");
    $(menu05Con01).css("display", "none");


    $(menu01).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu02).removeClass("tabMenuOn");
        $(menu03).removeClass("tabMenuOn");
        $(menu04).removeClass("tabMenuOn");
        $(menu05).removeClass("tabMenuOn");

        $(menu01Con01).css("display", "block");
        $(menu02Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
        $(menu04Con01).css("display", "none");
        $(menu05Con01).css("display", "none");
    });

    $(menu02).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu01).removeClass("tabMenuOn");
        $(menu03).removeClass("tabMenuOn");
        $(menu04).removeClass("tabMenuOn");
        $(menu05).removeClass("tabMenuOn");


        $(menu02Con01).css("display", "block");
        $(menu01Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
        $(menu04Con01).css("display", "none");
        $(menu05Con01).css("display", "none");

    });

    $(menu03).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu01).removeClass("tabMenuOn");
        $(menu02).removeClass("tabMenuOn");
        $(menu04).removeClass("tabMenuOn");
        $(menu05).removeClass("tabMenuOn");


        $(menu03Con01).css("display", "block");
        $(menu01Con01).css("display", "none");
        $(menu02Con01).css("display", "none");
        $(menu04Con01).css("display", "none");
        $(menu05Con01).css("display", "none");

    });

    $(menu04).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu01).removeClass("tabMenuOn");
        $(menu03).removeClass("tabMenuOn");
        $(menu02).removeClass("tabMenuOn");
        $(menu05).removeClass("tabMenuOn");


        $(menu04Con01).css("display", "block");
        $(menu01Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
        $(menu02Con01).css("display", "none");
        $(menu05Con01).css("display", "none");

    });

    $(menu05).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn");
        $(menu01).removeClass("tabMenuOn");
        $(menu03).removeClass("tabMenuOn");
        $(menu04).removeClass("tabMenuOn");
        $(menu02).removeClass("tabMenuOn");

        $(menu05Con01).css("display", "block");
        $(menu01Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
        $(menu02Con01).css("display", "none");
        $(menu04Con01).css("display", "none");

    });
}

/* main 8개 탭(금주의신간, 국내주간지기사, 금주의서평, 사서가추천하는 오늘의책, 월간국회도서관, 자치통감강목월간, 독도홈페이지, 팟케스트 */
function widthBigTabList() {
    //탭메뉴
	var menu01 = $(".tabMenuParent > li.list01 > h4 > a");
    var menu02 = $(".tabMenuParent > li.list02 > h4 > a");
    var menu03 = $(".tabMenuParent > li.list03 > h4 > a");
    var menu04 = $(".tabMenuParent > li.list04 > h4 > a");
    var menu05 = $(".tabMenuParent > li.list05 > h4 > a");
    var menu06 = $(".tabMenuParent > li.list06 > h4 > a");
    var menu07 = $(".tabMenuParent > li.list07 > h4 > a");
    var menu08 = $(".tabMenuParent > li.list08 > h4 > a");
    
    //article
    var menu01Con01 = $(".tabMenuParent > li.list01 > .tabConList01");
    var menu02Con01 = $(".tabMenuParent > li.list02 > .tabConList01");
    var menu03Con01 = $(".tabMenuParent > li.list03 > .tabConList01");
    var menu04Con01 = $(".tabMenuParent > li.list04 > .tabConList01");
    var menu05Con01 = $(".tabMenuParent > li.list05 > .tabConList01");
    var menu06Con01 = $(".tabMenuParent > li.list06 > .tabConList01");
    var menu07Con01 = $(".tabMenuParent > li.list07 > .tabConList01");
    var menu08Con01 = $(".tabMenuParent > li.list08 > .tabConList01");
    
    //더보기
    var more01 = $(".tabMenuParent .list01 .more a");
    var more02 = $(".tabMenuParent .list02 .more a");
    var more03 = $(".tabMenuParent .list03 .more a");
    var more04 = $(".tabMenuParent .list04 .more a");
    var more05 = $(".tabMenuParent .list05 .more a");
    var more06 = $(".tabMenuParent .list06 .more a");
    var more07 = $(".tabMenuParent .list07 .more a");
    var more08 = $(".tabMenuParent .list07 .more a");

    $(menu01).addClass("tabMenuOn2");
    $(menu02).removeClass("tabMenuOn2");
    $(menu03).removeClass("tabMenuOn2");
    $(menu04).removeClass("tabMenuOn2");
    $(menu04).removeClass("tabMenuOn2");
    $(menu05).removeClass("tabMenuOn2");
    $(menu06).removeClass("tabMenuOn2");
    $(menu07).removeClass("tabMenuOn2");
    $(menu08).removeClass("tabMenuOn2");
    
    $(menu01Con01).css("display", "block");
    $(menu02Con01).css("display", "none");
    $(menu03Con01).css("display", "none");
    $(menu04Con01).css("display", "none");
    $(menu05Con01).css("display", "none");
    $(menu06Con01).css("display", "none");
    $(menu07Con01).css("display", "none");
    $(menu08Con01).css("display", "none");

    $(more01).css("display", "block");
    $(more02).css("display", "none");
    $(more03).css("display", "none");
    $(more04).css("display", "none");
    $(more05).css("display", "none");
    $(more06).css("display", "none");
    $(more07).css("display", "none");
    $(more08).css("display", "none");
    
    //금주의신간
    $(menu01).on("click", function (e) {
    	e.preventDefault();
        $(this).addClass("tabMenuOn2");
        
        $(menu02).removeClass("tabMenuOn2");
        $(menu03).removeClass("tabMenuOn2");
        $(menu04).removeClass("tabMenuOn2");
        $(menu05).removeClass("tabMenuOn2");
        $(menu06).removeClass("tabMenuOn2");
        $(menu07).removeClass("tabMenuOn2");
        $(menu08).removeClass("tabMenuOn2");

        $(menu01Con01).css("display", "block");
        $(menu02Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
        $(menu04Con01).css("display", "none");
        $(menu05Con01).css("display", "none");
        $(menu06Con01).css("display", "none");
        $(menu07Con01).css("display", "none");
        $(menu08Con01).css("display", "none");
        
        $(more01).css("display", "block");
        $(more02).css("display", "none");
        $(more03).css("display", "none");
        $(more04).css("display", "none");
        $(more05).css("display", "none");
        $(more06).css("display", "none");
        $(more07).css("display", "none");
        $(more08).css("display", "none");
    });

    //국내 주간지 기사
    $(menu02).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn2");
        
        $(menu01).removeClass("tabMenuOn2");
        $(menu03).removeClass("tabMenuOn2");
        $(menu04).removeClass("tabMenuOn2");
        $(menu05).removeClass("tabMenuOn2");
        $(menu06).removeClass("tabMenuOn2");
        $(menu07).removeClass("tabMenuOn2");
        $(menu08).removeClass("tabMenuOn2");

        $(menu01Con01).css("display", "none");
        $(menu02Con01).css("display", "block");
        $(menu03Con01).css("display", "none");
        $(menu04Con01).css("display", "none");
        $(menu05Con01).css("display", "none");
        $(menu06Con01).css("display", "none");
        $(menu07Con01).css("display", "none");
        $(menu08Con01).css("display", "none");

        $(more01).css("display", "none");
        $(more02).css("display", "block");
        $(more03).css("display", "none");
        $(more04).css("display", "none");
        $(more05).css("display", "none");
        $(more06).css("display", "none");
        $(more07).css("display", "none");
        $(more08).css("display", "none");
        
        if($(menu02Con01).children().length == 0)
        {
	        $.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/main/ajaxSelectNeweekList.do'
				, success: function(resultData) {
					for(i = 0; i < resultData.data.length; i++)
					{
						var resultValue = '';
						resultValue += '<div class="bookList bookList0' + (i+1) + '">';
						resultValue += '	<div class="bookImg">';
						resultValue += '		<img src="http://nanet.go.kr/' + resultData.data[i].imageUrl + '" alt="' + resultData.data[i].subject + '">';
						resultValue += '	</div>';
						resultValue += '	<div class="bookInfo">';
						resultValue += '		<ul>';
						resultValue += '			<li class="bookInfoTxt01 pL0 bgNo"><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'3\');" title="' + resultData.data[i].subject + '">' + resultData.data[i].subject + '</a></li>';
						resultValue += '			<li><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'3\');">' + resultData.data[i].cont + '</a></li>';
						resultValue += '		</ul>';
						resultValue += '	</div>';
						resultValue += '</div>';
						menu02Con01.append(resultValue);
					}
					
				}, error: function(data, status, err) {
					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
        }
    });

    //금주의서평
    $(menu03).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn2");
        
        $(menu01).removeClass("tabMenuOn2");
        $(menu02).removeClass("tabMenuOn2");
        $(menu04).removeClass("tabMenuOn2");
        $(menu05).removeClass("tabMenuOn2");
        $(menu06).removeClass("tabMenuOn2");
        $(menu07).removeClass("tabMenuOn2");
        $(menu08).removeClass("tabMenuOn2");

        $(menu01Con01).css("display", "none");
        $(menu02Con01).css("display", "none");
        $(menu03Con01).css("display", "block");
        $(menu04Con01).css("display", "none");
        $(menu05Con01).css("display", "none");
        $(menu06Con01).css("display", "none");
        $(menu07Con01).css("display", "none");
        $(menu08Con01).css("display", "none");
        
        $(more01).css("display", "none");
        $(more02).css("display", "none");
        $(more03).css("display", "block");
        $(more04).css("display", "none");
        $(more05).css("display", "none");
        $(more06).css("display", "none");
        $(more07).css("display", "none");
        $(more08).css("display", "none");
        
        if($(menu03Con01).children().length == 0)
        {
	        $.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/main/ajaxSelectWclList.do'
				, success: function(resultData) {
					for(i = 0; i < resultData.data.length; i++)
					{
						var resultValue = '';
						resultValue += '<div class="bookList bookList0' + (i+1) + '">';
						resultValue += '	<div class="bookImg">';
						resultValue += '		<img src="http://nanet.go.kr/' + resultData.data[i].imageUrl + '" alt="' + resultData.data[i].sign + '">';
						resultValue += '	</div>';
						resultValue += '	<div class="bookInfo">';
						resultValue += '		<ul>';
						resultValue += '			<li class="bookInfoTxt01 pL0 bgNo"><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'1\');" title="' + resultData.data[i].sign + '">' + resultData.data[i].sign + '</a></li>';
						
						if(resultData.data[i].orgsign)
							resultValue += '			<li><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'1\');">원제:' + resultData.data[i].orgsign + '</a></li>';
							
						resultValue += '			<li><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'1\');">편·저자:' + resultData.data[i].writer + '</a></li>';
						resultValue += '		</ul>';
						resultValue += '	</div>';
						resultValue += '</div>';
						
						menu03Con01.append(resultValue);
					}
				}, error: function(data, status, err) {
					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
        }
    });

    //사서가 추천하는 오늘의 책
    $(menu04).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn2");
        
        $(menu01).removeClass("tabMenuOn2");
        $(menu02).removeClass("tabMenuOn2");
        $(menu03).removeClass("tabMenuOn2");
        $(menu05).removeClass("tabMenuOn2");
        $(menu06).removeClass("tabMenuOn2");
        $(menu07).removeClass("tabMenuOn2");
        $(menu08).removeClass("tabMenuOn2");

        $(menu01Con01).css("display", "none");
        $(menu02Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
        $(menu04Con01).css("display", "block");
        $(menu05Con01).css("display", "none");
        $(menu06Con01).css("display", "none");
        $(menu07Con01).css("display", "none");
        $(menu08Con01).css("display", "none");

        $(more01).css("display", "none");
        $(more02).css("display", "none");
        $(more03).css("display", "none");
        $(more04).css("display", "block");
        $(more05).css("display", "none");
        $(more06).css("display", "none");
        $(more07).css("display", "none");
        $(more08).css("display", "none");
        
        if($(menu04Con01).children().length == 0)
        {
	        $.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/main/ajaxSelectTblList.do'
				, success: function(resultData) {
					for(i = 0; i < resultData.data.length; i++)
					{
						var resultValue = '';
						resultValue += '<div class="bookList bookList0' + (i+1) + '">';
						resultValue += '	<div class="bookImg">';
						resultValue += '		<img src="http://nanet.go.kr/' + resultData.data[i].imageUrl + '" alt="' + resultData.data[i].sign + '">';
						resultValue += '	</div>';
						resultValue += '	<div class="bookInfo">';
						resultValue += '		<ul>';
						resultValue += '			<li class="bookInfoTxt01 pL0 bgNo"><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'4\');" title="' + resultData.data[i].sign + '">' + resultData.data[i].sign + '</a></li>';
					
						if(resultData.data[i].orgsign)
							resultValue += '			<li><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'4\');">원제:' + resultData.data[i].orgsign + '</a></li>';
							
						resultValue += '			<li><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'4\');">편·저자:' + resultData.data[i].writer + '</a></li>';
						resultValue += '		</ul>';
						resultValue += '	</div>';
						resultValue += '</div>';
						
						menu04Con01.append(resultValue);
					}
				}, error: function(data, status, err) {
					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
        }
    });

    //월간 국회 도서관
    $(menu05).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn2");
        
        $(menu01).removeClass("tabMenuOn2");
        $(menu02).removeClass("tabMenuOn2");
        $(menu03).removeClass("tabMenuOn2");
        $(menu04).removeClass("tabMenuOn2");
        $(menu06).removeClass("tabMenuOn2");
        $(menu07).removeClass("tabMenuOn2");
        $(menu08).removeClass("tabMenuOn2");

        $(menu01Con01).css("display", "none");
        $(menu02Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
        $(menu04Con01).css("display", "none");
        $(menu05Con01).css("display", "block");
        $(menu06Con01).css("display", "none");
        $(menu07Con01).css("display", "none");
        $(menu08Con01).css("display", "none");

        $(more01).css("display", "none");
        $(more02).css("display", "none");
        $(more03).css("display", "none");
        $(more04).css("display", "none");
        $(more05).css("display", "block");
        $(more06).css("display", "none");
        $(more07).css("display", "none");
        $(more08).css("display", "none");
        
        if($(menu05Con01).children().length == 0)
        {
	        $.ajax({
				type: "post"
				, async: false
				, dataType: "json"
				, url: '/main/ajaxSelectLibraryGazetteList.do'
				, success: function(resultData) {
					for(i = 0; i < resultData.data.length; i++)
					{
						var resultValue = '';
						resultValue += '<div class="bookList bookList0' + (i+1) + '">';
						resultValue += '	<div class="bookImg">';
						resultValue += '		<img src="http://nanet.go.kr/attachfiles/publishcount/' + resultData.data[i].sysAttachFile + '" alt="' + resultData.data[i].year + '년 ' + resultData.data[i].mon + '월호">';
						resultValue += '	</div>';
						resultValue += '	<div class="bookInfo">';
						resultValue += '		<ul>';
						resultValue += '			<li class="bookInfoTxt01 pL0 bgNo"><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'5\');" title="' + resultData.data[i].title + '">(월간)국회도서관</a></li>';
						resultValue += '			<li><a href="javaScript:detailView(\'' + resultData.data[i].seq + '\',\'5\');">' + resultData.data[i].year + '년 ' + resultData.data[i].mon + '월호</a></li>';
						resultValue += '		</ul>';
						resultValue += '	</div>';
						resultValue += '</div>';
						menu05Con01.append(resultValue);
					}
				}, error: function(data, status, err) {
					alert("서버와의 통신이 실패했습니다.");
		        }
	        });
        }
     });
    
    //자치통감강목
    $(menu06).on("click", function (e) {
        e.preventDefault();
        $(this).addClass("tabMenuOn2");
        
        $(menu01).removeClass("tabMenuOn2");
        $(menu02).removeClass("tabMenuOn2");
        $(menu03).removeClass("tabMenuOn2");
        $(menu04).removeClass("tabMenuOn2");
        $(menu05).removeClass("tabMenuOn2");
        $(menu07).removeClass("tabMenuOn2");
        $(menu08).removeClass("tabMenuOn2");

        $(menu01Con01).css("display", "none");
        $(menu02Con01).css("display", "none");
        $(menu03Con01).css("display", "none");
        $(menu04Con01).css("display", "none");
        $(menu05Con01).css("display", "none");
        $(menu06Con01).css("display", "block");
        $(menu07Con01).css("display", "none");
        $(menu08Con01).css("display", "none");

        $(more01).css("display", "none");
        $(more02).css("display", "none");
        $(more03).css("display", "none");
        $(more04).css("display", "none");
        $(more05).css("display", "none");
        $(more06).css("display", "block");
        $(more07).css("display", "none");
        $(more08).css("display", "none");
    });    
}

//2022 비밀번호 체크
//1)8자리 ~ 20자리 2)영문(대소문자) ,숫자,특수문자 중 2가지 혼합 3)같은 문자 4번 반복 X 4)공백 X 5)한글 X 6)연속된숫자 X
function pwdCheckNew(pw){
	var num = pw.search(/[0-9]/g); //숫자
	var eng = pw.search(/[a-z]/ig); //영문
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); //특수문자
	var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글
	
	if(pw != ""){
		if(pw.length < 8 || pw.length > 20){
			alert("8자리 ~ 20자리 이내로 입력해주세요.");
			return false;
		}
		
		else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			alert("영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			return false;
		}
		
		else if(pw.search(/\s/) != -1){
			alert("비밀번호는 공백 없이 입력해주세요.");
			return false;
		}
		
		else if(/(\w)\1\1\1/.test(pw)){
			alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			return false;
		}
		
		else if(hangulcheck.test(pw)){
			alert("비밀번호에 한글을 사용 할 수 없습니다.");
			return false;
		}
		
		else if(/(0123)|(1234)|(2345)|(3456)|(4567)|(5678)|(6789)|(7890)/.test(pw)){
			alert('비밀번호는 4회이상의 연속된 숫자를 사용할 수 없습니다.');
			return false;
		}
		
		else if(/(0987)|(9876)|(8765)|(7654)|(6543)|(5432)|(4321)|(3210)/.test(pw)){
			alert('비밀번호는 4회이상의 연속된 숫자를 사용할 수 없습니다.');
			return false;
		}
	}
	return true;
}