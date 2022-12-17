/**
 * 문자열내에 {0} 나 {name} 형태의 값이 치환된 메시지를 얻는다.
 * 인자객체가 Array 인 경우 {index} 가 배열[index] 값으로 치환되고
 * 인자객체가 Object 인경우 {속성명} 이 속성값으로 치환된다.
 * @param obj 인자객체. Array 이면 {index}
 */
String.prototype.getMessage = function(obj) {
	var str = this;
	if (str != null && obj != null) {
		if (obj.constructor == Array) {
			for (var i = 0; i < obj.length; i++) {
				var value = obj[i];
				if (value != null) {
					var regExp = new RegExp("\\{" + i + "\\}", "gi");
					str = str.replace(regExp, value);
				}
			}
		} else {
			for (attr in obj) {
				var value = obj[attr];
				if (value != null) {
					var regExp = new RegExp("\\{" + attr + "\\}", "gi");
					str = str.replace(regExp, value);
				}
			}
		}
	}
	return str;
};

/**
 * prefix 로 시작하는 문자열이면 true
 * @param prefix 접두어
 * @returns {Boolean}
 */
String.prototype.startsWith = function(prefix) {
	var str = this;
	if (str != null && prefix != null) {
		if (str.length >= prefix.length) {
			return (str.substring(0, prefix.length) == prefix);
		}
	}
	return false;
};

/**
 * suffix 로 끝나는 문자열이면 true
 * @param suffix 접미어
 * @returns {Boolean}
 */
String.prototype.endsWith = function(suffix) {
	var str = this;
	if (str != null && suffix != null) {
		if (str.length >= suffix.length) {
			return (str.substring(str.length - suffix.length) == suffix);
		}
	}
	return false;
};

/**
 * 전체 문자를 치환한다 (정규식 특수문자도 치환가능)
 * @param oldChar
 * @param newChar
 * @returns
 */
String.prototype.replaceAll = function(oldChar, newChar) {
	var str = this;
    return str.split(oldChar).join(newChar);
};

/**
 * 문자의 좌, 우 공백 제거
 * @return : String
 */
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
};

/**
 * 문자열의 byte 길이 반환
 * @return : int
 */
String.prototype.byteLength = function() {
    var cnt = 0;
    for (var i = 0; i < this.length; i++) {
        if (this.charCodeAt(i) > 127)
            cnt += 2;
        else
            cnt++;
    }
    return cnt;
};

/**
 * 정수형으로 변환
 * @return : String
 */
String.prototype.intValue = function() {
    if(!isNaN(this)) {
        return parseInt(this);
    }
    else {
        return null;
    }
};

/**
 * 파일 확장자만 가져오기
 * @return : String
 */
String.prototype.getExtension = function() {
    return (this.indexOf(".") < 0) ? "" : this.substring(this.lastIndexOf(".") + 1, this.length);
};

// ########## 각종 체크 함수들 ##########

/**
 * 공백이나 널인지 확인
 * @return : boolean
 */
String.prototype.isEmpty = function() {
    var str = this.trim();
    for(var i = 0; i < str.length; i++) {
        if ((str.charAt(i) != "\t") && (str.charAt(i) != "\n") && (str.charAt(i)!="\r")) {
            return false;
        }
    }
    return true;
};

/**
 * 숫자형태의 문자열이면 true
 * @param n
 * @returns {Boolean}
 */
String.prototype.isNumber = function() {
	return !isNaN(parseFloat(this));
};

/**
 * 간단하게 날짜인지 판별하기
 */
String.prototype.isDate = function() {
	var dateRegExp = /^(\d{4})[\-\.\/]?(\d{2})[\-\.\/]?(\d{2})$/g;
	if (dateRegExp.test(this)) {
		if (this.length == 8 || this.length == 10) {
			if (RegExp.$1 > 1970
					&& (RegExp.$2 >= 1 && RegExp.$2 <= 12)
					&& (RegExp.$3 >= 1 && RegExp.$3 <= 31)) {
				return true;
			}
		}
	}
	return false;
};

/**
 * 이메일의 유효성을 체크
 * @return : boolean
 */
String.prototype.isEmail = function() {
    return (/\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/).test(this.trim());
};

/**
 * 전화번호 체크
 * @param delim 구분자 (optional)
 * @return : boolean
 */
String.prototype.isPhoneNumber = function(delim) {
	if (delim == null) {
    	delim = "";
    }
    return eval("(/(02|0[3-9]{1}[0-9]{1})" + delim + "[1-9]{1}[0-9]{2,3}" + delim + "[0-9]{4}$/).test(this)");
};

/**
 * 핸드폰번호 체크
 * @param delim 구분자 (optional)
 * @return : boolean
 */
String.prototype.isMobileNumber = function(delim) {
	if (delim == null) {
    	delim = "";
    }
    return eval("(/01[016789]" + delim + "[1-9]{1}[0-9]{2,3}" + delim + "[0-9]{4}$/).test(this)");
};
