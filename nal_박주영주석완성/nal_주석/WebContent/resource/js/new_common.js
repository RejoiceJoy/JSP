$(document).ready(function() {
    $('a[href="#"]').click(function(e) {
    	e.preventDefault();
    });

    //메뉴
//    $(".menu>ul>li").hover(function(){
//        var $menuList = $(this).find(".menuList");
//        if($menuList.css("display")=="block"){
//            $(".menu>ul>li>div.menuList").slideUp(500);
//        }else{
//            $(".menu>ul>li>div.menuList").css("display","none");
//            $menuList.show();
//        }
//    });
    //메뉴 웹접근성
//    $(".menu>ul>li").bind("mouseenter focusin",function(){
//    	$(".menu>ul>li").removeClass("on");
//    	$(this).addClass("on");
//    });
//    $(".menu>ul>li").bind("mouseleave focusout",function(){
//    	$(".menu>ul>li").removeClass("on");
//    	$(this).removeClass("on");
//   });
//    $(".menu>ul>li>a").click(function() {
//    	$(this).parent().addClass("on");
//    	if($(this).parent().hasClass("on")){
//    		$(this).parent().removeClass("on");
//    	}else{
//    		$(".menu>ul>li").removeClass("on");
//    		$(this).parent().addClass("on");
//    	}
//	})
    $(".menu>ul>li>a").on('focusin mouseover',function(e){
    	$(".menu>ul>li").removeClass("on");
    	$(".menuList").hide();
    	$(this).parent().addClass("on");
    	$(this).next(".menuList").show();
    });
    $(".menu").on('mouseleave',function(e){
    	$(".menu>ul>li").removeClass("on");
    	$(this).parent().removeClass("on");
    	$(".menuList").hide();
    });
    $(".menu .menu04 li:last-child a").on('focusout',function(){
    	$(".menu>ul>li").removeClass("on");
    	$(this).parent().removeClass("on");
    	$(".menuList").hide();
    });
    
    //서브메뉴
    $(".leftMenu>ul>li>ul>li>a").click(function() {
		if($(this).parent().find(".depth3").css("display")=="block"){
			$(".leftMenu>ul>li>ul>li").removeClass("on");
			$(this).parent().removeClass("on");
		}else{
			$(".leftMenu>ul>li>ul>li").removeClass("on");
			$(this).parent().addClass("on");
		}
	});
    
    // 검색창
    $(".main .search .select a").click(function(){
        $(".main .search .select ul").slideToggle(500);
    });
    $(".btnSearch .btn_search").click(function(){
        $(".menuSearch.mo").css("display","block");
    });
    $(".menuSearch .btnClose").click(function(){
        $(".menuSearch.mo").css("display","none");
    });

    //공지사항
    $(".tabTitle").click(function(){
        $(".tabTitle").removeClass("on");
        $(".tabList").removeClass("on");
        $(this).addClass("on");
        $(this).parent().find(".tabList").addClass("on");    
    });
    $(".menuIcon a").click(function(){
        $(".popupMenu").show();
        $(".loginList.mo").show();
    	$("html, body").css({
    		"overflow" : "hidden",
    		"height"   : "100%"
    	});
    });
    $(".popupMenu .popupContainer .close, .loginList .close").click(function(){
        $(".popupMenu").hide();
        $(".loginList.mo").hide();
        $("html, body").css({
    		"overflow" : "auto",
    		"height"   : "100%"
    	});
    });    

    $(window).resize(function() {
        var mobileW = window.outerWidth;
        if(mobileW > 1200){
            $(".popupMenu").hide();
            $(".loginList.mo").hide();
            $(".popupMenu .popupContainer>ul>li>ul").css("display","block");
        }else if(mobileW > 767){
        	$(".menuSearch.mo").css("display","none");
        }else{
        	$(".popupMenu .popupContainer>ul>li").removeClass("on");
            $(".popupMenu .popupContainer>ul>li>ul").css("display","none");
        }
    });

    $(".popupMenu .popupContainer>ul>li>span").click(function(){
        var mobileW = window.outerWidth;
        if(mobileW <= 1200){
            if($(this).parent().find(".depth").css("display")=="block") {
                $(this).parent().removeClass("on");
                $(this).parent().find(".depth").css("display","none");
            }else{
                $(".popupMenu .popupContainer>ul>li").removeClass("on");
                $(".popupMenu .popupContainer>ul>li>ul").css("display","none");
                $(this).parent().addClass("on");
                $(this).parent().find(".depth").css("display","block");
            }
        }
    });
    
    //레이어 팝업 닫기 
    $(".layerPopup .close, .closeContainer button.btn_navy").click(function(){
    	$("html, body").css({
    		"overflow" : "auto",
    		"height"   : "100%"
    	});
    	$(".layerPopup").css("display","none");
    	$(".mobilePopup").css("display","none");
	
   	    var dataId = $(this).attr("data-id");

		$("[data-focus="+dataId+"]").focus();
		
    });
    /*$(".mobilePopup .close").click(function(){
    	$(".mobilePopup").css("display","none");

    });*/
    
    function menuDepth(){
    	var $liDepth = $(".leftMenu>ul>li>ul>li").find("ul").hasClass("depth3");
    	if($liDepth == true){
    		$(this).addClass("depth");
    	}
    }
    menuDepth();
});