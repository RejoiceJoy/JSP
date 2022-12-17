/**
 * 지정된 index 에 해당 객체를 넣는다
 * @param obj Object. 객체
 * @param index Number. 인덱스. 설정하지 않으면 맨 뒤에 추가됨
 * @returns void
 */
Array.prototype.addAt = function(obj, index) {
	if (index <= this.length && index >= 0) {
        this.splice(index, 0, obj);
    }
};

/**
 * 지정된 index 에 객체를 넣는다.
 * @param index Number 인덱스
 * @param obj Object. 객체
 * @returns void
 */
Array.prototype.setAt = function(index, obj) {
	if (index < this.length && index >= 0) {
        this[index] = obj;
    }
};

/**
 * 지정된 객체와 동일한 요소를 삭제한다
 * @param obj Object. 삭제하고자 하는 객체
 * @returns Boolean. 삭제된 요소가 있다면 true
 */
Array.prototype.remove = function(obj) {
	var index = this.indexOf(obj);
    if (index >= 0) {
        this.removeAt(index);
        return true;
    } else {
    	return false;
    }
};

/**
 * 지정된 index 의 요소를 삭제한다
 * @param index Number 인덱스
 * @returns Object. 삭제되어진 객체. 삭제되지 않았다면 null
 */
Array.prototype.removeAt = function(index) {
	if (index < this.length && index >= 0) {
		var obj = this[index];
        this.splice(index, 1);
        return obj;
    }
	return null;
};

/**
 * 지정된 index 의 요소를 얻는다
 * @param index Number 인덱스
 * @returns Object. 해당 인덱스의 요소
 */
Array.prototype.get = function(index) {
	if (index < this.length && index >= 0) {
        return this[index];
    }
};

/**
 * 배열의 모든 요소를 삭제한다
 * @returns void
 */
Array.prototype.clear = function() {
	this.splice(0, this.length);
};

/**
 * 배열의 크기를 얻는다
 * @returns Number. 배열의 크기
 */
Array.prototype.size = function() {
	return this.length;
};

/**
 * 배열이 비어있으면 true 를 반환한다.
 * @returns Boolean. 배열이 비어있는지 여부
 */
Array.prototype.isEmpty = function() {
	return (this.size() == 0);
};

/**
 * 배열에 obj 의 포함여부를 판단한다.
 * @param obj Object. 비교객체
 * @returns Boolean. 포함되어 있다면 true
 */
Array.prototype.contains = function(obj) {
	return (this.indexOf(obj) >= 0)
};

/**
 * 지정된 객체가 위치하는 index 를 반환한다
 * @param Object. obj 객체
 * @param Number. startIndex 시작점
 * @returns Number. 객체가 위치하는 index. 찾지 못하면 -1.
 */
Array.prototype.indexOf = function(obj, startIndex) {
	if (startIndex == null) {
		startIndex = 0;
	}

	if (startIndex < this.length && startIndex >= 0) {
		for (var i = startIndex; i < this.length; i++) {
			if (this[i] == obj) {
				return i;
			}
		}
	}
	return -1;
};

/**
 * 지정된 객체가 위치하는 index 를 반환한다
 * @param Object. obj 객체
 * @returns Number. 객체가 위치하는 index. 찾지 못하면 -1.
 */
Array.prototype.indexOfObject = function(obj) {
    for (var i = 0; i < this.length; i++) {
    	var isExist = true;
    	for (var p in obj) {
    		if (obj.hasOwnProperty(p)) {
    			if (this[i][p] !== obj[p]) {
    				isExist = false;
    				break;
    			}
    		}
    	}

    	if (isExist) {
    		return i;
    	}
    }
    return -1;
};

/**
 * 배열의 일부분을 새로운 배열로 리턴한다.
 * 기본으로 제공되어지는 slice() 와 동일하다.
 * @param fromIndex Number. 시작 인덱스
 * @param toIndex Number. 끝 인덱스
 * @returns Array. 배열의 일부.
 */
Array.prototype.subArray = function(fromIndex, toIndex) {
	this.slice(fromIndex, toIndex);
};

/**
 * 배열을 복사한다. copy() 과 동일한 기능을 수행한다.
 * @returns 복사되어진 배열.
 */
Array.prototype.clone = function() {
	return this.subArray(0);
};

/**
 * 배열을 복사한다. clone() 과 동일한 기능을 수행한다.
 * @returns Array. 복사되어진 배열.
 */
Array.prototype.copy = function() {
	return this.clone();
};

/**
 * 배열을 문자열로 변환한다
 * @returns String. 컴마(,)구분자로 구성된 문자열
 */
Array.prototype.toString = function() {
	return this.join(",");
};
