var JSUtil = (function() {

	var Class = function() {
		// do nothing
	};

	/**
	 * [Public Static]
	 * 배열이면 true 를 리턴한다
	 * @param obj Object. 객체
	 * @return Array 여부
	 */
	Class.isArray = function(obj) {
		return (Object.prototype.toString.call(obj) === "[object Array]");
	};

	/**
	 * [Public Static]
	 * 객체이면 true 를 리턴한다
	 * @param obj Object. 객체
	 * @return Object 여부
	 */
	Class.isObject = function(obj) {
		return (Object.prototype.toString.call(obj) === "[object Object]");
	};

	/**
	 * [Public Static]
	 * 문자열이면 true 를 리턴한다
	 * @param obj Object. 객체
	 * @return String 여부
	 */
	Class.isString = function(obj) {
		return (Object.prototype.toString.call(obj) === "[object String]");
	};

	/**
	 * [Public Static]
	 * 숫자이면 true 를 리턴한다
	 * @param value 값
	 * @return 숫자 여부
	 */
	Class.isNumber = function(value) {
		return isNaN(value);
	};

	/**
	 * [Public Static]
	 * 정수이면 true 를 리턴한다
	 * @param value 값
	 * @return 정수 여부
	 */
	Class.isInteger = function(value) {
		if (!Class.isNumber) {
			return false;
		}
		var x = parseFloat(value);
		return ((x | 0) === x);
	};

	/**
	 * [Public Static]
	 * 부울형이면 true 를 리턴한다
	 * @param value 값
	 * @return Boolean 형 여부
	 */
	Class.isBoolean = function(value) {
		return (Object.prototype.toString.call(value) === "[object Boolean]");
	};

	/**
	 * [Public Static]
	 * jQuery 라이블러리가 활성화 되었다면 true 를 리턴한다
	 * @return JQuery 활성화 여부
	 */
	Class.isJQuery = function() {
		return (typeof jQuery != "undefined");
	};

	/**
	 * [Public Static]
	 * 현재 브라우저가 IE 임을 판단한다
	 * @return IE일 경우 버전번호를, IE가 아닌경우 false 를 리턴한다
	 */
	Class.isIE = function() {
		var userAgent = navigator.userAgent;
		if (userAgent.indexOf("Edge/") >= 0) {
			var pattern = new RegExp("^.*Edge/(\\d+)\\.([\\w.]+).*$", "ig");
			if (pattern.test(userAgent)) {
				return RegExp.$1;
			}
		} else if (userAgent.indexOf("Trident/7.") >= 0
				&& userAgent.indexOf("rv:") >= 0) { // IE11
			var pattern = new RegExp("^.*rv:(\\d+)\\.([\\w\\.]+).*$", "ig");
			if (pattern.test(userAgent)) {
				return RegExp.$1;
			}
		} else if (userAgent.indexOf("MSIE") >= 0) { // IE10 이하
			var pattern = new RegExp("^.*MSIE (\\d+)\\.([\\w.]+).*$", "ig");
			if (pattern.test(userAgent)) {
				return RegExp.$1;
			}
		}
		return false;
	};

	/**
	 * [Public Static]
	 * ExtJS or JQuery 를 사용하여 객체를 JSON 문자열로 변환한다.
	 * @param obj Object. 객체
	 * @param defaultObj Object. 디폴트 객체. optional. default null
	 * @return 변환된 문자열. 변환하지 못하면 null
	 */
	Class.objectToString = function(obj, defaultObj) {
		var str = null;
		if (obj != null) {
			try {
				if (Class.isJQuery()) {
					str = JSON.stringify(obj);
				}
			} catch (e) {
				Logger.log("JSUtil.objectToString() : " + e.message);
			}
		}
		if (obj == null && (typeof defaultObj != "undefined")) {
			return defaultStr;
		} else {
			return str;
		}
	};

	/**
	 * [Public Static]
	 * ExtJS or JQuery 를 사용하여 객체를 JSON 문자열로 변환한다.
	 * @param str JSON 문자열
	 * @param defaultStr String. 디폴트 JSON 문자열. optional. default null
	 * @return 변환된 객체. 변환하지 못하면 null
	 */
	Class.stringToObject = function(str, defaultStr) {
		var object = null;
		if (str != null && str.length > 0) {
			try {
				if (Class.isJQuery()) {
					object = JSON.parse(str);
				}
			} catch (e) {
				Logger.log("JSUtil.objectToString() : " + e.message);
			}
		}
		if (object == null && (typeof defaultStr != "undefined")) {
			return defaultStr;
		} else {
			return object;
		}
	};

	/**
	 * [Public Static]
	 * 특정요소의 이벤트를 발생시킵니다. (Chrome, IE11 에서 동작가능)
	 * @param eventSrc 이벤트를 발생시키는 요소
	 * @param eventName 이벤트명
	 */
	Class.fireEvent = function(eventSrc, eventName) {
		if (Class.isIE()) {
			var evt = document.createEvent("Events");
			evt.initEvent(eventName, true, false, eventSrc, 0);
			eventSrc.dispatchEvent(evt);
		} else {
			eventSrc.dispatchEvent(new Event(eventName));
		}
	};

	return Class;
})();
