$(document).ready(function(){
	/* Facet */
	$('.facet > ul > li.type1 > a').click(function(){
		if(!$(".facet > ul > li.type1 > ul").is(':animated')){
			if($(this).parent().hasClass('on')){
				$(this).parent().removeClass('on');
				$(this).next().slideUp(250);
			}else{
				$(this).parent().addClass('on');
				$(this).next().slideDown(250);
			}
		}
		return false;
	});

	/* Facet - type2 */
	$('.facet > ul > li.type2 > a').click(function(){
		if(!$(".facet > ul > li.type2 > ul").is(':animated')){
			if($(this).parent().hasClass('on')){
				$(this).parent().removeClass('on');
				$(this).next().slideUp(250);
			}else{
				$(this).parent().addClass('on');
				$(this).next().slideDown(250);
			}
		}
		return false;
	});

	/* Facet - type4 (검색 결과 취소) */
	$('.facet > ul > li.type4 > a').click(function(){
		if(!$(".facet > ul > li.type4 > ul").is(':animated')){
			if($(this).parent().hasClass('on')){
				$(this).parent().removeClass('on');
				$(this).next().slideUp(250);
			}else{
				$(this).parent().addClass('on');
				$(this).next().slideDown(250);
			}
		}
		return false;
	});


	$('.facet > ul > li > div > ul > li > p > button').click(function(){
		$(this).parent().parent().toggleClass('on');
		if($(this).parent().parent().hasClass("on")) {
			$(this).text("닫기");
		} else {
			$(this).text("열기");
		}
	});

	$(".facet > ul > li > div > div.more > button").click(function() {
		$(this).parent().toggleClass("on");
		$(this).parent().parent().children("ul").toggleClass("on");
		if($(this).parent().parent().children("ul").hasClass("on")) {
			$(this).text("접기");
		} else {
			$(this).text("더보기");
		}
	});

	/* 모바일 사이즈 일 때 메뉴 숨김 */
	$(".facet .top").on("click", function() {
		var select = $(this).find("a");
		if($(window).width() < 768) {
			$(select).parent().next("ul").children("li").removeClass("on");
			$(select).parent().next("ul").children("li").children("div").hide();
			$(select).parent().next("ul").children("li.type3").children("div").show();
		}
		$(select).parent().parent().toggleClass("on");
		if($(select).parent().parent().hasClass("on")) {
			$(select).text("닫기");
			$(select).attr({"title":"닫기"});
		} else {
			$(select).text("열기");
			$(select).attr({"title":"열기"});
		}
	});

	$(window).resize(function() {
		if($(window).width() < 768) {
			$(".facet > ul > li.type1").removeClass("on");
			$(".facet > ul > li.type1 > div").hide();
		} else {
			$(".facet > ul > li.type1").addClass("on");
			$(".facet > ul > li.type1 > div").show();
		}
	});

});