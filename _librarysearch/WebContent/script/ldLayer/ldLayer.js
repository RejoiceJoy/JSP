/*
 * ldLayer v1.0.1
 * Copyright 2022.07.19 DH.Song
 */
var $el;
var $ldOpt;
var c_el = "";
var sec = 0;
var secInterval = null;
var setTimer = null;

!(function(option) {
	var defaults = {
		maxSecondTime: 0,
		secondTimeViewYn: true,
		secondTimeFontSize: '',
		secondTimeFontColor: '',
		secondTimeFontBold: false,
		
		msgValViewYn: true,
		msgVal: 'Loading...',
		msgFontSize: '',
		msgFontColor: '',
		msgFontBold: false,
		
		loadingImgViewYn: true,
		loadingImgWidth: '',
		loadingImgHeight: '',
		loadingImgSrc: '/script/ldLayer/img/loading_img0.gif'
	};
	
	$.ldLayer = function(option) {
		var init = function() {
			ldLog("ldLayer: Init Start.");
			
			$ldOpt = {}
			$ldOpt.set = $.extend({}, defaults, option);
			
			$ldOpt.set.maxSecondTime = ($ldOpt.set.maxSecondTime > 0)?($ldOpt.set.maxSecondTime * 1000):$ldOpt.set.maxSecondTime;
			
			if(createLdArea()) {
				ldLog("ldLayer: Create ldLayer Success.");
				
				if(createLdContentBx()) {
					ldLog("ldLayer: Create ldContentBx Success.");
					
					if($ldOpt.set.loadingImgViewYn) {
						createLdImg();
					}
					
					if($ldOpt.set.msgValViewYn) {
						createLdMsg();
					}
					
					if($ldOpt.set.secondTimeViewYn) {
						createLdSecond();
					}
					
					setStyle();
				} else {
					ldLog("ldLayer: Create ldContentBx Failed.");
				}
			} else {
				ldLog("ldLayer: Create ldLayer Failed.");
			}
		};
		
		init();
	};
	
	var createLdArea = (function() {
		$el = $('#ldArea'); 
		if(_elChk($el)) {
			if($el.children().length > 0) {
				$el.children().remove();
			}
		} else {
			var ldArea = document.createElement("div");
			ldArea.id = "ldArea";
			ldArea.className = "ldArea";
			document.body.appendChild(ldArea);
			$el = $('#ldArea');
		}
		
		return (_elChk($el)) ? true:false;
	});

	var createLdContentBx = function() {
		if(_elChk($el)) {
			c_el = "<div id=\""+$el.prop('id')+"Bg\" class=\""+$el.prop('id')+"Bg\"></div>";
			c_el += "<div id=\""+$el.prop('id')+"ContentBx\" class=\""+$el.prop('id')+"ContentBx\">";
			c_el += "</div>";
			$el.append(c_el);
			
			return true;
		}
		
		return false;
	};

	var createLdImg = function() {
		if(_elChk($el)) {
			if($ldOpt.set.loadingImgWidth != '' && $ldOpt.set.loadingImgHeight != '') {
				c_el = "<div id=\""+$el.prop('id')+"ContentImg\" class=\""+$el.prop('id')+"ContentImg\"><img src=\""+$ldOpt.set.loadingImgSrc+"\" width=\""+$ldOpt.set.loadingImgWidth+"\" height=\""+$ldOpt.set.loadingImgHeight+"\" /></div>";
			} else {
				c_el = "<div id=\""+$el.prop('id')+"ContentImg\" class=\""+$el.prop('id')+"ContentImg\"><img src=\""+$ldOpt.set.loadingImgSrc+"\" /></div>";
			}
			
			$("#"+$el.prop('id')+"ContentBx").append(c_el);
		}
	};
	
	var createLdMsg = function() {
		if(_elChk($el)) {
			if($ldOpt.set.msgVal != '') {
				if(_elChk($("#"+$el.prop('id')+"ContentImg"))) {
					c_el = "<br><span id=\""+$el.prop('id')+"Msg\" class=\""+$el.prop('id')+"Msg\">"+$ldOpt.set.msgVal+"</span>";
					$("#"+$el.prop('id')+"ContentImg").append(c_el);
				} else {
					c_el = "<div id=\""+$el.prop('id')+"Content\" class=\""+$el.prop('id')+"Content\"><span id=\""+$el.prop('id')+"Msg\">"+$ldOpt.set.msgVal+"</span></div>";
					$("#"+$el.prop('id')+"ContentBx").append(c_el);
				}
			}
		}
	};
	
	var createLdSecond = function() {
		if(_elChk($el)) {
			if($ldOpt.set.secondTimeViewYn && $ldOpt.set.maxSecondTime > 0) {
				if(_elChk($("#"+$el.prop('id')+"ContentImg"))) {
					c_el = "<br><span id=\""+$el.prop('id')+"Sec\" class=\""+$el.prop('id')+"Sec\">"+$ldOpt.set.maxSecondTime+"</span>";
					$("#"+$el.prop('id')+"ContentImg").append(c_el);
				} else if(_elChk($("#"+$el.prop('id')+"Content"))) {
					c_el = "<br><span id=\""+$el.prop('id')+"Sec\" class=\""+$el.prop('id')+"Sec\">"+$ldOpt.set.maxSecondTime+"</span>";
					$("#"+$el.prop('id')+"Content").append(c_el);
				} else {
					c_el = "<br><span id=\""+$el.prop('id')+"Sec\" class=\""+$el.prop('id')+"Sec\">"+$ldOpt.set.maxSecondTime+"</span>";
					$("#"+$el.prop('id')+"ContentBx").append(c_el);
				}
				
				if($ldOpt.set.secondTimeFontSize != '') {
					$("#"+$el.prop('id')+"Sec").css("font-size", $ldOpt.set.secondTimeFontSize);
				}
			}
		}
	};
	
	var setStyle = function() {
		if(_elChk($("#"+$el.prop('id')+"Msg")) && $ldOpt.set.msgFontSize != '') {
			$("#"+$el.prop('id')+"Msg").css("font-size", $ldOpt.set.msgFontSize);
		}
		
		if(_elChk($("#"+$el.prop('id')+"Msg")) && $ldOpt.set.msgFontColor != '') {
			$("#"+$el.prop('id')+"Msg").css("color", $ldOpt.set.msgFontColor);
		}
		
		if(_elChk($("#"+$el.prop('id')+"Msg")) && $ldOpt.set.msgFontBold) {
			$("#"+$el.prop('id')+"Msg").css("font-weight", "bold");
		}
		
		if(_elChk($("#"+$el.prop('id')+"Sec")) && $ldOpt.set.secondTimeFontSize != '') {
			$("#"+$el.prop('id')+"Sec").css("font-size", $ldOpt.set.secondTimeFontSize);
		}
		
		if(_elChk($("#"+$el.prop('id')+"Sec")) && $ldOpt.set.secondTimeFontColor != '') {
			$("#"+$el.prop('id')+"Sec").css("color", $ldOpt.set.secondTimeFontColor);
		}
		
		if(_elChk($("#"+$el.prop('id')+"Sec")) && $ldOpt.set.secondTimeFontBold) {
			$("#"+$el.prop('id')+"Sec").css("font-weight", "bold");
		}
	};
})(jQuery);

var ldLayerShow = (function() {
	if($el == undefined) {
		$.ldLayer();
	}
	
	intervalInit();
	$el.show();
	ldLog("ldLayer: ldLayer show.");
	
	if(_elChk($("#"+$el.prop('id')+"Sec"))) {
		sec = $ldOpt.set.maxSecondTime / 1000;
		$("#"+$el.prop('id')+"Sec").text("(" + sec + ")");
		
		secInterval = setInterval(function() {
			sec--;
			if(sec > -1) {
				$("#"+$el.prop('id')+"Sec").text("(" + sec + ")");
			}
		}, 1000);
	}
	
	if($ldOpt.set.maxSecondTime > 0) {
		setTimer = setTimeout(function() {
			ldLayerHide();
			intervalInit();
		}, ($ldOpt.set.maxSecondTime));
	}
});

var ldLayerHide = (function() {
	intervalInit();
	$el.hide();
	ldLog("ldLayer: ldLayer Hide.");
});

var ldLog = (function(msg) {
	console.log(msg);
});

function _elChk(el) {
	return(el.prop('tagName') != undefined)?true:false;
};

function intervalInit() {
	ldLog("ldLayer: Interval initialize.");
	
	if(secInterval != null) {
		clearInterval(secInterval);
		secInterval = null;
	}
	
	if(setTimer != null) {
		clearTimeout(setTimer);
		setTimer = null;
	}
	
	sec = 0;
};