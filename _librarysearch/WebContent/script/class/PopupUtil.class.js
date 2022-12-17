var PopupUtil = (function() {

	var Class = function() {
		// do nothing
	};

	/**
	 * [Public Static]
	 * GET 방식의 queryString 이 추가된 문자열을 얻는다
	 * @param baseURL
	 * @param paramObj
	 * @return
	 */
	Class.createQueryStringURL = function(baseURL, paramObj) {

		var url = baseURL;

		var queryString = "";
		if (paramObj != null) {
			for (var attrName in paramObj) {
				if (queryString != "") {
					queryString += "&";
				}
				if (JSUtil.isArray(paramObj[attrName])) {
					var arrayQueryString = "";
					for (var i = 0; i < paramObj[attrName].length; i++) {
						if (arrayQueryString != "") {
							arrayQueryString += "&";
						}
						arrayQueryString += attrName + "="
							+ encodeURIComponent(getPopupParamValue(paramObj[attrName][i]));
					}
					queryString += arrayQueryString;
				} else {
					queryString += attrName + "=" + encodeURIComponent(getPopupParamValue(paramObj[attrName]));
				}
			}
		}

		if (queryString != "") {
			if (url.indexOf("?") < 0) {
				url += "?" + queryString;
			} else {
				url += "&" + queryString;
			}
		}

		return url;
	};

	/**
	 * [Public Static]
	 * 팝업에 파라메터를 추가해서 띄웁니다. 사용법은 아래와 같습니다.
	 *
	 * var popupRef = PopupUtil.openWindow({
	 *     url : "/search/ebook.do",
	 *     name : "test",
	 *     width : 800,
	 *     height : 600,
	 *     moveCenter : true,
	 *     status : true,
	 *     scrollbars : true,
	 *     resizable : true,
	 *
	 *     method : "get",
	 *     param : {
	 *         oid : "wt.part.WTPart:12345",
	 *         userIds : [
	 *             "hong", "lee"
	 *         ]
	 *     },
	 *     callbackName : "opener.callbackMyTest",
	 *     callbackContext : {
	 *         targetId : "partNumber"
	 *     }
	 * });
	 *
	 * @param config 팝업설정
	 * @return 팝업 윈도우 레퍼런스
	 */
	Class.openWindow = function(config) {

		// #. cofig 초기화
		if (config == null) {
			config = {};
		}

		var defaultWidth = 400;
		var defaultHeight = 300;

		// #. config 인자 초기화
		var url = (config.url == null) ? "" : config.url;
		var name = (config.name == null) ? "" : config.name;

		var width = (!isNaN(config.width)) ? config.width : defaultWidth;
		var height = (!isNaN(config.height)) ? config.height : defaultHeight;
		var status = (config.status !== false) ? "1" : "0";
		var scrollbars = (config.scrollbars !== false) ? "1" : "0";
		var resizable = (config.resizable !== false) ? "1" : "0";
		var moveCenter = (config.moveCenter !== false);

		var method = (config.method != null && config.method.toLowerCase() == "post") ? "post" : "get";
		var param = (config.param != null) ? config.param : {};
		var callbackName = (config.callbackName != null) ? config.callbackName : "";
		var callbackContext = (config.callbackContext != null) ? config.callbackContext : {};

		// #. 팝업 특성 생성
		var popupFeatures = "toolbar=0,location=0,menubar=0.location=0" + ",status=" + status
				+ ",scrollbars=" + scrollbars + ",resizable=" + resizable
				+ ",width=" + width + ",height=" + height;
		if (moveCenter) {
			popupFeatures += ",top=" + Math.ceil((window.screen.height - height) / 2);
			popupFeatures += ",left=" + Math.ceil((window.screen.width - width) / 2);
		}
		// #. 전체 파라메터 객체 통합
		var allParam = {
			popup : true
		};
		for (var attrName in param) {
			allParam[attrName] = param[attrName];
		}

		// #. method 에 따라 팝업을 띄우기
		if (method == "post") {

			// #. 동적으로 임시 form 생성
			var popupForm = document.createElement("FORM");
			popupForm.method = "post";
			popupForm.action = url;

			for (var paramName in allParam) {
				var paramValue = allParam[paramName];
				if (paramValue != null) {
					if (JSUtil.isArray(paramValue)) {
						for (var i = 0; i < paramValue.length; i++) {
							popupForm.appendChild(createPopupHiddenElement(paramName, paramValue[i]));
						}
					} else {
						popupForm.appendChild(createPopupHiddenElement(paramName, paramValue));
					}
				}
			}
			popupForm = document.body.appendChild(popupForm);

			// #. 팝업생성 후 폼 제출
			var popupRef = window.open("", name, popupFeatures);
			popupForm.target = name;
			popupForm.submit();

			// #. 임시폼 삭제
			document.body.removeChild(popupForm);

			return popupRef;
		} else {
			//var targetURL = Class.createQueryStringURL(url, allParam);
			var targetURL = Class.createCallbackQueryString(url, callbackName, allParam, callbackContext);
			return window.open(targetURL, name, popupFeatures);
		}
	};

	/**
	 * [Public Static]
	 * 팝업에 사용되는 callbackName, param, callbackContext 이 붙은 파라메터를 생성한다
	 * @param baseURL 기본 URL
	 * @param callbackName 콜백 js 함수명
	 * @param param 파라메터
	 * @param callbackContext 되돌려받을 js 객체
	 */
	Class.createCallbackQueryString = function(baseURL, callbackName, param, callbackContext) {
		if (param == null) {
			param = {};
		}
		if (callbackName != null && callbackName.length > 0) {
			param.callbackName = callbackName;
		}
		if (callbackContext != null) {
			// #. jQuery 나 ExtJS 지원여부에 따라 callbackContext를 json 으로 변환
			var callbackContextJson = JSUtil.objectToString(callbackContext);
			if (callbackContextJson != null) {
				param.callbackContext = callbackContextJson;
			}
		}
		return Class.createQueryStringURL(baseURL, param);
	};

	/**
	 * [Public Static]
	 * 콜백을 수행한다. 주로 popup 에서 사용됨.
	 * IE8 에서는 콜백시에 객체로 만들지 말고 Json 을 그대로 콜백함
	 * @param callbackName 콜백 함수명
	 * @param callbackObj 선택객체
	 * @param callbackContext Mixed(String/Object) 되돌려받을 객체 또는 JSON
	 * @param scope 콜백 scope. (dafault window)
	 */
	Class.execCallback = function(callbackName, callbackObj, callbackContext, scope) {
		// #. 콜백함수 조회
		try {
			if (callbackName != null && callbackName.length > 0) {
				var callbackFunc = eval(callbackName);
				if (callbackFunc != null) {
					// #. jQuery 나 ExtJS 지원여부에 따라 callbackContextJson를 객체로 변환
					var context = null;
					if (callbackContext != null) {
						if (JSUtil.isObject(callbackContext)) {
							context = callbackContext;
						} else {
							// #. 문자열 객체 변환
							var callbackContextJson = callbackContext;
							if (callbackContextJson.length > 0) {
								context = JSUtil.stringToObject(callbackContextJson);
							}
						}
					}
					// #. call scope 지정
					if (scope == null) {
						scope = this;
					}
					callbackFunc.call(scope, self, callbackObj, context);
				}
			}
		} catch (e) {
			alert(e.message);
		}
	};

	/**
	 * [Private static]
	 * INPUT 태그를 동적으로 생성한다. 단, value 가 Object 이면 textarea 를 생성한다
	 * @param name String. 요소명
	 * @param value Object. 값
	 */
	var createPopupHiddenElement = function(name, value) {
		if (name == null || value == null) {
			return null;
		}
		var hiddenInput = document.createElement("INPUT");
		hiddenInput.type = "hidden";
		hiddenInput.name = name;
		hiddenInput.value = getPopupParamValue(value);
		return hiddenInput;
	};

	/**
	 * [Private static]
	 * 파라메터로 사용될 값을 얻는다 (객체일 경우 Json 문자열을 리턴한다)
	 * @param obj Object. 객체
	 * @return 값이 없다면 빈 문자열 리턴
	 */
	var getPopupParamValue = function(obj) {
		if (obj == null) {
			return null;
		}

		if (JSUtil.isObject(obj)) {
			if (JSUtil.isJQuery()) {
				return JSON.stringify(obj);
			}
		} else {
			return obj;
		}
	};

	return Class;
})();


