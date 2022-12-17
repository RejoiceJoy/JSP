var Logger = (function() {

	/**
	 * 생성자
	 */
	var Class = function(initValue) {
		// do nothing
	};

	/**
	 * [public static]
	 * 브라우저 콘솔에 메시지 출력
	 */
	Class.log = function(message) {
		try {
			console.log(message);
		} catch (e) {
			// ignore
		}
	};

	// #. return Class variable
	return Class;
})();