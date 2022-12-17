$(document).ready(function(){
	/* 모바일 메뉴 */
//	$(".mobileMenu .open, #mobileMenu .mypage a").click(function(){
		$(".mobileMenu .open").click(function(){
		$('.mobileMenu span.menuBg').fadeIn(500);
		$('.mobileMenu > div').show();
		$('.mobileMenu > div').animate({"right":"0"},500);
		$('html').css('overflow-y','hidden');
	});
	$('.mobileMenu > div a.close').click(function(){
		$('.mobileMenu span.menuBg').fadeOut(500);
		$('.mobileMenu > div').animate({"right":"-50%"},500,function(){
			$('.mobileMenu > div').hide();
		});
		$('html').css('overflow-y','scroll');
	});

	/* 검색키워드 */
	automove();
	function automove(){
		var auto = setInterval(function(){
			var keywordH = $('.keyword > ul > li').outerHeight(true);
			$('.keyword > ul').animate({'top':-keywordH},1000, function(){
				$('.keyword > ul > li').first().appendTo($('.keyword > ul'));
				$('.keyword > ul').css('top','0')
			});
		},3000);
	}

	/* 검색 SelectBox
	var $label = $('.selectBoxW > label');
	$label.on('click',function(){
		if(!$(this).parent().hasClass('on')){
			$(this).parent().addClass('on');
			$(this).parent().parent().siblings().find('.divSelectBox').removeClass('on');
			$(this).parent().next().addClass('on');
			$(this).parent().next().children().addClass('on');
		}else{
			$(this).parent().removeClass('on');
			$(this).parent().next().removeClass('on');
			$(this).parent().next().children().removeClass('on');
		}
	});
	$(document).on("click", ".optList > ul > li > a", function(e){
		var optText = $(this).text();
		$(this).parent().parent().parent().parent().prev().find('select').attr('title',$(this).text());//옵션선택시 텍스트 변경
		$(this).parent().parent().parent().parent().prev().find('label').text($(this).text());//옵션선택시 텍스트 변경
		$(this).parent().parent().parent().parent().siblings().children('select').find('option').removeAttr('selected');
		$(this).parent().parent().parent().parent().siblings().children('select').find('option').filter(function() {return this.text == optText;}).attr('selected', 'selected');
		$label.parent().removeClass('on');
		$label.parent().next().removeClass('on');
		$label.parent().next().children().removeClass('on');
		return false;
	});
	*/

	/* SelectBox */
	var $label = $('.select > a');
	$label.on('click',function(){
		if(!$(this).parent().hasClass('on')){
			$(this).parent().addClass('on');
			$(this).parent().parent().siblings().find('.divSelectBox').removeClass('on');
			$(this).parent().next().addClass('on');
			$(this).parent().next().children().addClass('on');
		}else{
			$(this).parent().removeClass('on');
			$(this).parent().next().removeClass('on');
			$(this).parent().next().children().removeClass('on');
		}
	});
	$(document).on("click", ".optList > ul > li > a", function(e){
		var optText = $(this).text();
		$(this).parent().parent().parent().parent().prev().find('select').attr('title',$(this).text());//옵션선택시 텍스트 변경
		$(this).parent().parent().parent().parent().prev().find('a').text($(this).text());//옵션선택시 텍스트 변경
		$(this).parent().parent().parent().parent().siblings().children('select').find('option').removeAttr('selected');
		$(this).parent().parent().parent().parent().siblings().children('select').find('option').filter(function() {return this.text == optText;}).attr('selected', 'selected');
		$label.parent().removeClass('on');
		$label.parent().next().removeClass('on');
		$label.parent().next().children().removeClass('on');
		var optId = $(this).parent().parent().parent().parent().prev().find('a').attr('id');
		if(optId == 'selPageSizeLabel' || optId == 'selOrderByLabel'){
			//onSelectChange();
		}
		return false;
	});
	$(".selectD").mouseleave(function() { /* 마우스 벗어났을때 셀렉트 리스트 숨김 */
		$(this).children().removeClass("on");
		$(this).children(".selectBox").children(".optList").removeClass("on");
	});
	$(".selectW").mouseleave(function() { /* 마우스 벗어났을때 셀렉트 리스트 숨김 (검색 카테고리) */
		$(this).children().removeClass("on");
		$(this).children(".srchSelectBox").children(".optList").removeClass("on");
	});

	$(".selectD .selectBox .optList li:last a").focusout(function() { /* 포커스 벗어났을때 셀렉트 리스트 숨김 */
		$(this).parent().parent().parent().parent(".selectBox").removeClass("on");
		$(this).parent().parent().parent(".optList").removeClass("on");
	});

	$(".selectW .srchSelectBox .optList li:last a").focusout(function() { /* 포커스 벗어났을때 셀렉트 리스트 숨김 (검색 카테고리) */
		$(this).parent().parent().parent().parent(".srchSelectBox").removeClass("on");
		$(this).parent().parent().parent(".optList").removeClass("on");
	});

	$("#selpageView .selectBox .optList li:last a").focusout(function() { /* 포커스 벗어났을때 셀렉트 리스트 숨김 (페이지 보기 설정 select 전용) */
		$("#selpageView .selectBox").removeClass("on");
		$("#selpageView .optList").removeClass("on");
	});

	/* 이용안내 더보기 */
	$('#footer .privacy dl dt a').click(function(){
		if(!$('#footer .privacy dl dd').is(":animated")){
			if($('#footer .privacy dl dd').css('display') == 'block'){
				$('#footer .privacy dl').removeClass('on');
				$('#footer .privacy dl dd').slideUp(250);
			}else{
				$('#footer .privacy dl').addClass('on');
				$('#footer .privacy dl dd').slideDown(250);
			}
		}
		return false;
	});

	/* 검색결과메뉴 */
	var $topMenuFirst=$("#category .firstDepth > li");
	//$("#category .firstDepth > li:first").addClass("on");
	/*
	$topMenuFirst.on("click focus", function(e) {
		e.preventDefault();
		$("#category .firstDepth > li").removeClass("on");
		$(this).addClass("on");
	});*/

	var $topMenuSecond=$("#category .secondDepth > li");
	//$("#category .secondDepth > li:first").addClass("on");
	$topMenuSecond.on("click focus", function(e) {
		if($(window).width() < 768) {
			if($(this).children().hasClass("thirdDepth")) {
				$(".category").css("paddingBottom", 51);
			} else {
				$(".category").css("paddingBottom", 15);
			}
		} else {
			$(".category").css("paddingBottom", 51);
		}
		//e.preventDefault();
		$("#category .secondDepth > li").removeClass("on");
		$(this).addClass("on");
	});

	$(window).load(function() {
		if($(window).width() < 768) {
			if($("#category .secondDepth > li.on").children().hasClass("thirdDepth")) {
				$(".category").css("paddingBottom", 51);
			} else {
				$(".category").css("paddingBottom", 15);
			}
		} else {
			$(".category").css("paddingBottom", 51);
		}
	});

	$(window).resize(function() {
		if($(window).width() < 768) {
			if($("#category .secondDepth > li.on").children().hasClass("thirdDepth")) {
				$(".category").css("paddingBottom", 51);
			} else {
				$(".category").css("paddingBottom", 15);
			}
		} else {
			$(".category").css("paddingBottom", 51);
		}
	});

	/* 검색결과 - 전체선택 */
	$("#chkAll").click(function(){
		if($("#chkAll").is(":checked")){
			$(".chk").prop("checked", true);
		} else {
			$(".chk").prop("checked", false);
		}
	});

	/* 검색결과 - 전체선택 */
	$(".chkAll").keydown(function(e){
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			if(!$("#chkAll").is(":checked")){
				$(".chk").prop("checked", true);
			} else {
				$(".chk").prop("checked", false);
			}
		}
	});

	/* 검색결과 - 단일선택 */
	$(".cart label").on("keydown", function(e){
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			if(!$(this).prev().is(":checked")){
				$(this).prev().prop("checked", true);
			} else {
				$(this).prev().prop("checked", false);
			}
		}
	});

	/* 검색결과 - 단일선택 */
	$(document).on("keydown", ".item .cart label" , function(e){
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			if(!$(this).prev().is(":checked")){
				$(this).prev().prop("checked", true);
			} else {
				$(this).prev().prop("checked", false);
			}
		}
	});

	$(".searchMore label").keydown(function(e){
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			if(!$(this).prev().is(":checked")){
				$(this).prev().prop("checked", true);
			} else {
				$(this).prev().prop("checked", false);
			}
		}
	});

	/* 내보내기 */
	$(".dataInfo .export").click(function(){
		$(this).toggleClass("on");
	});

	/* 다국어 입력 */
	$(".searchKeyboard").on("click", function(){
		if($(this).parent().children(".keyboard").css("display") == "none"){
			$(this).parent().children(".keyboard").show();
			$(this).parent().children(".keyboard").css("opacity", 0).animate({opacity:1}, 200);

			var keyboardId = $(this).parent().children(".keyboard").attr("id");
			if (keyboardId == "keyboard") {
				G_MULTI_LANG_TYPE = "L";
			} else if (keyboardId == "detailKeyboard") {
				G_MULTI_LANG_TYPE = "D";
			}
			// in common.js

			// radio 초기화
			$("#" + keyboardId + " > ol > li").removeClass("on");
			$("#" + keyboardId + " > ol > li:first").addClass("on");
			$("#" + keyboardId + " > ol > li").children("input").prop("checked", false);
			$("#" + keyboardId + " > ol > li:first").children("input").prop("checked", true);

			// 데이터 초기화
			$("#" + keyboardId + " .list > ul > li:first").addClass("on");
			changeMultiLang($("#" + keyboardId + " .list:first > ul > li:first > a"), "marrCode3"); // in common.js
			$("#" + keyboardId + " > ol > li > label:first").focus();

		} else {
			$(this).parent().children(".keyboard").css("opacity", 1).animate({opacity:0}, 200);
			$(this).parent().children(".keyboard").hide();
		}
	});
	$(".keyboard .close").on("click", function(){ /* 다국어입력 닫기 */
		$(this).parent(".keyboard").css("opacity", 1).animate({opacity:0}, 200);
		$(this).parent(".keyboard").hide();
		$(".searchKeyboard").focus();
	});
	$("#keyboard > .close a").focusout(function() {
		$("#keyboard").hide();
		$(".searchKeyboard").focus();
	});

	$(window).resize(function() {
		if($(window).width() < 768){
			$(".keyboard").hide();
			$(".searchKeyboard").focus();
		}
	});

	$("#keyboard > ol > li").on("click", function(e) {
		e.preventDefault();
		$(this).parent().find("li").children("input").prop("checked", false);
		$(this).children("input").prop("checked", true);

		if ($(this).children("input").prop("checked", true)) {
			$("#keyboard > ol > li").removeClass("on");
			$(this).addClass("on");

			if ($(this).children("input").attr("id") == "keyboard1") {
				changeMultiLang($("#keyboard .list:first > ul > li:first > a"), "marrCode3");
			} else if ($(this).children("input").attr("id") == "keyboard2") {
				changeMultiLang($("#keyboard .list:eq(1) > ul > li:first > a"), "marrCode13");
			}

			$("#keyboard .list > ul > li").on("click focus", function(e) {
				e.preventDefault();
				$(this).parent().children("li").removeClass("on");
				$(this).addClass("on");
			});
		}
	});

	$("#keyboard > ol > li").on("keydown", function(e) {
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			$(this).parent().find("li").children("input").prop("checked", false);
			$(this).children("input").prop("checked", true);

			if ($(this).children("input").prop("checked", true)) {
				$("#keyboard > ol > li").removeClass("on");
				$(this).addClass("on");

				if ($(this).children("input").attr("id") == "keyboard1") {
					changeMultiLang($("#keyboard .list:first > ul > li:first > a"), "marrCode3");
				} else if ($(this).children("input").attr("id") == "keyboard2") {
					changeMultiLang($("#keyboard .list:eq(1) > ul > li:first > a"), "marrCode13");
				}

				$("#keyboard .list > ul > li").on("click focus", function(e) {
					e.preventDefault();
					$(this).parent().children("li").removeClass("on");
					$(this).addClass("on");
				});
			}
		}
	});

	$("#keyboard > ol > li").on("change keyup", function(e) {
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			$(this).parent().find("li").children("input").prop("checked", false);
			$(this).children("input").prop("checked", true);

			if ($(this).children("input").prop("checked", true)) {
				$("#keyboard > ol > li").removeClass("on");
				$(this).addClass("on");

				if ($(this).children("input").attr("id") == "keyboard1") {
					changeMultiLang($("#keyboard .list:first > ul > li:first > a"), "marrCode3");
				} else if ($(this).children("input").attr("id") == "keyboard2") {
					changeMultiLang($("#keyboard .list:eq(1) > ul > li:first > a"), "marrCode13");
				}

				$("#keyboard .list > ul > li").on("click focus", function(e) {
					e.preventDefault();
					$(this).parent().children("li").removeClass("on");
					$(this).addClass("on");
				});
			}
		}
	});

	/* 원문보기, 다운로드 */
/*	$(".dataInfo .original2, .dataInfo .download").on("click", function(){
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(".searchList .detail").not(".originalDetail").hide();

		$(this).next(".originalDetail").slideToggle('fast');
	});*/
/*	$(".dataInfo .original2").on("click", function(){
		$(".dataInfo .download").next(".originalDetail").slideUp('fast');
	});
	$(".dataInfo .download").on("click", function(){
		$(".dataInfo .original2").next(".originalDetail").slideUp('fast');
	});
*/
	/* 상세검색 - 다국어입력 */
	$("#detailKeyboard > ol > li").on("click", function(e) {
		e.preventDefault();
		$(this).parent().find("li").children("input").prop("checked", false);
		$(this).children("input").prop("checked", true);

		if($(this).children("input").prop("checked", true)) {
			$("#detailKeyboard > ol > li").removeClass("on");
			$(this).addClass("on");

			if ($(this).children("input").attr("id") == "keyboard1") {
				changeMultiLang($("#detailKeyboard .list:first > ul > li:first > a"), "marrCode3");
			} else if ($(this).children("input").attr("id") == "keyboard2") {
				changeMultiLang($("#detailKeyboard .list:eq(1) > ul > li:first > a"), "marrCode13");
			}

			$("#detailKeyboard .list > ul > li").on("click focus", function(e) {
				e.preventDefault();
				$(this).parent().children("li").removeClass("on");
				$(this).addClass("on");
			});
		}
	});


	$("#detailKeyboard > ol > li").on("change keyup", function(e) {
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			$(this).parent().find("li").children("input").prop("checked", false);
			$(this).children("input").prop("checked", true);

			if($(this).children("input").prop("checked", true)) {
				$("#detailKeyboard > ol > li").removeClass("on");
				$(this).addClass("on");

				if ($(this).children("input").attr("id") == "keyboard1") {
					changeMultiLang($("#detailKeyboard .list:first > ul > li:first > a"), "marrCode3");
				} else if ($(this).children("input").attr("id") == "keyboard2") {
					changeMultiLang($("#detailKeyboard .list:eq(1) > ul > li:first > a"), "marrCode13");
				}

				$("#detailKeyboard .list > ul > li").on("click focus", function(e) {
					e.preventDefault();
					$(this).parent().children("li").removeClass("on");
					$(this).addClass("on");
				});
			}
		}
	});


	/* 상세보기 - 자료구분 */
	var $dataRadio=$("#detailSearch .bottom .section.first > div > ol > li > *");
	$("#detailSearch .bottom .section.first > div > ol > li:first").addClass("on");
	$("#detailSearch .bottom .section.first > div > ol > li:first").children("input").prop("checked", true);
	$dataRadio.on("click", function(e) {
		e.preventDefault();
		if($(this).prev("input:radio").val()){
			$(this).parent().parent().find("li").removeClass("on");

			$(this).parent().addClass("on");
			$(this).prev("input:radio").prop("checked", true);

			$(this).parent().find(".secondDepth > div > ol > li:first").addClass("on");
			$(this).parent().find(".secondDepth > div > ol > li:first").children("input:radio").prop("checked", true);

			var y = $("#detailSearch .bottom .section.first").height();
			var z = $(this).parent().children(".secondDepth").height();

			if($(this).prev("input:radio").val() == "KINX_ALL") {
				if($(window).width() < 352) {
					z = 127;
				} else if($(window).width() < 382) {
					z = 126;
				} else if($(window).width() < 682) {
					z = 99;
				} else if($(window).width() < 769) {
					z = 72;
				} else if($(window).width() < 964) {
					z = 75;
				} else if($(window).width() < 1192) {
					z = 48;
				} else {
					z = 30;
				}
			} else if($(this).prev("input:radio").val() == "KDMT_ALL") {
				if($(window).width() < 323) {
					z = 73;
				}
			}

			if($(this).parent().children().hasClass("secondDepth")) {
				$(".secondDepth").css('top', y);
				$("#detailSearch .bottom .section.first").css('paddingBottom', z);
			} else {
				$(".secondDepth").css('top', 0);
				$("#detailSearch .bottom .section.first").css('paddingBottom', 0);
			}

			var checkedValue = $(this).prev("input:radio").val();

			if (checkedValue == "KDMT_ALL") {
				$("#btnDegree").show();
			} else {
				$("#btnDegree").hide();
			}

			if (checkedValue == "KINX_ALL") {
				$("#btnSeries").show();
			} else {
				$("#btnSeries").hide();
			}

			//영상자료목록 버튼 추가, 20210712 김현재
			if (checkedValue == "NONB_ALL") {
				$("#btnVideoDataList").show();
			} else {
				$("#btnVideoDataList").hide();
			}

			if($(this).prev("input:radio").val() == 'MONO_ALL'){
				checkedValue = 'MONO_ALL';
			}
			loadCriteriaFields(checkedValue); // in inner.js
		}
		return false;
	});

	$dataRadio.on("change keyup", function(e) {
		var nKey = parseInt(e.keyCode);
		if($(this).prev("input:radio").val()){
			if(nKey == 32){
				e.preventDefault();
				$(this).parent().parent().find("li").removeClass("on");
				//$(this).parent().parent().find("li").children("input").prop("checked", false);

				$(this).parent().addClass("on");
				$(this).prev("input:radio").prop("checked", true);

				$(this).parent().find(".secondDepth > div > ol > li:first").addClass("on");
				$(this).parent().find(".secondDepth > div > ol > li:first").children("input:radio").prop("checked", true);

				var y = $("#detailSearch .bottom .section.first").height();
				var z = $(this).parent().children(".secondDepth").height();
				//$('#criteriaForm > fieldset > div.section.first > h3 > label').html(y);
				if($(this).prev("input:radio").val() == "KINX_ALL") {
					if($(window).width() < 352) {
						z = 127;
					} else if($(window).width() < 382) {
						z = 126;
					} else if($(window).width() < 682) {
						z = 99;
					} else if($(window).width() < 769) {
						z = 72;
					} else if($(window).width() < 964) {
						z = 75;
					} else if($(window).width() < 1192) {
						z = 48;
					} else {
						z = 30;
					}
				} else if($(this).prev("input:radio").val() == "KDMT_ALL") {
					if($(window).width() < 323) {
						z = 73;
					}
				}

				if($(this).parent().children().hasClass("secondDepth")) {
					$(".secondDepth").css('top', y);
					$("#detailSearch .bottom .section.first").css('paddingBottom', z);
				} else {
					$(".secondDepth").css('top', 0);
					$("#detailSearch .bottom .section.first").css('paddingBottom', 0);
				}

				var checkedValue = $(this).prev("input:radio").val();

				//alert('sub');
				if (checkedValue == "KDMT_ALL") {
					$("#btnDegree").show();
				} else {
					$("#btnDegree").hide();

				}

				if (checkedValue == "KINX_ALL") {
					$("#btnSeries").show();
				} else {
					$("#btnSeries").hide();

				}

				//영상자료목록 버튼 추가, 20210712 김현재
				if (checkedValue == "NONB_ALL") {
					$("#btnVideoDataList").show();
				} else {
					$("#btnVideoDataList").hide();
				}

				loadCriteriaFields(checkedValue); // in inner.js
			}
		}

		return false;
	});

	var $secondRadio=$("#detailSearch .secondDepth > div > ol > li > *");
	$secondRadio.on("click", function(e) {
		e.preventDefault();
		$(this).parent().parent().find("li").removeClass("on");
		//$(this).parent().parent().find("li").children("input").prop("checked", false);

		$(this).parent().addClass("on");
		$(this).prev("input:radio").prop("checked", true);

		var checkedValue = $(this).prev("input:radio").val();
		//외국법률(TLAW) 분리
		if (checkedValue == "TLAW") {
			loadTlawFields(checkedValue); // in inner.js
		} else {
			loadCriteriaFields(checkedValue); // in inner.js
		}
		return false;
	});

	var $secondRadio=$("#detailSearch .secondDepth > div > ol > li > *");
	$secondRadio.on("change keyup", function(e) {
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			$(this).parent().parent().find("li").removeClass("on");
			//$(this).parent().parent().find("li").children("input").prop("checked", false);

			$(this).parent().addClass("on");
			$(this).prev("input:radio").prop("checked", true);

			var checkedValue = $(this).prev("input:radio").val();
			//외국법률(TLAW) 분리
			if (checkedValue == "TLAW") {
				loadTlawFields(checkedValue); // in inner.js
			} else {
				loadCriteriaFields(checkedValue); // in inner.js
			}
			$("input[type=radio]").next("label").attr("tabindex", "");
		}

		return false;
	});

	$secondRadio.focusout(function() {
		$("input[type=radio]").next("label").attr("tabindex", "0");
	});

	/* 상세보기 - 자료구분 하위 메뉴 높이 설정 (창크기에 따라 조절) */
	$(window).resize(function() {
		var y = $("#detailSearch .bottom .section.first").height();
		var z = $("#detailSearch .bottom .section.first > div > ol > li.on").children(".secondDepth").height();

		if($("#detailSearch .bottom .section.first > div > ol > li.on").children().hasClass("secondDepth")) {
			$("#detailSearch .secondDepth").css('top', y);
			$("#detailSearch .bottom .section.first").css('paddingBottom', z);
		} else {
			$("#detailSearch .secondDepth").css('top', 0);
			$("#detailSearch .bottom .section.first").css('paddingBottom', 0);
		}

	});

	/* 내서재 관리(레이어팝업) */
	$("#chk1All").click(function(){
		if($("#chk1All").prop("checked")){
			$(".chk1").prop("checked", true);
		} else {
			$(".chk1").prop("checked", false);
		}
	});
	$("#chk1PrintAll").click(function(){
		if($("#chk1PrintAll").prop("checked")){
			$(".chk1").prop("checked", true);
		} else {
			$(".chk1").prop("checked", false);
		}
	});

	/* 저자명 참조(레이어팝업) */
	$("#chk2All").click(function(){
		if($("#chk2All").prop("checked")){
			$(".chk2").prop("checked", true);
		} else {
			$(".chk2").prop("checked", false);
		}
	});

	/* 용어관계사전(레이어팝업) */
	$("#chk3All").click(function(){
		if($("#chk3All").prop("checked")){
			$(".chk3").prop("checked", true);
		} else {
			$(".chk3").prop("checked", false);
		}
	});
	$("#chk4All").click(function(){
		if($("#chk4All").prop("checked")){
			$(".chk4").prop("checked", true);
		} else {
			$(".chk4").prop("checked", false);
		}
	});
	$("#chk5All").click(function(){
		if($("#chk5All").prop("checked")){
			$(".chk5").prop("checked", true);
		} else {
			$(".chk5").prop("checked", false);
		}
	});
	$("#chk6All").click(function(){
		if($("#chk6All").prop("checked")){
			$(".chk6").prop("checked", true);
		} else {
			$(".chk6").prop("checked", false);
		}
	});
	$("#chk7All").click(function(){
		if($("#chk7All").prop("checked")){
			$(".chk7").prop("checked", true);
		} else {
			$(".chk7").prop("checked", false);
		}
	});
	$("#chk8All").click(function(){
		if($("#chk8All").prop("checked")){
			$(".chk8").prop("checked", true);
		} else {
			$(".chk8").prop("checked", false);
		}
	});

	/* 외부기관 검색 : 자료구분 전체선택 */
	$("#chk9All").click(function(){
		if($("#chk9All").prop("checked")){
			$(".chk9").prop("checked", true);
		} else {
			$(".chk9").prop("checked", false);
		}
	});

	/* 검색결과 - 전체선택 */
	$(".dataSort label").keydown(function(e){
		var nKey = parseInt(e.keyCode);
		if(nKey == 32){
			e.preventDefault();
			if($(this).prev().attr('id') == 'chk9All'){
				if(!$(this).prev().is(":checked")){
					$(this).prev().prop("checked", true);
					$(".chk9").prop("checked", true);
				} else {
					$(this).prev().prop("checked", false);
					$(".chk9").prop("checked", false);
				}
			} else {
				if(!$(this).prev().is(":checked")){
					$(this).prev().prop("checked", true);
				} else {
					$(this).prev().prop("checked", false);
				}
				if($("input:checkbox[name=chk_outer_api]:checked").length == 7){
					$("#chk9All").prop("checked", true);
				}else {
					$("#chk9All").prop("checked", false);
				}
			}
		}
	});

	$(".chk9").click(function(){
		if ($("input:checkbox[name=chk_outer_api]:checked").length == 7) {
			if(!($("#chk9All").prop("checked"))) {
				$("#chk9All").prop("checked", true);
			}
		} else {
			$("#chk9All").prop("checked", false);
		}
	});

	$("body").click(function(e) {
		if(!$("#search").has(e.target).length) {
			$(".autoComplete").hide();
		}
		if(!$("#refAuthor .selectWrap").has(e.target).length) {
			$(".authorNameAutocomplete").hide();
		}
	});

	/* 대체학위 - 목차 / 초록 / 해제 */
	$(".degreeList .dataInfo .infoBtn2.arrow").on("click", function() {
		if($(this).hasClass("on")) {
			$(this).removeClass("on");
			$(".degreeList .detail").slideUp("fast");
		} else {
			$(".degreeList .dataInfo > a").removeClass("on");
			$(".degreeList .detail").slideUp("fast");
			$(this).addClass("on");

			if($(this).hasClass("toc")) {
				$(this).parent().parent().children(".tocDetail").slideDown("fast");
			} else if($(this).hasClass("abs")) {
				$(this).parent().parent().children(".absDetail").slideDown("fast");
			} else if($(this).hasClass("exp")) {
				$(this).parent().parent().children(".expDetail").slideDown("fast");
			}
		}
	});

	/* 대체학위 상세페이지 - 더보기 */
	$(".degreeDetail .section .more").on("click", function() {
		$(this).toggleClass("on");
		$(this).parent().children(".box").toggleClass("on");
		if($(this).parent().children(".box").hasClass("on")) {
			$(this).text("접기");
		} else {
			$(this).text("더보기");
		}
	});

	$('.searchMore a').focus();

	//클릭시 메시지
	$(".alertMsg").on("click", function() {
		alert($(this).attr('title'));
	});

});
