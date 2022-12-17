var AjaxUtil = (function() {

	var Class = function() {
		// do nothing
	};

	/**
	 * [Public Static]
	 * HTML Form 을 Ajax 로 제출합니다.
	 * 이 함수를 사용하기 위해서는 페이지 상단에 jquery.form.js (http://malsup.com/jquery/form/) 가 추가되어야 합니다.
	 * @param form Mixed(jquery or String) 폼객체. e.g. myFormId or $("#myFormId")
	 * @param callback 콜백받을 함수. Ex. myCallback(response, context)
	 * @param context 콜백 이전 상태를 담은 컨텍스트 객체
	 * @param errorCallback Function(jqXHR, textStatus, errorThrown). 오류 발생시 콜백
	 */
	Class.submitFormByAjax = function(form, callback, context, errorCallback) {
		if (JSUtil.isString(form)) {
			form = $("#" + form);
		}

		// #. 폼 제출
		form.ajaxSubmit({
			dataType : "json",
			type : "post",
			success : function(responseText) {
				var response = responseText;
				if (callback != null) {
					callback.call(this, response, context);
				}
				return false;
			},
			error: function (jqXHR, textStatus, errorThrown) {
				if (errorCallback != null) {
					errorCallback.call(this, jqXHR, textStatus, errorThrown);
				} else {
					alert("Ajax request failed !!");
				}
				return false;
			}
		});
	};

	/**
	 * [Public Static]
	 * POST 로 Ajax 요청을 수행합니다.
	 * @param url
	 * @param params
	 * @param callback : (response, context). Ajax Callback 함수.
	 * @param context
	 * @param errorCallback
	 */
	Class.sendPostByAjax = function(url, params, callback, context, errorCallback) {
		$.ajax({
			dataType : "json",
			url : url,
			type: "params",
			data : data,
			success: function(responseText, textStatus, jqXHR) {
				var response = responseText;
				if (callback != null) {
					callback.call(this, response, context);
				}
				return false;
			},
			error: function (jqXHR, textStatus, errorThrown) {
				if (errorCallback != null) {
					errorCallback.call(this, jqXHR, textStatus, errorThrown);
				} else {
					alert("Ajax request failed !!");
				}
				return false;
			}
		});
	};

	/**
	 * [Public Static]
	 * 컨텐츠를 Ajax 로 적재합니다.
	 * @param containerId String. 컨텐츠 컨테이너 식별자 (div id)
	 * @param url URL String.
	 * @param params Object. 파라메터들
	 * @param callback Function(String responseText, String textStatus, jqXHR jqXHR). 성공시 콜백함수
	 */
	Class.loadContents = function(containerId, url, params, callback) {
		if (containerId != null && containerId.length > 0) {
			if (document.getElementById(containerId) != null) {
				var container = $("#" + containerId);
				// #. 컨테이너의 내용 비우기
				container.empty();
				// #. 내용 적재
				container.load(ur, params, callbackl);
			}
		}
	};

	return Class;
})();


