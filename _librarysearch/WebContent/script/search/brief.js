$(document).ready(function(){
	var gap= [];
	var groupTarget;
	var detailTimer;

	function mobileCheck(){
		var pc_device = "win16|win32|win64|mac|macintel";
		var this_device = navigator.platform;
		if(this_device){
			if(pc_device.indexOf(navigator.platform.toLowerCase()) < 0){
				return true;
			}else{
				return false;
			}
		}
	}

	$(this).find(".detail.dStyle1 .box").empty();
	$(this).find(".detail.dStyle2").empty();

	function listSizeCheck(){
		$(".searchList ul.list > li").each(function(index){
			$(this).find(".group").each(function(){
				if ($(this).find(".infoBtn2").hasClass("on")) {
					$(this).find(".infoBtn2").removeClass("on");
					$(this).find("> .detail").slideToggle(300);
				}
			});
			$(this).find(".dataInfo").removeAttr("height");
			$(this).find(".dataInfo").height("auto");

			if($(this).find(".dataInfo").height() > 63){
				$(this).find(".dataInfo .group > .detail").css("top", 106);
				gap[index] = 106;
			}else if($(this).find(".dataInfo").height() > 33 && $(this).find(".dataInfo").height() < 64){
				$(this).find(".dataInfo .group > .detail").css("top", 64);
				gap[index] = 64;
			}else{
				$(this).find(".dataInfo .group > .detail").css("top", 32);
				gap[index] = 32;
			}
		});
	}

	$(window).resize(function(){
		if(!mobileCheck()) listSizeCheck();
	});
	listSizeCheck();

	$('.aside .infoService .close').click(function(){
		$('.aside .infoService').fadeOut(300);
		return false;
	});

	$(window).scroll(function(){
		var scrollValue = $(document).scrollTop();
		if(scrollValue > 320){
			$('.aside .infoService').addClass('on');
		}else{
			$('.aside .infoService').removeClass('on');
		}
	});

	setTimeout(function(){
		$('.aside .infoService').fadeOut(300);
	},30000);

	function detailReSize (){
		clearInterval(detailTimer);
		var _index = $(groupTarget).closest("li").index();
		if($(groupTarget).find(".detail").hasClass("dStyle2")){
			if($(groupTarget).find(".detail").html() != ""){
				return;
			}
			detailTimer = setInterval(function(){
				if($(groupTarget).find(".detail").html() != ""){
					var _h = $(groupTarget).find(".detail").height()+(gap[_index]+32);
					$(groupTarget).closest(".dataInfo").animate({height: _h}, 200);
					clearInterval(detailTimer);
				}
			}, 10);
		}else{
			return;
		}
	}

	function detailReSize2 (){
		clearInterval(detailTimer);
		var _index = $(groupTarget).closest("li").index();
		if($(groupTarget).find(".detail").hasClass("dStyle1")){
			detailTimer = setInterval(function(){
				if($(groupTarget).find(".detail .box").html() != ""){
					var _h = $(groupTarget).find(".detail").height()+(gap[_index]+32);
					$(groupTarget).closest(".dataInfo").animate({height: _h}, 200);
					clearInterval(detailTimer);
				}
			}, 10);
		}else{
			return;
		}
	}

	function detailReSize3 (str){
		clearInterval(detailTimer);
		var _index = $(groupTarget).closest("li").index();
		if($(groupTarget).find(".detail").hasClass("dStyle2")){
			detailTimer = setInterval(function(){
				if($(groupTarget).find(".detail").html() != str){
					var _h = $(groupTarget).find(".detail").height()+(gap[_index]+32);
					$(groupTarget).closest(".dataInfo").animate({height: _h}, 200);
					clearInterval(detailTimer);
				}
			}, 10);
		}else{
			return;
		}
	}

	$(".searchList .detail.dStyle1").on("click", ".close", function(){
		var _index = $(this).closest("li").index();
		$(this).closest(".group").find("> .infoBtn2").removeClass("on");
		$(this).closest(".dataInfo").animate({height: gap[_index]}, 200);
		$(groupTarget).find(".infoBtn2").focus();
	});

	$(".searchList .detail.dStyle2").on("click", ".close", function(){
		var _index = $(this).closest("li").index();
		$(this).closest(".group").find("> .infoBtn2").removeClass("on");
		$(this).closest(".dataInfo").animate({height: gap[_index]}, 200);
		$(groupTarget).find(".infoBtn2").focus();
		$(this).closest(".dStyle2").html("");
	});

	$(".searchList .dStyle2").on("click", ".recommend a", function(){
		detailReSize3($(groupTarget).find(".detail").html());
	});

	/* ???????????? */
	$(".searchList .dataInfo .toc").on("click", function() {
		var _this = this;
		var _index = $(this).closest("li").index();
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(this).closest("li").siblings().find(".detail").hide();
		$(".searchList li .dataInfo").removeAttr("height");
		$(".searchList li .dataInfo").height("auto");
		$(".searchList .detail").not(".tocDetail").hide();
		$(this).closest(".dataInfo").height(gap[_index]);
		groupTarget = $(this).closest(".group");
		$(this).closest(".group").find(".detail").slideToggle(0, function(){
			if ($(_this).hasClass("on")) {
				$(_this).removeClass("on");
				$(_this).closest(".dataInfo").animate({height: gap[_index]}, 200);
			} else {
				$(_this).addClass("on");
				var _h = $(_this).closest(".group").find(".detail").height()+(gap[_index]+32)
				$(_this).closest(".dataInfo").animate({height: _h}, 200);

				detailReSize ();
			}
		});

	});

	/* ???????????? */
	$(".searchList .dataInfo .abs").on("click", function() {
		var _this = this;
		var _index = $(this).closest("li").index();
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(this).closest("li").siblings().find(".detail").hide();
		$(".searchList li .dataInfo").removeAttr("height");
		$(".searchList li .dataInfo").height("auto");
		$(".searchList .detail").not(".absDetail").hide();
		$(this).closest(".dataInfo").height(gap[_index]);
		groupTarget = $(this).closest(".group");
		$(this).closest(".group").find(".detail").slideToggle(0, function(){
			if ($(_this).hasClass("on")) {
				$(_this).removeClass("on");
				$(_this).closest(".dataInfo").animate({height: gap[_index]}, 200);
			} else {
				$(_this).addClass("on");
				var _h = $(_this).closest(".group").find(".detail").height()+(gap[_index]+32)
				$(_this).closest(".dataInfo").animate({height: _h}, 200);

				detailReSize ();
			}
		});
	});

	/* ???????????? */
	$(".searchList .dataInfo .exp").on("click", function() {
		var _this = this;
		var _index = $(this).closest("li").index();
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(this).closest("li").siblings().find(".detail").hide();
		$(".searchList li .dataInfo").removeAttr("height");
		$(".searchList li .dataInfo").height("auto");
		$(".searchList .detail").not(".expDetail").hide();
		$(this).closest(".dataInfo").height(gap[_index]);
		groupTarget = $(this).closest(".group");
		$(this).closest(".group").find(".detail").slideToggle(0, function(){
			if ($(_this).hasClass("on")) {
				$(_this).removeClass("on");
				$(_this).closest(".dataInfo").animate({height: gap[_index]}, 200);
			} else {
				$(_this).addClass("on");
				var _h = $(_this).closest(".group").find(".detail").height()+(gap[_index]+32)
				$(_this).closest(".dataInfo").animate({height: _h}, 200);

				detailReSize ();
			}
		});
	});

	/* ???????????? */
	$(".searchList .dataInfo .prc").on("click", function() {
		var _this = this;
		var _index = $(this).closest("li").index();
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(this).closest("li").siblings().find(".detail").hide();
		$(".searchList li .dataInfo").removeAttr("height");
		$(".searchList li .dataInfo").height("auto");
		$(".searchList .detail").not(".prcDetail").hide();
		$(this).closest(".dataInfo").height(gap[_index]);
		groupTarget = $(this).closest(".group");
		$(this).closest(".group").find(".detail").slideToggle(0, function(){
			if ($(_this).hasClass("on")) {
				$(_this).removeClass("on");
				$(_this).closest(".dataInfo").animate({height: gap[_index]}, 200);
			} else {
				$(_this).addClass("on");
				var _h = $(_this).closest(".group").find(".detail").height()+(gap[_index]+32)
				$(_this).closest(".dataInfo").animate({height: _h}, 200);

				detailReSize ();
			}
		});

	});

	/* ?????? - ?????? */
	$(".absDetail .btnWrap .close").on("click", function() {
		//$(".dataInfo .abs").removeClass("on");
		//$(".absDetail").slideUp(250);
	});

	/* ?????? - ?????? */
	$(".tocDetail .btnWrap .close").on("click", function() {
		//$(".dataInfo .toc").removeClass("on");
		//$(".tocDetail").slideUp(250);
	});

	/* ?????? - ?????? */
	$(".expDetail .btnWrap .close").on("click", function() {
		//$(".dataInfo .exp").removeClass("on");
		//$(".expDetail").slideUp(250);
	});

	$(".dStyle2 .tWrap table a").on("click", function() {
		setTimeout(function(){
			detailReSize();
		},10);
	});

	/* ?????? / ?????? / ?????? ????????? */
	$(".dStyle1 .more a").on("click", function() {
		$(this).toggleClass("on");
		$(this).parent().parent().children(".box").toggleClass("on");
		if($(this).parent().parent().children(".box").hasClass("on")) {
			$(this).text("??????");
		} else {
			$(this).text("?????????");
		}
		detailReSize2();
	});

	/* ??????????????? ?????? */
	$(".searchList .dataInfo .author").on("click", function() {
		var _this = this;
		var _index = $(this).closest("li").index();
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(this).closest("li").siblings().find(".detail").hide();
		$(".searchList li .dataInfo").removeAttr("height");
		$(".searchList li .dataInfo").height("auto");
		$(".searchList .detail").not(".authorDetail").hide();
		$(this).closest(".dataInfo").height(gap[_index]);
		groupTarget = $(this).closest(".group");
		$(this).closest(".group").find(".detail").slideToggle(0, function(){
			if ($(_this).hasClass("on")) {
				$(_this).removeClass("on");
				$(_this).closest(".dataInfo").animate({height: gap[_index]}, 200);
			} else {
				$(_this).addClass("on");
				var _h = $(_this).closest(".group").find(".detail").height()+(gap[_index]+32)
				$(_this).closest(".dataInfo").animate({height: _h}, 200);

				detailReSize ();
			}
		});
	});

	/* ???????????? */
	$(".searchList .dataInfo .volume").on("click", function() {
		var _this = this;
		var _index = $(this).closest("li").index();
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(this).closest("li").siblings().find(".detail").hide();
		$(".searchList li .dataInfo").removeAttr("height");
		$(".searchList li .dataInfo").height("auto");
		$(".searchList .detail").not(".volumeDetail").hide();
		$(this).closest(".dataInfo").height(gap[_index]);
		groupTarget = $(this).closest(".group");
		$(this).closest(".group").find(".detail").slideToggle(0, function(){
			if ($(_this).hasClass("on")) {
				$(_this).removeClass("on");
				$(_this).closest(".dataInfo").animate({height: gap[_index]}, 200);
			} else {
				$(_this).addClass("on");
				var _h = $(_this).closest(".group").find(".detail").height()+(gap[_index]+32)
				$(_this).closest(".dataInfo").animate({height: _h}, 200);

				detailReSize ();
			}
		});
	});

	/* ?????????????????? */
	$(".searchList .dataInfo .article").on("click", function() {
		var _this = this;
		var _index = $(this).closest("li").index();
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(this).closest("li").siblings().find(".detail").hide();
		$(".searchList li .dataInfo").removeAttr("height");
		$(".searchList li .dataInfo").height("auto");
		$(".searchList .detail").not(".articleDetail").hide();
		$(this).closest(".dataInfo").height(gap[_index]);
		groupTarget = $(this).closest(".group");
		$(this).closest(".group").find(".detail").slideToggle(0, function(){
			if ($(_this).hasClass("on")) {
				$(_this).removeClass("on");
				$(_this).closest(".dataInfo").animate({height: gap[_index]}, 200);
				$(_this).closest(".dataInfo").find(".footable-detail-row").css('display','none');
				$(_this).closest(".dataInfo").find(".viewWrap").css('display','none');
			} else {
				$(_this).addClass("on");
				var _h = $(_this).closest(".group").find(".detail").height()+(gap[_index]+32)
				$(_this).closest(".dataInfo").animate({height: _h}, 200);
				detailReSize ();
			}
		});
	});

	/* ???????????? */
	$(".searchList .dataInfo .usageStatus").on("click", function() {
		var _this = this;
		var _index = $(this).closest("li").index();
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(this).closest("li").siblings().find(".detail").hide();
		$(".searchList li .dataInfo").removeAttr("height");
		$(".searchList li .dataInfo").height("auto");
		$(".searchList .detail").not(".usageStatusDetail").hide();
		$(this).closest(".dataInfo").height(gap[_index]);
		groupTarget = $(this).closest(".group");
		$(this).closest(".group").find(".detail").slideToggle(0, function(){
			if ($(_this).hasClass("on")) {
				$(_this).removeClass("on");
				$(_this).closest(".dataInfo").animate({height: gap[_index]}, 200);
			} else {
				$(_this).addClass("on");
				var _h = $(_this).closest(".group").find(".detail").height()+(gap[_index]+32)
				$(_this).closest(".dataInfo").animate({height: _h}, 200);

				detailReSize ();
			}
		});
	});

	/* ?????????????????? */
	$(".searchList .dataInfo .relatedData").on("click", function() {
		var _this = this;
		var _index = $(this).closest("li").index();
		$(".searchList .dataInfo .arrow").not($(this)).removeClass("on");
		$(this).closest("li").siblings().find(".detail").hide();
		$(".searchList li .dataInfo").removeAttr("height");
		$(".searchList li .dataInfo").height("auto");
		$(".searchList .detail").not(".relatedDataDetail").hide();
		$(this).closest(".dataInfo").height(gap[_index]);
		groupTarget = $(this).closest(".group");
		$(this).closest(".group").find(".detail").slideToggle(0, function(){
			if ($(_this).hasClass("on")) {
				$(_this).removeClass("on");
				$(_this).closest(".dataInfo").animate({height: gap[_index]}, 200);
			} else {
				$(_this).addClass("on");
				var _h = $(_this).closest(".group").find(".detail").height()+(gap[_index]+32)
				$(_this).closest(".dataInfo").animate({height: _h}, 200);

				detailReSize ();
			}
		});
	});

	/* ??????????????? */
/*	$(".facet > ul > li > div > .infoGraphicImg > li > a").on("click", function() {
		$("#infoGraphic").slideToggle("fast");
	});
	$("#infoGraphic .close").on("click", function() {
		$("#infoGraphic").slideUp("fast");
	});
*/
	/* ???????????? */
	$(".exportPop .form .fStyle1 li").on("click", function(e) {
		e.preventDefault();
		$(this).children("input").prop("checked", true);

		$(".exportPop .scope").hide();
		$(".exportPop .inputWrap").hide();
		$(".exportPop .txt").hide();
		$(".exportPop").removeClass("email");
		$(".exportPop").removeClass("info");
		$(".exportPop").removeClass("default");

		if($(this).hasClass("html") || $(this).hasClass("print2") || $(this).hasClass("preview") || $(this).hasClass("excel")) {
			//$(".exportPop .scope").slideDown("fast");
			//$(".exportPop").addClass("default");
		} else if($(this).hasClass("eMail")) {
			$(".exportPop .scope").slideDown("fast");
			$(".exportPop .inputWrap").slideDown("fast");
			$(".exportPop").addClass("email");
		} else {
			if($(this).hasClass("riss")) {
				$(".exportPop .txt span").text("EndNote");
			}
			$(".exportPop .txt").slideDown("fast");
			$(".exportPop").addClass("info");
		}
	});

	/* ???????????????(?????????) ???????????? ??? z-index ?????? */
	$("#search_graph ul.panel .btn_view_large").on("click", function() {
		$("#search_graph").toggleClass("on");
	});

	/* ?????????????????? ?????? */
	$(".relatedDataDetail .btnWrap .btnVD").on("click", function() {
		$(this).parent().next(".detail").slideToggle("fast");
	});

	/* ???????????? ????????? */
	$(".aside .recommend .more").on("click", function() {
		$(this).toggleClass("on");
		$(this).parent().children(".list").toggleClass("on");
	});
});