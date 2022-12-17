var Map = (function() {

	/**
	 * 생성자
	 * @param paramMapObj Mixed(Object/Map). 초기 파라메터로 들어오는 Map 데이터 객체
	 */
	var Class = function(paramMapObj) {

		/**
		 * [private]
		 * 내부 Map 데이터
		 */
		var _mapData = (obj != null) ? cloneObject(obj) : new Object();

		/**
		 * [private]
		 * 내부의 _mapData 를 복사한다
		 * @return Object 복사된 내부 맵데이터 객체
		 */
		var cloneMapData = function() {
			var newMapData = {};
			for (var key in _mapData) {
				newMapData[key] = _mapData[key];
			}
			return newMapData;
		};

		/**
		 * [private]
		 * 지정된 Map/Object 의 모든 요소를 _mapData 로 머지한다
		 * @param mapObj Mixed(Map/Object) Map 데이터 객체
		 */
		var mergeMapData = function(mapObj) {
			// #. Map or Object 구분
			var tempMapData = mapObj;
			if (obj instanceof Map) {
				tempMapData = obj.getObject();
			}
			// #. 전체 요소 복사
			for (var key in tempMapData) {
				_mapData[key] = tempMapData[key];
			}
		};

		/**
		 * 객체 초기화 함수.
		 * 파라메터로 들어온 mapObj 를 기준으로 내부 _mapData 초기화
		 */
		(function initialize() {
			if (paramMapObj != null) {
				mergeMapData(paramMapObj);
			}
		})();

		/**
		 * [public]
		 * 지정된 key 에 해당하는 value 를 넣는다
		 * @param String. key 키
		 * @param Object. value 값
		 * @returns void
		 */
		this.put = function(key, value) {
			_mapData[key] = value;
		}

		/**
		 * [public]
		 * 지정된 Map 내의 모든 key 에 해당하는 value 들을 넣는다
		 * @param mapObj Mixed(Map/Object). Map 데이터 객체
		 */
		this.putAll = function(mapObj) {
			mergeMapData(mapObj);
		}

		/**
		 * [public]
		 * 지정된 key 에 해당하는 value 를 얻는다
		 * @param key String. 키
		 * @return Object. 키에 해당하는 값
		 */
		this.get = function(key) {
			return _mapData[key];
		}

		/**
		 * [public]
		 * 지정된 key 를 삭제한다.
		 * value 가 지정되었다면 동일한 값까지 일치해야만 삭제된디ㅏ.
		 * @param key Strig. 키
		 * @param value Object. 값. optional.default null
		 * @returns Boolean. 삭제 여부
		 */
		this.remove = function(key, value) {
			for (var mapDataKey in _mapData) {
				if (mapDataKey == key) {
					if (value != null) {
						if (_mapData[mapDataKey] === value) {
							delete _mapData[mapDataKey];
						}
					} else {
						delete _mapData[mapDataKey];
					}
					break;
				}
			}
		}

		/**
		 * [public]
		 * 전체 key 들을 배열로 얻는다
		 * @return Array. key들
		 */
		this.keys = function() {
			var keys = [];
			for (var key in _mapData) {
				keys.push(key);
			}
			return keys;
		}

		/**
		 * [public]
		 * 전체 value 들을 배열로 얻는다
		 * @return Array. 값들
		 */
		this.values = function() {
			var values = [];
			for (var key in _mapData) {
				values.push(_mapData[key]);
			}
			return values;
		}

		/**
		 * [public]
		 * Map 내에 key 가 포함되어 있다면 true
		 * @param key String. 키
		 * @return Boolean. 키값 포함 여부
		 */
		this.containsKey = function(key) {
			for (var mapDataKey in _mapData) {
				if (mapDataKey == key) {
					return true;
				}
			}
			return false;
		}

		/**
		 * [public]
		 * Map이 비어있는지의 여부를 판단한다.
		 * @return Boolean. Map 이 비어있다면 true
		 */
		this.isEmpty = function() {
			return (this.size() == 0);
		}

		/**
		 * [public]
		 * Map 의 모든 요소들을 삭제한다
		 * @return void
		 */
		this.clear = function() {
			for (var key in _mapData) {
				delete _mapData[key];
			}
		}

		/**
		 * [public]
		 * Map 의 크기를 얻는다
		 * @returns Number Map 의 크기
		 */
		this.size = function() {
			var size = 0;
			for (var key in _mapData) {
				size++;
			}
			return size;
		}

		/**
		 * [public]
		 * Map 정보를 유지하는 Object 객체를 얻는다.
		 * 일반적으로 Map 의 내용을 JSON 으로 변환할때 호출되어진다.
		 * @returns Object. Map 데이터 객체
		 */
		this.getObject = function() {
			return cloneMapData();
		}

		/**
		 * Map 을 복사한다
		 * @returns Map. 객체
		 */
		this.clone = function() {
			var newMapData = cloneMapData();
			return new Map(newMapData);
		};
	};

	// static 영역

	return Class;
})();
