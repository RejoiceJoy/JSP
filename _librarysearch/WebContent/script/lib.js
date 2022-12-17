$(document).ready(function(){
	if($(window).width() < 768) {
		$("#content .list ul li .item .view").attr("value", "보기");
	} else {
		$("#content .list ul li .item .view").attr("value", "상세내역보기")
	}
	if($(window).width() < 451) {
		$("#content .list ul li .item .cancle").attr("value", "취소");
	} else {
		$("#content .list ul li .item .cancle").attr("value", "신청취소")
	}
	$(window).resize(function() {
		if($(window).width() < 768) {
			$("#content .list ul li .item .view").attr("value", "보기");
		} else {
			$("#content .list ul li .item .view").attr("value", "상세내역보기")
		}
		if($(window).width() < 451) {
			$("#content .list ul li .item .cancle").attr("value", "취소");
		} else {
			$("#content .list ul li .item .cancle").attr("value", "신청취소")
		}
	});

	/* 내서재 - tab menu
	var $tab_board=$("#tab h3 a");
	//$("#tab > ul > li:first").addClass("on");

	/* 내서재 - tab content height
	var x = $('.tab .item.on .content').height();
	if($(window).width() < 768) {
		x = x - 40;
	} else {
		x = x + 69;
	}
	if($(".tab .item").hasClass("on")){
		$('.tab').css('height', x);
	}
	 */
	/*$tab_board.on("click focus", function(e){
		e.preventDefault();
		x = $(this).parent().parent().children(".content").height() + 56;
		$("#tab > ul > li").removeClass("on");
		$(this).parent().parent("li").addClass("on");
		$('.tab').css('height', x);
	});*/
	/*
	$(window).resize(function() {
		x = $('.tab .item.on .content').height() + 56;
		if($(".tab .item").hasClass("on")){
			$('.tab').css('height', x);
		}
	});
	*/

	/* 신청조회 */
	$("#content .list .item .view").on("click", function() {
		$(this).toggleClass("on");
		$(this).parent().parent().parent("li").children(".detailView").toggle();
		if($(this).hasClass("on")) {
			if($(window).width() < 768) {
				$(this).val("접기");
				$(this).attr('title', "접기");
			} else {
				$(this).val("상세내역접기");
				$(this).attr('title', "상세내역접기");
			}
		} else {
			$(this).val("상세내역보기");
			if($(window).width() < 768) {
				$(this).val("보기");
				$(this).attr('title', "보기");
			} else {
				$(this).val("상세내역보기");
				$(this).attr('title', "상세내역보기");
			}
		}
	});

	/* 자주 묻는 질문 */
	$("#content .list2 ul li > a").on("click", function() {
		if(!($(this).parent("li").hasClass("on"))) {
			$("#content .list2 ul li .con").slideUp("fast");
			$(this).parent("li").children(".con").slideDown("fast");
			$("#content .list2 ul li").removeClass("on");
			$(this).parent("li").addClass("on");
		} else {
			$(this).parent("li").children(".con").slideUp("fast");
			$(this).parent("li").removeClass("on");
		}
	});

	/* 내보내기 */
	$(".exportPop .form .fStyle1 li").on("click", function(e) {
		e.preventDefault();
		$(this).children("input").prop("checked", true);

		$(".exportPop .scope").hide();
		$(".exportPop .inputWrap").hide();
		$(".exportPop .txt").hide();
		$(".exportPop").removeClass("email");
		$(".exportPop").removeClass("info");
		$(".exportPop").removeClass("default");

		if($(this).hasClass("html") || $(this).hasClass("print2") || $(this).hasClass("preview")) {
			$(".exportPop .scope").slideDown("fast");
			$(".exportPop").addClass("default");
		} else if($(this).hasClass("eMail")) {
			$(".exportPop .scope").slideDown("fast");
			$(".exportPop .inputWrap").slideDown("fast");
			$(".exportPop").addClass("email");
		} else {
			if($(this).hasClass("endNote")) {
				$(".exportPop .txt span").text("EndNote");
			} else if($(this).hasClass("refWorks")) {
				$(".exportPop .txt span").text("RefWorks");
			} else if($(this).hasClass("marc2")) {
				$(".exportPop .txt span").text("MARC");
			}
			$(".exportPop .txt").slideDown("fast");
			$(".exportPop").addClass("info");
		}
	});

	$(".exportPop .form .fStyle1 li label").on("keydown", function(e) {
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			$(this).prev("input").prop("checked", true);

			$(".exportPop .scope").hide();
			$(".exportPop .inputWrap").hide();
			$(".exportPop .txt").hide();
			$(".exportPop").removeClass("email");
			$(".exportPop").removeClass("info");
			$(".exportPop").removeClass("default");

			if($(this).parent().hasClass("html") || $(this).parent().hasClass("print2") || $(this).parent().hasClass("preview") || $(this).parent().hasClass("excel")) {
				$(".exportPop .scope").slideDown("fast");
				$(".exportPop").addClass("default");
			} else if($(this).parent().hasClass("eMail")) {
				$(".exportPop .scope").slideDown("fast");
				$(".exportPop .inputWrap").slideDown("fast");
				$(".exportPop").addClass("email");
				$("#email").focus();
				$("input[type=radio]").next("label").attr("tabindex", "");
			} else {
				if($(this).parent().hasClass("endNote")) {
					$(".exportPop .txt span").text("EndNote");
				} else if($(this).parent().hasClass("refWorks")) {
					$(".exportPop .txt span").text("RefWorks");
				} else if($(this).parent().hasClass("marc2")) {
					$(".exportPop .txt span").text("MARC");
				}
				$(".exportPop .txt").slideDown("fast");
				$(".exportPop").addClass("info");
			}
		}
	});

	/* 대출내역 */
	$('.loanList .wrap .list').slick({
		dots: false,
		autoplay: false,
		infinite: true,
		speed: 500,
		slidesToShow: 5,
		slidesToScroll: 1,
		prevArrow : $('.loanList .wrap .control').find('.btnPrev'),
		nextArrow : $('.loanList .wrap .control').find('.btnNext'),
		responsive: [
			{
				breakpoint: 1201,
				settings: {
					slidesToShow: 4,
				}
			},
			{
				breakpoint: 1025,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 851,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 768,
				settings: {
					slidesToShow: 4,
				}
			},
			{
				breakpoint: 641,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 476,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 375,
				settings: {
					slidesToShow: 1,
				}
			}
		]
	});

	//대출현황조회 type1 대출중  type2 반납완료
	var loanV = $('select[name=loanStateCode]').val();
	//console.log(loanV);

	if(loanV == 10){
		$('.loanTable').addClass('type1');
		$('.loanTable').removeClass('type2');
	}
	if(loanV == 20){
		$('.loanTable').addClass('type2');
		$('.loanTable').removeClass('type1');
	}


});