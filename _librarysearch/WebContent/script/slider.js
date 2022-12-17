/*
 * jQuery UI Slider 
 *
 * Copyright (c) 2009 AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * http://docs.jquery.com/UI/Slider
 *
 * Depends:
 *	slider.main.js
 */

$(function() {
	$("#slider-range-min0").slider({
		range: "min",
		value: 1,
		min: 0,
		max: 2,
		slide: function(event, ui) {
			
			$("#weight0").val(ui.value * 50);
			$("#weightText0").text(getSliderText(ui.value));
		}
	});
	$("#weight0").val($("#slider-range-min0").slider("value") * 50);
	$("#weightText0").text(getSliderText($("#slider-range-min0").slider("value")));
});

$(function() {
	$("#slider-range-min1").slider({
		range: "min",
		value: 1,
		min: 0,
		max: 2,
		slide: function(event, ui) {
			
			$("#weight1").val(ui.value * 50);
			$("#weightText1").text(getSliderText(ui.value));
		}
	});
	$("#weight1").val($("#slider-range-min1").slider("value") * 50);
	$("#weightText1").text(getSliderText($("#slider-range-min1").slider("value")));
});

$(function() {
	$("#slider-range-min2").slider({
		range: "min",
		value: 1,
		min: 0,
		max: 2,
		slide: function(event, ui) {
			
			$("#weight2").val(ui.value * 50);
			$("#weightText2").text(getSliderText(ui.value));
		}
	});
	$("#weight2").val($("#slider-range-min2").slider("value") * 50);
	$("#weightText2").text(getSliderText($("#slider-range-min2").slider("value")));
});

function getSliderText(val) {
	var uiName = "상";
	if(val==1) {
		uiName = "중";
	}
	else if(val==0) {
		uiName = "하";
	}
	return uiName;
}