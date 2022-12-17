$(document).ready(function(){
	/* 가상서가 */
	$('.bookstack > a.prev').click(function(){
		var listWidth = $('.bookstack > div ul li').width();
		if(!$('.bookstack > div ul').is(":animated")){
			$('.bookstack > div ul li').last().prependTo($('.bookstack > div ul'));
			$('.bookstack > div ul').css('left',-listWidth);
			$('.bookstack > div ul').animate({"left":"0"},500);
		}
		return false;
	});
	$('.bookstack > a.next').click(function(){
		var listWidth = $('.bookstack > div ul li').width();
		if(!$('.bookstack > div ul').is(":animated")){
			$('.bookstack > div ul').animate({"left":-listWidth},500, function(){
				$('.bookstack > div ul li').first().appendTo($('.bookstack > div ul'));
				$('.bookstack > div ul').css('left','0');
			});
		}

		return false;
	});

	/* 추천서비스 */
	$('.recommendService > a.prev').click(function(){
		var listWidth = $('.recommendService > div ul li').width();
		if(!$('.recommendService > div ul').is(":animated")){
			$('.recommendService > div ul li').last().prependTo($('.recommendService > div ul'));
			$('.recommendService > div ul').css('left',-listWidth);
			$('.recommendService > div ul').animate({"left":"0"},500);
		}
		return false;
	});
	$('.recommendService > a.next').click(function(){
		var listWidth = $('.recommendService > div ul li').width();
		if(!$('.recommendService > div ul').is(":animated")){
			$('.recommendService > div ul').animate({"left":-listWidth},500, function(){
				$('.recommendService > div ul li').first().appendTo($('.recommendService > div ul'));
				$('.recommendService > div ul').css('left','0');
			});
		}

		return false;
	});

	/* 더보기 */
	$(".detailContent2 .more").on("click", function() {
		$(this).toggleClass("on");
		$(this).parent().parent().children(".scrollY").toggleClass("on");
		$(this).parent().parent().children(".detailTable").toggleClass("on");
		if($(this).parent().parent().children(".scrollY").hasClass("on") || $(this).parent().parent().children(".detailTable").hasClass("on")) {
			$(this).text("접기");
		} else {
			$(this).text("더보기");
		}
	});

	/* 권호기사 보기 */
	$(".detailTable .view").on("click", function() {
		$(this).parent().parent().next(".viewWrap").slideToggle("fast");
	});

	/* 원문보기 / 다운로드 클릭 */
//	$(".detailContent dl dd > .list > li > .view").on("click", function() {
//		$(this).next(".originalDetail").slideToggle("fast");
//	});
//	$(".detailContent dl dd > .list > li > .view.original").on("click", function() { //원문보기 클릭시 다운로드 상세 숨김
//		$(this).parent().next("li").children(".originalDetail").slideUp("fast");
//	});
//	$(".detailContent dl dd > .list > li > .view.download").on("click", function() { //다운로드 클릭시 원문보기 상세 숨김
//		$(this).parent().prev("li").children(".originalDetail").slideUp("fast");
//	});

	/* 미리보기
	$('.previewBox .previewList').slick({
		dots: false,
		autoplay: false,
		infinite: true,
		speed: 500,
		slidesToShow: 4,
		slidesToScroll: 1,
		prevArrow : $('.previewBox .control').find('.prev'),
		nextArrow : $('.previewBox .control').find('.next'),
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
				breakpoint: 541,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 426,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 376,
				settings: {
					slidesToShow: 2,
				}
			}
		]
	});
	 */

	/* 미리보기 뷰어 */
	$(".previewBox .previewList .item a").click(function() {
		$('.imgPreviewWrap').show(); // 팝업 오픈
		$('.imgPreview .imgBox .imgList').slick({ // 이미지 슬라이드
			dots: false,
			autoplay: false,
			infinite: true, // 무한반복
			speed: 500,
			slidesToShow: 1,
			slidesToScroll: 1,
			prevArrow : $('.imgPreview .imgBox .control').find('.prev'),
			nextArrow : $('.imgPreview .imgBox .control').find('.next'),
			initialSlide: $(".previewBox .previewList .item a:eq(0)").attr('data-value') == 0 ? $(this).attr('data-value') : $(this).attr('data-value') - 1
		});
		var itemHeight = $('.imgPreview .imgBox .imgList .item').height() + 60; // 팝업 높이 설정 (80은 padding * 2 값 - 여백 값 변경 시 값 변경 필요)
		$('.imgPreview').css("height", itemHeight);
	});
	$(window).resize(function() { // 크기 조절시 팝업 높이 설정
		var itemHeight = $('.imgPreview .imgBox .imgList .item').height() + 60;
		$('.imgPreview').css("height", itemHeight);
	});
	$(".imgPreview .imgBox .close").click(function() {
		$(".imgPreviewWrap").hide();
		$('.imgPreview .imgBox .imgList').slick('unslick');
	});


	/* 알라딘 tab menu */
	var $tab_board=$(".aladinTab .tab h3 a");
	$(".aladinTab > ul > li:first").addClass("on");

	$tab_board.on("click focus", function(e){
		e.preventDefault();
		$(".aladinTab > ul > li").removeClass("on");
		$(this).parent().parent("li").addClass("on");
	});

	$(".aladinTab .tab li.item .more").on("click", function() {
		$(this).toggleClass("on");
		$(this).parent().children(".content").toggleClass("on");
		if($(this).parent().children(".content").hasClass("on")) {
			$(this).text("접기");
		} else {
			$(this).text("더보기");
		}
	});


	/* 사이드 자료 더보기 */
	$(".aside .asStyle1 .more").on("click", function() {
		$(this).toggleClass("on");
		$(this).parent().children(".list").toggleClass("on");
	});



	/* 가상서가 */
	$('.bookstack .slick').slick({
		dots: false,
		autoplay: false,
		infinite: true,
		speed: 500,
		slidesToShow: 5,
		slidesToScroll: 5,
		prevArrow : $('.bookstack .control').find('.prev'),
		nextArrow : $('.bookstack .control').find('.next'),
		responsive: [
			{
				breakpoint: 1120,
				settings: {
					slidesToShow: 4,
					slidesToScroll: 4,
				}
			},
			{
				breakpoint: 1025,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 3,
				}
			},
			{
				breakpoint: 768,
				settings: {
					slidesToShow: 4,
					slidesToScroll: 4,
				}
			},
			{
				breakpoint: 581,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 3,
				}
			},
			{
				breakpoint: 426,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 2,
				}
			}
		]
	});
	$('.bookstack .control').find('.prev').attr("href","#none");
	$('.bookstack .control').find('.prev').click(function(){
		$('.bookstack .slick').slick("slickPrev");
	});
	$('.bookstack .control').find('.next').attr("href","#none");
	$('.bookstack .control').find('.next').click(function(){
		$('.bookstack .slick').slick("slickNext");
	});

	/* 저자 */
	$(".writer > a").on("click", function() {
		$(this).next(".wrap").toggleClass("on");
		$(this).next(".wrap").toggle();

		setTimeout(function() {
			if($(".writer .wrap").hasClass("on")) {
				$(".writer .wrap").removeClass("on");
				$(".writer .wrap").hide();
			}
		}, 3000);
	});

});