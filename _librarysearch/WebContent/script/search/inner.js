/**
 * 국회소장자료 검색에서만 사용하는 스크립트 정의
 * @author srlee
 * @returns
 */
var previousFocus = "";

$(document).ready(function() {
	// 검색조건 셋팅
	initInnerSearchCondition();
	// 메뉴 셋팅
	initTopMenu();
	// 이벤트 등록
    addInnerSearchEventListeners();

    $(document).on("focusout", "#closeModal", function(event, modal) {
    	$(".jquery-modal").focus();
    });

    //간략, 상세
	$("#myLibrary2").on($.modal.AFTER_CLOSE, function(event, modal) {
		previousFocus.focus();
	});

	// 상세
	$("#coverImg").on($.modal.AFTER_CLOSE, function(event, modal) {
		previousFocus.focus();
	});

	$("#refdImg").on($.modal.AFTER_CLOSE, function(event, modal) {
		previousFocus.focus();
	});

	$("#article").on($.modal.AFTER_CLOSE, function(event, modal) {
		previousFocus.focus();
	});

	$("#bookLocationInfo").on($.modal.AFTER_CLOSE, function(event, modal) {
		previousFocus.focus();
	});

	// 상세
	$("#wrongDataReport").on($.modal.AFTER_CLOSE, function(event, modal) {
		previousFocus.focus();
	});

	$("#marc").on($.modal.AFTER_CLOSE, function(event, modal) {
		previousFocus.focus();
	});

	$("#noticeTalk").on($.modal.AFTER_CLOSE, function(event, modal) {
		previousFocus.focus();
	});

	$("#authorProfile").on($.modal.AFTER_CLOSE, function(event, modal) {
		previousFocus.focus();
	});

	//화면 사이즈 확인. 모바일인경우 그래프 그려주기. KHJ
	$(".facet > ul > .pubYearData > a").click(function(){
		if(!$(this).parent().hasClass('on')) return false;
		var mql = window.matchMedia("all and (max-width: 767px)");
			if(mql.matches){
				loadPubYearGraph();
			}
	});

	$(document).on("click", ".page > ul > li > a, .page > .first, .page > .prev, .page > .next", function(e){
		var href = $(this).attr('href');
		$(this).attr('href', href+"&asideState="+$("#asideState").val());
	});

});

$(window).load(function() {
    // 발행연도 그래프를 로드한다.
	loadPubYearGraph();
});

// #################################### 데이터 초기화 관련  ##################################
/**
 * 검색조건 초기화
 * @returns
 */
function initInnerSearchCondition() {
    // #1. 기본검색, 전체(초록,목차,본문포함) 등 selectbox 셋팅
    $("#selZone").val(zone).prop("selected", true);
    var text = $("#selZone option:selected").text();
    $("#selZone").attr("title", text);
    $("#selZoneLabel").text(text);

    // #2.목록 건수 셋팅
    $("#selPageSize").val(pageSize).prop("selected", true);
    var text = $("#selPageSize option:selected").text();
    $("#selPageSize").attr("title", text);
    $("#selPageSizeLabel").text(text)

    // #3. 정렬 순서 셋팅
    $("#selOrderBy").val(orderBy).prop("selected", true);
    var text = $("#selOrderBy option:selected").text();
    $("#selOrderBy").attr("title", text);
    $("#selOrderByLabel").text(text)
}

function initTopMenu() {
    if (searchClass != "") {
    	$("#" + searchClass.toLowerCase() + "_menu").addClass("on");
    }

    if (topMainMenuCode == "" && topSubMenuCode == "") {
    	$("#" + searchClass.toLowerCase() + "_menu" + "> ol.secondDepth > li:first").addClass("on");
    } else {
    	if (topMainMenuCode != "") {
            $(".secondDepth > " + "li#" + searchClass.toLowerCase() + "_" + topMainMenuCode).addClass("on");
        }

        if (topSubMenuCode != "") {
            $(".thirdDepth > div.inner > ol > " + "li#" + searchClass.toLowerCase() + "_" + topSubMenuCode).addClass("on");
        }
    }
    searchTitleSet();
}

/**
 * 이벤트를 등록한다.
 */
function addInnerSearchEventListeners() {
    // 결과 내 검색 체크박스
    $("#chkRefineSearchYn").on("change", function(event) {
        if (this.checked) {
            $("#refineSearchYn").val("Y");
        } else {
            $("#refineSearchYn").val("N");
        }
    });

   // 동의어 검색 체크박스
    $("#chkSynonymYn").on("change", function(event) {
        if (this.checked) {
            $("#synonymYn").val("Y");
        } else {
            $("#synonymYn").val("N");
        }
    });

    // 저자명 참조 사전
	$("#refAuthor").on($.modal.AFTER_CLOSE, function(event, modal) {
		// 인명/단체명 초기화
		$("#authorName").val("");

		// 저자 목록 초기화
		var authorHtml = "<tr>\n";
		authorHtml    += "    <td colspan=\"9\" class=\"tc\">자료가 없습니다. 다른 검색조건을 선택해주세요.</td>\n";
		authorHtml    += "</tr>\n";

		// 레이어 팝업 높이 초기화
		changeRefAuthorLayerHeight("addClass");

		$("#AUTHOR_TBODY").children().remove();
		$("#AUTHOR_TBODY").html(authorHtml);

		// 정렬 초기화
		authorOrderByinit();
		$("#orderByFirst").val("");
		$("#orderBySecond").val("book_cnt desc");

		return false;
	});

    // start : 용어관계사전 moadl event
	$("#termDict").on($.modal.AFTER_CLOSE, function(event, modal) {
		clearThesaurusLayerPop();
		return false;
	});


	$("#termDict").on($.modal.BEFORE_OPEN, function(event, modal) {
		$("#term").val($("#searchQuery").val());
		return false;
	});
	// end : 용어관계사전 moadl event
}

// #################################### 달력그래프  ##################################
function loadPubYearGraph() {
    setPubYearGraph(getGraphData());
}


/**
 * 발행연도 그래프를 셋팅한다.
 * @param data
 * @returns
 */
function setPubYearGraph(data) {

	if (data.name.length == 0 && data.value.length == 0) {
		$("#pubYearGraphArea").removeClass("on");
		$("#pubYearGraphArea > #pubYear").children().remove();

		return false;
	}

	$("#graphInner, #graphOuter").empty();
	var display = $("#pubYear dd").css("display");

	$("#pubYear").show();

	drawGraph(data, "graphInner", "#f3cb9d");
	drawGraph(data, "graphOuter", "#f29c39");

	var minYear = data.name[0];
	var maxYear = data.name[data.name.length - 1];

	setSlider(parseInt(minYear), parseInt(maxYear));
	$("#startPubYear").val(minYear);
	$("#endPubYear").val(maxYear);
}

/**
 * 발행연도 그래프를 그린다.
 * @param data
 * @param graphDiv
 * @param color
 * @returns
 */
function drawGraph(data, graphDiv, color) {
	var width = $("#pubYear dd").width();
	var height = $(".graph").height();

	$("#graphOuter").width(width);

	var options = {
		'legend':{
			names : data.name
		},
		'dataset':{
			title   : '발행년도',
			values  : data.value,
			colorset: [color],
			fields  :['발행년도']
		},
		'chartDiv'         : graphDiv,
		'chartType'        : 'area',
		'leftOffsetValue'  : 0,
		'bottomOffsetValue': 0,
		'chartSize'        : {width : width, height : height},
		'increment'        : 1
	};

	Nwagon.chart(options);
}

/**
 * 발행년도 슬라이더를 셋팅한다.
 * @param minYear
 * @param maxYear
 * @returns
 */
function setSlider(minYear, maxYear) {
	$("#slider").slider({
		range: true,
		min: minYear,
		max: maxYear,
		values: [minYear, maxYear],
		slide: function(event, ui) {
			var startYear = ui.values[0];
			var endYear   = ui.values[1];

			graphMove(startYear, endYear);

			$("body").unbind("mouseup");
			$("body").mouseup(function() {
				$("body").unbind("mouseup");
			});
		}
	});

	function graphMove(startYear, endYear) {
		var width      = $("#pubYear dd").width();
		var step        = 100 / (maxYear - minYear);
		var changeWidth = (endYear - startYear) * step;
		var left        = (startYear - minYear) * step;

		$("#graph").width(changeWidth + "%");

		left = width * (left / 100);
		$("#graph").css({"left" : left + "px"});
		$("#graphOuter").css({"left" : -left + "px"});

		$("#startPubYear").val(startYear);
		$("#endPubYear").val(endYear);
	}

	$("#slider").find("a.ui-slider-handle").attr("title", "발행 시작년 조절바");
	$("#slider").find("a.ui-slider-handle").next().attr("title", "발행 종료년 조절바");
}

// 그래프 데이타
function getGraphData() {
	var pubDateList = new Array();
	if (pubYearJSON != null) {
		var objKeys = Object.keys(pubYearJSON);
	    for (var i = 0; i < objKeys.length; i++) {
	        var objKey = objKeys[i];
	        var objVal = pubYearJSON[objKey];

	        if (objKey.length == 4) {
	        	pubDateList.push(objKey);
	        }
	    }
	}

	var sorted = pubDateList.sort(function(a, b) {
		return a - b;
	});

	var min = sorted[0];
	var max = sorted[sorted.length - 1];

	var data = {
		name  : [],
		value : []
	};

	for (var i = 0, len = sorted.length; i < len; ++i) {
		data.name.push(sorted[i]);
		data.value.push([parseInt(pubYearJSON[sorted[i]])]);
	}

	if (data.name.length == 1) {
		data.name.push(sorted[0]);
	    data.value.push([parseInt(pubYearJSON[sorted[0]])]);
	}

	return data;
}

//#################################### 레이어 팝업 검색 로그 동륵  ##################################
/**
 * 레이어 팝업 검색 로그를 등록한다.
 */
function insertSearchPopupLog(linkSystem, popupCode){
	var searchQuery = "";

	// 저자명 검색
	if(popupCode == 'A'){
		searchQuery = $.trim($("#authorName").val());
	// 용어관계사전
	} else if(popupCode == 'T'){
		searchQuery = $.trim($("#term").val());
	}

	// 검색어 널체크
	if(!searchQuery){
		alert("검색어를 입력하세요.");
		return;
	}

	$.ajax({
        url        : "/search/insertSearchPopupLog.do",
        type       : "POST",
        data       : {linkSystem : linkSystem, popupCode : popupCode, searchQuery : searchQuery},
        dataType   : "json",
        //async      :  false,
        success    : function(data) {
        }
    });

	// 저자명 검색
	if(popupCode == 'A'){
		searchRefAuthorList();
	// 용어관계사전
	} else if(popupCode == 'T'){
		searchThesaurusList();
	}


}


// #################################### 용어관계사전 레이어 팝업  ##################################
/**
 * 용어관계사전 용어명을 변경한다.
 */
function changeThesaurusTerm(term, termId) {
	$("#term").val("");
	$("#termId").val("");
    if (term != null) {
    	$("#term").val(term);
    }

    if (termId != null) {
    	$("#termId").val(termId);
    }
    insertSearchPopupLog('NADL', 'T');
    //merge진행중 해당부분 log진행후 실행하여 불필요 (주석처리), 확인 바람. 20211222 KHJ
    //searchThesaurusList();
}

function applyThesaurus(applyType) {

    var thesaurusList = new Array();

    if (applyType == "REP") {
    	$("#representativeItem").find(":input:checkbox").each(function(i) {
            thesaurusList.push($(this).val());
        });
    } else if (applyType == "ALL") {
    	$("#thesaurusList tbody").find(":input:checkbox:checked").each(function(i) {
            thesaurusList.push($(this).val());
        });
    }

	if (thesaurusList.length == 0) {
		alert("선택한 항목이 없습니다.");
		return false;
	}

	$("#searchQuery").val(thesaurusList.join(" | "));
	searchInnerList();
}

/**
 * 용어관계사전 용어를 검색한다.
 */
function searchThesaurusList() {

    var term    = $("#term").val();
    var termId  = $("#termId").val();
    var match   = $("input:radio[name=match]:checked").val();

    if (term == "" ) {
    	alert("검색어를 입력하세요.");
        return false;
    }

    $.ajax({
        url        : "/search/searchThesaurusList.do",
        type       : "POST",
        data       : {term : term, termId : termId, match : match},
        dataType   : "json",
        //async      :  false,
        success    : function(data) {
            if (data.response == "SUCCESS") {
            	showThesaurusMainHtml(data);
            	showThesaurusItemHtml(data);
            } else if (data.response == "NO_DATA") {
            	clearThesaurusMainHtml();
            	clearThesaurusItemHtml();
            }
            showThesaurusWordHtml(data);

            if (data.reponse == "SUCCESS" || data.wordList.length > 0) {
                changeThesaurusLayerHeight("removeClass");
                clearThesaurusNoDataHtml();
            } else {
            	changeThesaurusLayerHeight("addClass");
            	drawThesaurusNoDataHtml();
            }
        }
    });
}

function showThesaurusMainHtml(data) {
	// 대표어
    var representativeWord = data.termName;
    // 외국어
    var foreignLanguage = "";
    if (data.foreignList.length > 0) {
    	for(var i=0; i < data.foreignList.length ; i++)
    	{
    		if(i > 0) foreignLanguage += ",";
    		foreignLanguage += data.foreignList[i].RELTERM;
    	}
    }
    var naverLibarayInfo = "";
    if (data.naverLibarayInfo && data.naverLibarayInfo.length > 0) {
    	naverLibarayInfo = data.naverLibarayInfo;
    	$("#naverLibarayInfo").parent().show()
    } else {
//    	$("#naverLibarayInfo").parent().hidden();
    	$("#naverLibarayInfo").parent().hide();
    }

    $(".searchInfo").css("display", "block");
    $("#representativeWord").html(representativeWord);
    $("#foreignLanguage").html(foreignLanguage);

    if(data.naverLibarayInfoLink){
        if(INTERNET_R == "1"){
            $("#naverLibarayInfo").html('<a href="javascript:alert(\'인터넷망 PC를 이용해 주세요\');" class="iBlue underline" title="네이버 백과사전 바로가기">' + naverLibarayInfo + '</a>');
        }else{
            $("#naverLibarayInfo").html('<a href="' + data.naverLibarayInfoLink + '" class="iBlue underline" target="_blank" title="네이버 백과사전 바로가기">' + naverLibarayInfo + '</a>');
        }

        //$("#naverLibarayInfo").html('<a href="' + data.naverLibarayInfoLink + '" class="iBlue underline" target="_blank" title="네이버 백과사전 바로가기">' + naverLibarayInfo + '</a>');
    }else{
        $("#naverLibarayInfo").html(naverLibarayInfo);        
    }

    $("#btnRepresentativeWord").removeClass("dNone");

}

function showThesaurusItemHtml(data) {
	 $(".dict").css("display", "block");
     // 대표어
     drawThesaurusItemHtml(data.representativeList, "chk3", "#representativeItem");
     // 동의어
     drawThesaurusItemHtml(data.synonymList, "chk4", "#synonymItem");
     // 상위어
     drawThesaurusItemHtml(data.hyperonymList, "chk5", "#hyperonymItem");
     // 하위어
     drawThesaurusItemHtml(data.hyponymList, "chk6", "#hyponymItem");
     // 관련어
     drawThesaurusItemHtml(data.relatedList, "chk7", "#relatedItem");
     // 대립어
     drawThesaurusItemHtml(data.antonymList, "chk8", "#antonymItem");

     if (data.representativeList.length > 0
    		 || data.synonymList.length > 0
    		 || data.hyperonymList.length > 0
    		 || data.hyponymList.length > 0
    		 || data.relatedList.length > 0
    		 || data.antonymList.length > 0) {

    	 $("#btnThesaurusWord").removeClass("dNone");
     }
}

function drawThesaurusItemHtml(data, checkId, itemId) {
    var itemHtml = "";
    for (var i = 0; i < data.length; i++) {
    	itemHtml += "<li>\n";
    	itemHtml += "    <input type=\"checkbox\" class=\"" + checkId + "\" id=\"" + checkId + "_"+  i + "\" name=\"" + checkId + "\" value=\"" + data[i].value +  "\" />\n"
    	itemHtml += "    <label for=\"" + checkId + "_" + i + "\"><a href=\"javascript:changeThesaurusTerm('" + data[i].value + "')\" title=\"  \">" + data[i].name + "</a></label>\n"
    	itemHtml += "</li>\n";
    }

    $(itemId).children().remove();
    $(itemId).html(itemHtml);
}

function drawThesaurusNoDataHtml() {
	var noDataHtml = "<p>\"<span>" + $("#term").val() + "</span>\"에 대한 검색결과가 없습니다.</p>";
	$("#thesaurusNoData").html(noDataHtml);
}

function clearThesaurusMainHtml() {
	$(".searchInfo").css("display", "none");
	$("#representativeWord").children().remove();
	$("#foreignLanguage").children().remove();
	$("#btnRepresentativeWord").addClass("dNone");
}

function clearThesaurusItemHtml() {
    $(".dict").css("display", "none");
    $("#representativeItem").children().remove();
    $("#synonymItem").children().remove();
    $("#hyperonymItem").children().remove();
    $("#hyponymItem").children().remove();
    $("#relatedItem").children().remove();
    $("#antonymItem").children().remove();
    $("#btnThesaurusWord").addClass("dNone");
}

function showThesaurusWordHtml(data) {
	var wordList = data.wordList;
    if (wordList.length > 0) {
        drawThesaurusWordHtml(wordList);
    } else {
    	clearThesaurusWordHtml();
    }
}

function drawThesaurusWordHtml(data) {
	$(".dlist").css("display", "block");

	var wordItemHtml = "";
	for (var i = 0; i < data.length; i++) {
		wordItemHtml += "<li><a href=\"javascript:changeThesaurusTerm('" + data[i].value + "'" + ", '"  + data[i].id  + "'" + ")\" title=\"  \">" + data[i].name + "</a></li>\n"
	}

	 $("#wordItem").children().remove();
	 $("#wordItem").html(wordItemHtml);
}

function clearThesaurusWordHtml() {
	$(".dlist").css("display", "none");
	$("#wordItem").children().remove();
}

function clearThesaurusNoDataHtml() {
	$("#thesaurusNoData").children().remove();
}

function clearThesaurusLayerPop() {
	// 검색어 초기화
	$("#term").val("");
	$("#termId").val("");

	// 라디오 버튼 초기화
	$("input:radio[name=match]:input[value=left]").attr("checked", true);

	// HTML 초기화
	clearThesaurusMainHtml();
    clearThesaurusItemHtml();
    clearThesaurusWordHtml();
    clearThesaurusNoDataHtml();
    changeThesaurusLayerHeight("addClass");
}

function changeThesaurusLayerHeight(classType) {
	if (classType == "removeClass") {
		if ($("#termDict").hasClass("height")) {
            $("#termDict").removeClass("height")
        }
	} else if (classType == "addClass") {
		if (!$("#termDict").hasClass("height")) {
	        $("#termDict").addClass("height")
	    }
	}
}

/**
 * 검색 조건 초기화
 * @returns
 */
function initThesaurusSearchCondition() {
	clearThesaurusLayerPop();
	// 초기화 전 검색 용어 다시 셋팅
	$("#term").val($("#searchQuery").val());
}
//#################################### 저자명 참조 레이어 팝업  ##################################
/**
 * 저자명 참조 검색
 */
function searchRefAuthorList() {

	var authorOrderBy = "";
	var authorName = $("#authorName").val();
	if (authorName == "") {
		alert("인명/단체명을 입력하세요.");
		return false;
	}

	if($("#bookCntFirst").val() == "Y"){
		if($("#orderBySecond").val() && $("#orderByFirst").val()){
			authorOrderBy = $("#orderBySecond").val() + ", " + $("#orderByFirst").val();
		} else if($("#orderBySecond").val()){
			authorOrderBy = $("#orderBySecond").val();
		} else {
			authorOrderBy = $("#orderByFirst").val();
		}
	} else {
		if($("#orderBySecond").val() && $("#orderByFirst").val()){
			authorOrderBy = $("#orderByFirst").val() + ", " + $("#orderBySecond").val();
		} else if($("#orderBySecond").val()){
			authorOrderBy = $("#orderBySecond").val();
		} else {
			authorOrderBy = $("#orderByFirst").val();
		}
	}


	$.ajax({
        url        : "/search/searchRefAuthorList.do",
        type       : "POST",
        data       : {authorName : authorName, authorOrderBy : authorOrderBy},
        dataType   : "json",
        success    : function(data) {
        	closeAuthorNameAutocomplete();
        	var authorHtml = "";
        	if (data != null && data.length > 0) {

        		var beforeAuthorId = "";
        		for (var i = 0; i < data.length; i++) {
            		var authorId       = data[i].authorId       == undefined ? "" : data[i].authorId;
            		var mainAuthorName = data[i].mainAuthorName == undefined ? "" : data[i].mainAuthorName;
            		var subAuthorName  = data[i].subAuthorName  == undefined ? "" : data[i].subAuthorName;
            		var mainSeqNo      = data[i].mainSeqNo      == undefined ? 1  : parseInt(data[i].mainSeqNo);
            		var subSeqNo       = data[i].subSeqNo       == undefined ? 1  : parseInt(data[i].subSeqNo);
            		var remark         = data[i].remark         == undefined ? "" : data[i].remark;
        			var startDate      = data[i].startDate      == undefined ? "" : data[i].startDate;
        			var endDate        = data[i].endDate        == undefined ? "" : data[i].endDate;
        			var instName       = data[i].instName       == undefined ? "" : data[i].instName;
        			var position       = data[i].position       == undefined ? "" : data[i].position;
        			var job            = data[i].job            == undefined ? "" : data[i].job;
        			var activity       = data[i].activity       == undefined ? "" : data[i].activity;
        			var cnt            = data[i].cnt            == undefined ? 1 : parseInt(data[i].cnt);
        			var bookCnt        = data[i].bookCnt        == undefined ? 1 : parseInt(data[i].bookCnt);
        			/**
        			 * 1. 1이면 그냥 뿌리기
        			 * 2. 2이상이면 이형이 존재 이형이 있을 시 이형 NULL이면 뿌리지 않음
        			 * */
        			if (cnt == 1) {
        				authorHtml += "<tr>\n";
            			authorHtml += "    <td><label><input type=\"checkbox\" class=\"chk2\" name=\"chk2\" value=\"" + authorId + "\" /></label></td>\n";
            			authorHtml += "    <td class=\"tl\">" + mainAuthorName + "</td>\n";
            			authorHtml += "    <td class=\"tl\">" + startDate + " ~ " + endDate + "</td>\n";
            			authorHtml += "    <td class=\"tl\">" + subAuthorName + "</td>\n";
            			authorHtml += "    <td>" + instName + "</td>\n";
            			authorHtml += "    <td>" + position + "</td>\n";
            			authorHtml += "    <td>" + job + "</td>\n";
            			authorHtml += "    <td>" + activity + "</td>\n";
            			authorHtml += "    <td>" + remark + "</td>\n";
            			authorHtml += "    <td>" + bookCnt + "</td>\n";
            			authorHtml += "</tr>\n";
            			beforeAuthorId = authorId;
        			} else {
        				if(subAuthorName){
	        				if (beforeAuthorId == authorId) {
	                			authorHtml += "<tr>\n";
	                			authorHtml += "    <td class=\"tl br\">" + subAuthorName + "</td>\n";
	                			authorHtml += "</tr>\n";
	        				} else {
	        					authorHtml += "<tr>\n";
	        					authorHtml += "    <td rowspan=\"" + (cnt-1) + "\"><label><input type=\"checkbox\" class=\"chk2\" name=\"chk2\" value=\"" + authorId + "\" /></label></td>\n";
	        					authorHtml += "    <td rowspan=\"" + (cnt-1) + "\" class=\"tl\">" + mainAuthorName + "</td>\n";
	        					authorHtml += "    <td rowspan=\"" + (cnt-1) + "\" class=\"tl\">" + startDate + " ~ " + endDate  + "</td>\n";
	        					authorHtml += "    <td class=\"tl\">" + subAuthorName + "</td>\n";
	        					authorHtml += "    <td rowspan=\"" + (cnt-1) + "\">" + instName + "</td>\n";
	        					authorHtml += "    <td rowspan=\"" + (cnt-1) + "\">" + position + "</td>\n";
	        					authorHtml += "    <td rowspan=\"" + (cnt-1) + "\">" + job + "</td>\n";
	        					authorHtml += "    <td rowspan=\"" + (cnt-1) + "\">" + activity + "</td>\n";
	        					authorHtml += "    <td rowspan=\"" + (cnt-1) + "\">" + remark + "</td>\n";
	        					authorHtml += "    <td rowspan=\"" + (cnt-1) + "\">" + bookCnt + "</td>\n";
	        					authorHtml += "</tr>\n";
	        				}
	        				beforeAuthorId = authorId;
        				}
        			}
        		}

        		changeRefAuthorLayerHeight("removeClass");
        	} else {
        		authorHtml +="<tr>\n";
        		authorHtml += "    <td colspan=\"11\" class=\"tc\">자료가 없습니다. 다른 검색조건을 선택해주세요.</td>\n";
        		authorHtml += "</tr>\n";

        		changeRefAuthorLayerHeight("addClass");
        	}

            $("#AUTHOR_TBODY").children().remove();
            $("#AUTHOR_TBODY").html(authorHtml);
        }
    });
}

/**
 * 정렬정보 변경
 *
 * */
function orderByChange(obj, orderByTarget){
	var $obj = $(obj).find('p');

	// 서지는 2차 정렬로 항상 존재
	if(orderByTarget == "book_cnt"){
		// 4. 두번째 클릭 -> 아래로 삼각형 (arrow)
		if($obj.hasClass("arrow") && $obj.hasClass("on")){
			authorOrderByinit();
			$obj.addClass("arrow");
			$("#orderBySecond").val(orderByTarget+" DESC");
		// 3. 세번째 클릭 -> 위로 삼각형 (arrow, on)
		} else if($obj.hasClass("arrow")){
			authorOrderByinit();
			$obj.addClass("arrow");
			$obj.addClass("on");
			$("#orderBySecond").val(orderByTarget+" ASC");
		// 2. 첫번째 클릭 -> 위로 삼각형 (arrow, on)
		} else {
			authorOrderByinit();
			$obj.addClass("arrow");
			$obj.addClass("on");
			$("#orderBySecond").val(orderByTarget+" ASC");
		}
		// 서지 1차 정렬
		$("#bookCntFirst").val("Y");
		// 서지 1차 정렬 시 생몰정보 2차 정렬 고정
		$("#orderByFirst").val("start_date"+" ASC");
	} else {
		/**
		 * 1. 처음 - 없음 ()
		 * 2. 첫번째 클릭 -> 아래로 삼각형 (arrow)
		 * 3. 두번째 클릭 -> 위로 삼각형 (arrow, on)
		 * 4. 세번째 클릭 -> 없음 ()
		 * */
		// 4. 두번째 클릭 -> 아래로 삼각형 (arrow)
		if($obj.hasClass("arrow") && $obj.hasClass("on")){
			authorOrderByinit();
			$obj.addClass("arrow");
			$("#orderByFirst").val(orderByTarget+" DESC");

		// 3. 세번째 클릭 -> 없음 ()
		} else if($obj.hasClass("arrow")){
			authorOrderByinit();
			$("#orderByFirst").val("");
		// 2. 첫번째 클릭 -> 위로 삼각형 (arrow, on)
		} else {
			authorOrderByinit();
			$obj.addClass("arrow");
			$obj.addClass("on");
			$("#orderByFirst").val(orderByTarget+" ASC");
		}

		// 서지 2차 정렬
		$("#bookCntFirst").val("N");
	}

	// 재검색
	searchRefAuthorList();
}

/**
 * 정렬정보 초기화
 * */
function authorOrderByinit(){
	$("#refAuthor.modal th").each(function(){
		$(this).find("p").removeClass("arrow");
		$(this).find("p").removeClass("on");
	});
}

/**
 * 저자명 참조 검색의 적용 버튼 이벤트
 * @returns
 */
function applyRefAuthor() {
	var refAuthorList = new Array();
	$("#AUTHOR_TBODY").find(":input:checkbox:checked").each(function(i) {
		refAuthorList.push($(this).val() + ":AUTHOR_ID:OR");
    });

	if (refAuthorList.length == 0) {
		alert("선택한 항목이 없습니다.");
		return false;
	} else if (refAuthorList.length >= 7) {
		alert("선택한 항목이 너무 많습니다.(선택된 항목 수:" + refAuthorList.length + ")");
		return false;
	}

	$("#searchQuery").val("*");
	$("#fieldText").val(refAuthorList.join("@"));
	searchInnerList();
}

function changeRefAuthorLayerHeight(classType) {
	if (classType == "removeClass") {
		if ($("#refAuthor").hasClass("height")) {
            $("#refAuthor").removeClass("height")
        }
	} else if (classType == "addClass") {
		if (!$("#refAuthor").hasClass("height")) {
	        $("#refAuthor").addClass("height")
	    }
	}
}

//#################################### 다국어입력 레이어 팝업  ##################################
/**
 * 특수문자를 추가한다.
 */
function addEtcCharacter(etcChar) {
    console.log(">>>>>>> etcChar = " + etcChar);
}

//#################################### 열람신청 관련 ##################################
/**
 * 열람신청
 */
function loanBasketInsert(loanGubun, control_no) {

	var check_cn = '';
	var cnCnt = 0;

	$('div.searchList input.chk:checked').each(function(){
		//제어번호 형태가 아닐 경우 제외 처리
		if(this.value.match(/^[A-Z]{4}\d*/gi)){
			cnCnt++;
			check_cn  += this.value + ",";
		}
	});

	if(($('div.searchList input.chk:checked').length == 0 && !control_no) || ($('div.searchList input.chk:checked').length > 0 && check_cn == '')){
		alert('신청 할 항목을 선택하십시오.');
		return;
	}

	if(control_no){
		check_cn = control_no;
	}


	//SERL이 포함되어 있거나 여러 건의 SERL 정보가 있을 경우에는 안내 OR 전용 팝업으로 안내
	if(check_cn.match(/SERL/gi)){
		if($('.detailContent2 input.chk:checked').length > 0){
			loanBasketInsertSerlDetailView(loanGubun);
		}else if(check_cn.match(/SERL/gi).length > 1 || cnCnt > 1){
			alert('학술지나 신문 자료는 1개만 선택하여 신청할 수 있습니다.');
		}else{
			check_cn = check_cn.replace(',','');
			selectSerlVolumnList(loanGubun, check_cn);
		}
		return;
	}

	var html = "<input type='hidden' name='check_cn' value='" + check_cn + "'>";

	//저장전 자료 확인
	checkBasketFlag = "N";
	checkBasketCount(check_cn, loanGubun);
	if(checkBasketFlag == "L"){
		location.href = "/login.do";
		return;
	}else if(checkBasketFlag == "N"){
		alert("신청가능한 자료가 없습니다.");
		return;
	}

	var form = document.createElement("form");
	form.action = "/loan/loanBasketInsert.do?loanGubun=" + loanGubun;
	form.method = "post";
	form.innerHTML = html;

	$("body").append(form);

	form.submit();
}

/**
 * 열람신청 전 각분기별 서울 본관, 부산관 책수량파악후 없으면 N 있으면 Y
 * 20211129 KHJ
 * */
function checkBasketCount(check_cn, loanGubun){

	 $.ajax({
         url : '/loan/checkBasketCount.do'
         , type : 'POST'
         , data : {"check_cn":check_cn, "loanGubun":loanGubun}
         , dataType: 'json'
         , async: false
         , success : function(result){
       	  	checkBasketFlag = result.data;
         },
         error : function (){
             alert("에러");
         }
     });
}



//상호이용신청, 20211115 KHJ
function loanMutalInsert(loanGubun, controlNo) {
	var html = "<input type='hidden' name='check_cn' value='" + controlNo + "'>";
	var form = document.createElement("form");
	form.action = "/loan/loanBasketInsert.do?loanGubun="+loanGubun;
	form.method = "post";
	form.innerHTML = html;
	$("body").append(form);
	form.submit();
}



function selectSerlVolumnList(loanGubun, controlNo, pubYear){

	if(!pubYear){
		pubYear = '';
	}else{
		$('#loanSerlPopupList input[name="current_year"]').val(pubYear);
	}

	if(loanGubun){
		$('#loanSerlPopupList input[name="loanGubun"]').val(loanGubun);
	}

	if(controlNo){
		$('#loanSerlPopupList input[name="check_cn"]').val(controlNo);
	}else{
		controlNo = $('#loanSerlPopupList input[name="check_cn"]').val();
	}

	if(loanGubun == 'R'){
		$('#btn_r').show();
		$('#btn_r').siblings('div').hide();
	}else if(loanGubun == 'B'){
		$('#btn_b').show();
		$('#btn_b').siblings('div').hide();
	}else if(loanGubun == 'L'){
		$('#btn_l').show();
		$('#btn_l').siblings('div').hide();
	}else if(loanGubun == 'O'){
		$('#btn_o').show();
		$('#btn_o').siblings('div').hide();
	}

	$.ajax({
		type: "GET",
		url: "/loan/loanSerlList.do",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		data: {
			controlNo : controlNo
			, pubYear: pubYear
		},
		success: function(data) {
			if(data.status == "success"){

				var CALL_NO   = data.CALL_NO   == undefined ? "" : data.CALL_NO;
				var TITLE     = data.TITLE     == undefined ? "" : data.TITLE;
				var PUB_AREA  = data.PUB_AREA  == undefined ? "" : data.PUB_AREA;
				var PAGE      = data.PAGE      == undefined ? "" : data.PAGE;
				var ISSN      = data.ISSN      == undefined ? "" : data.ISSN;

				if(CALL_NO == ""){
					$('#loanSerlPopupList #callNo').parent().hide();
				}else{
					$('#loanSerlPopupList #callNo').parent().show();
					$('#loanSerlPopupList #callNo').text(CALL_NO);
				}

				if(TITLE == ""){
					$('#loanSerlPopupList #title').parent().hide();
				}else{
					$('#loanSerlPopupList #title').parent().show();
					$('#loanSerlPopupList #title').text(TITLE);
				}

				if(PUB_AREA == ""){
					$('#loanSerlPopupList #pub').parent().hide();
				}else{
					$('#loanSerlPopupList #pub').parent().show();
					$('#loanSerlPopupList #pub').text(PUB_AREA);
				}

				if(PAGE == ""){
					$('#loanSerlPopupList #page').parent().hide();
				}else{
					$('#loanSerlPopupList #page').parent().show();
					$('#loanSerlPopupList #page').text(PAGE);
				}

				if(ISSN == ""){
					$('#loanSerlPopupList #issn').parent().hide();
				}else{
					$('#loanSerlPopupList #issn').parent().show();
					$('#loanSerlPopupList #issn').text(ISSN);
				}

				$("#loanSerlPopupList > div > div.bottom > div.year.mb10 > div > div.select.selectBoxD > a").text(data.pubYear);
				$('#loanSerlPopupList #loanSerlPopupList input[name="current_year"]').val(data.pubYear);

				$('#loanSerlPopupList #yearList li').remove();
				$('#loanSerlPopupList #year option').remove();
				
				if(data.pubYearList == undefined && data.pubYearList == null) {
//					alert("신청가능한 자료가 없습니다.");
					alert("해당 자료실에 직접 문의하시기 바랍니다.");
					return;
				}
				
				$(data.pubYearList.split(',')).each(function(index, value){
					if(data.pubYear == value){
						$('#loanSerlPopupList #year').append('<option value="' + value + '" selected="selected">' + value + '</option>');
					}else{
						$('#loanSerlPopupList #year').append('<option value="' + value + '">' + value + '</option>');
					}
					$('#loanSerlPopupList #yearList').append('<li><a href="#" title="' + value + '">' + value + '</a></li>');
				});

				$('#loanSerlPopupList #dataTable tbody tr').remove();
				var tbody = $('#loanSerlPopupList #dataTable tbody');
				$(data.serlVolumnList).each(function(index, item){
					var tr = '<tr>';
					tr += '<td><input type="checkbox" name="check" class="chk" value="' + item.CONTROL_NO + '_' + item.VOLUME_NO + '"';
					if(item.ISDB == 'Y'){
						tr += ' disabled="disabled"';
					}
					tr += '<label for="chk1">' + (index + 1) + '</label></td>';
					tr += '<td>' + item.PUB_DATE + '</td>';
					tr += '<td>' + item.VOLUME_NAME + '</td>';
					tr += '<td>' + item.BIND_STATE_NAME + '</td>';
					if(item.ISDB == 'Y'){
						tr += '<td>전자형태로만 열람 가능</td>';
						tr += '<td>유</td>';
					}else{
						tr += '<td></td>';
						tr += '<td>무</td>';
					}
					tr += "</tr>"
					$(tbody).append(tr);
				});

				$('#btnLoanSerlPopupOpen').click();
			}else if(data.status == "fail"){
				alert(data.error_msg);
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}

function loanBasketInsertSerl(loanGubun){
	var check_cn = '';

	if($('#loanSerlPopupList input.chk:checked').length == 0){
		alert('신청 할 항목을 선택하십시오.');
		return;
	}

	$('#loanSerlPopupList input.chk:checked').each(function(){
		check_cn  += this.value + ",";
	});

	var html = "<input type='hidden' name='check_cn' value='" + check_cn + "'>";
	var form = document.createElement("form");
	form.action = "/loan/loanBasketInsert.do?loanGubun=" + loanGubun;
	form.method = "post";
	form.innerHTML = html;

	$("body").append(form);

	form.submit();
}

function loanBasketInsertSerlDetailView(loanGubun){
	var check_cn = '';

	if($('.detailContent2 input.chk:checked').length == 0){
		alert('신청 할 항목을 선택하십시오.');
		return;
	}

	$('.detailContent2 input.chk:checked').each(function(){
		check_cn  += this.value + ",";
	});

	var html = "<input type='hidden' name='check_cn' value='" + check_cn + "'>";
	var form = document.createElement("form");
	form.action = "/loan/loanBasketInsert.do?loanGubun=" + loanGubun;
	form.method = "post";
	form.innerHTML = html;

	$("body").append(form);

	form.submit();
}

//#################################### 도서위치안내 레이어 팝업  ##################################
/**
 * 도서위치안내 이미지를 본다.
 * @returns
 */
function viewLocation(locaPath) {
	if (locaPath.length == 0) {
		return false;
	}
	
	$("#bookLocationInfo .img").children().remove();
	
	var viewLocationImg = document.createElement("img");
	viewLocationImg.id = "locationImg";
	viewLocationImg.alt = "도서위치안내";
	$("#bookLocationInfo .img").append(viewLocationImg);
	
	var map = locaPath.split("|");
	for (var i = 0; i < map.length; i++) {
		if (i==0) {
			$("#locationImg").attr("src", map[i]);
		}
		else {
			$("#locationImg").after("<img id=\"orgCoverImg"+i+"\" src=\"" + map[i] + "\" alt=\"도서위치안내\" />");
		}
	}
	previousFocus = document.activeElement;
	$("#bookLocationInfo").modal();
}

//#################################### 커버이지미 레이어 팝업  ##################################
/**
 * 커버 이미지를 본다.
 * @returns
 */
function viewCoverImg(covPath) {
	if (covPath.length == 0) {
		return false;
	}

	$("#orgCoverImg").attr("src", covPath);
	previousFocus = document.activeElement;
	$("#coverImg").modal();
}

//#################################### 원문관련 (PDF 및 다운로드)  ##################################
/**
 * 원문 보기를 한다.
 * @param controlNo
 * @param count
 * @returns
 */
function viewDoc(obj, controlNo, count) {

	if ($(obj).hasClass("readonly")) {
		return false;
	}

	if (parseInt(count) > 1) {
		getPDFInfoList(obj, controlNo, "VIEW");
	} else if (parseInt(count) == 1) {
		viewDocBySingleCount(controlNo);
	}
}

function viewDocItem(obj, controlNo, itemNo, count) {

	if ($(obj).hasClass("readonly")) {
		return false;
	}
	/*
	if(isMobile){
//		viewPdfExec(s_cn,s_db_name,s_title_info,s_tts,query)
		viewPdfExec(controlNo,'','','','',itemNo);
	} else {
		window.open("/view/callViewer?cn=" + controlNo + "&itemRegNo="+ itemNo + "&orgId=dl&linkSysId=NADL","viewer");
	}
	*/
	// JHJ 통합뷰어
	window.open("/view/callViewer?cn=" + controlNo + "&itemRegNo="+ itemNo + "&orgId=dl&linkSysId=NADL",controlNo + "_" + itemNo + "viewer");
	// CMK 통합뷰어
	//window.open("/view/callViewerTest.do?cn=" + controlNo + "&itemRegNo="+ itemNo + "&orgId=dl&linkSysId=NADL","viewer");

	return false;
}

/**
 * 원문을 다운로드 한다.
 * @param controlNo
 * @param count
 * @returns
 */
function downloadDoc(obj, controlNo, count) {
	if (parseInt(count) > 1) {
		getPDFInfoList(obj, controlNo, "DOWNLOAD");
	} else if (parseInt(count) == 1) {
		downloadBySingleCount(controlNo);
	}
}

/**
 * 단건 원문 보기를 한다.
 * @param controlNo
 * @returns
 */
function viewDocBySingleCount(controlNo) {
	/*
	if(isMobile){
//		viewPdfExec(s_cn,s_db_name,s_title_info,s_tts,query)
		viewPdfExec(controlNo,'','','','','');
	} else {
		window.open("/view/callViewer.do?controlNo=" + controlNo + "&orgId=dl&linkSysId=NADL", "viewer");
	}
	*/
	// JHJ 통합뷰어
	window.open("/view/callViewer.do?controlNo=" + controlNo + "&orgId=dl&linkSysId=NADL", controlNo + " Viewer");
}

/**
 * 미사용
 *
 * @param controlNo
 * @returns
 */
function viewDocBySingleCountAjax(controlNo) {
	var params = {};
//    params.controlNo = "KDMT1201456559";
    params.controlNo = controlNo;
    params.orgId = "dl";
    params.linkSysId = "NADL";

    console.log(params);

    jQuery.ajax({
		url       : "/view/callViewer.do",
   		type	  : "POST",
   		data      :  params,
		dataType  : "json",
  		async	  :  true,

  		success   : function(res){
  			var win = window.open("http://10.201.38.216/reader/"+ res.result.certId);
  			if (win) {
  				win.focus();
  			}
		}
 	});

//	window.open("/view/callViewer?cn=" + controlNo + "&orgId=dl&linkSysId=NADL","viewer");
	return false;
}

/**
 * 단건 원문 다온로드를 한다.
 * @param controlNo
 * @returns
 */
function downloadBySingleCount(controlNo, volumeNo) {
    var form = document.createElement("form");
    form.setAttribute("method", "get");
    form.setAttribute("target", "_blank");
    form.setAttribute("style", "display:none;");
    if(volumeNo == null){
        form.setAttribute("action", "/file/fileDownload.do");
        var input1 = document.createElement("input");
    	input1.setAttribute("type", "hidden");
    	input1.setAttribute("name", "linkSystemId");
    	input1.setAttribute("value", "NADL");
    	form.appendChild(input1);
    	var input2 = document.createElement("input");
    	input2.setAttribute("type", "hidden");
    	input2.setAttribute("name", "controlNo");
    	input2.setAttribute("value", controlNo);
    	form.appendChild(input2);
    }else{
    	form.setAttribute("action", "/file/fileDownload.do");
        var input1 = document.createElement("input");
    	input1.setAttribute("type", "hidden");
    	input1.setAttribute("name", "linkSystemId");
    	input1.setAttribute("value", "NADL");
    	form.appendChild(input1);
    	var input2 = document.createElement("input");
    	input2.setAttribute("type", "hidden");
    	input2.setAttribute("name", "controlNo");
    	input2.setAttribute("value", controlNo);
    	form.appendChild(input2);
    	var input3 = document.createElement("input");
    	input3.setAttribute("type", "hidden");
    	input3.setAttribute("name", "volumeNo");
    	input3.setAttribute("value", volumeNo);
    	form.appendChild(input3);
    }
    document.body.appendChild(form);
    form.submit();
    return false;
}


function downloadItem(controlNo, itemNo) {
    var form = document.createElement("form");
    form.setAttribute("method", "get");
    form.setAttribute("target", "_blank");
    form.setAttribute("style", "display:none;");

    form.setAttribute("action", "/file/fileDownload.do");
    var input1 = document.createElement("input");
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "linkSystemId");
	input1.setAttribute("value", "NADL");
	form.appendChild(input1);
	var input2 = document.createElement("input");
	input2.setAttribute("type", "hidden");
	input2.setAttribute("name", "controlNo");
	input2.setAttribute("value", controlNo);
	form.appendChild(input2);
	var input3 = document.createElement("input");
	input3.setAttribute("type", "hidden");
	input3.setAttribute("name", "itemNo");
	input3.setAttribute("value", itemNo);
	form.appendChild(input3);

    document.body.appendChild(form);
    form.submit();
    return false;
}
/**
 * 다건 원문 보기를 한다.
 * @param controlNo
 * @returns
 */
function getPDFInfoList(obj, controlNo, type) {

	var divId = type + "_" + controlNo;
	if ($("#" + divId).css("display") == "block") {
		$("#" + divId).slideUp('fast');
		return false;
	}

	$.ajax({
        url        : "/search/getPDFInfoList.do",
        type       : "POST",
        data       : {controlNo : controlNo},
        dataType   : "json",
        success    : function(data) {
        	if (data != null && data.length > 0) {
	        	var docHtml = "<ul>\n";
	        	for (var i = 0; i < data.length; i++) {
	        		var controlNo    = data[i].controlNo    == undefined ? ""   : data[i].controlNo;
	        		var itemNo    = data[i].itemNo    == undefined ? ""   : data[i].itemNo;
	        		var itemName    = data[i].itemName    == undefined ? ""   : data[i].itemName;
	        		var docPath    = data[i].docPath    == undefined ? ""   : data[i].docPath;
	        		var tocPath    = data[i].tocPath    == undefined ? ""   : data[i].tocPath;
	        		var pdfInfo    = data[i].pdfInfo    == undefined ? null : data[i].pdfInfo;
    				var count         = pdfInfo.count;
    				var iconClass     = pdfInfo.iconClass;
    				var iconDesc      = pdfInfo.iconDesc;
    				var iconDescClass = pdfInfo.iconDescClass;
    				var downloadYn    = pdfInfo.downloadYn;
    				var docTts = pdfInfo.docTts;
    				iconClass = iconClass.replace("pdf","item");

	        		docHtml += "    <li>\n";
	        		docHtml += "        <h3>" + itemName + "</h3>\n";
	        		docHtml += "        <ol>\n";
	        		docHtml += "            <li class=\"" + iconClass + "\"><a href=\"#none\" onclick=\"viewDocItem(this, '" + controlNo + "', '" + itemNo + "','1');\" title=\"원문보기\">원문보기</a></li>\n";
	        		if (docTts == "N") {
	        			docHtml += "            <li class=\"ocr\"><a href=\"#none\" onclick=\"viewOcrItem(this, '" + controlNo + "', '" + itemNo + "','1');\" title=\"OCR\">OCR</a></li>\n";
	        		}
	        		if (downloadYn == "Y") {
	        			docHtml += "            <li class=\"item2\"><a href=\"#none\" onclick=\"downloadItem('" + controlNo + "', '" + itemNo + "')\"; title=\"다운로드\">다운로드</a></li>\n";
	        		}
	        		if (tocPath.length > 0) {
	        			docHtml += "            <li class=\"item3\"><a href=\"#none\" onclick=\"viewVolumeToc(this, '" + controlNo + "', '" + tocPath + "', '1')\"; title=\"목차보기\">목차보기</a></li>\n";
	        		}
	        		docHtml += "        </ol>\n";
	        		docHtml += "    </li>\n";

	        	}
	        	docHtml += "</ul>\n";

	        	$("#" + divId).children().remove()
	        	$("#" + divId).html(docHtml);

	        	var resultType = $("#resultType").val();
	        	if (resultType == "INNER_SEARCH_LIST") {
	        		$(".searchList .dataInfo .arrow").not($(obj)).removeClass("on");
	        	}

	    		$(".detail").not("#" + divId).hide();
	    		$(obj).next(".originalDetail").slideToggle('fast');
        	}
        }
    });
}

//#################################### e-book  ##################################
function viewEbook(obj, userId, userPassword, userName, isbn, isMobile, controlNo) {

	if ($(obj).hasClass("readonly")) {
		return false;
	}

	//TODO 임시로 e-book 사이트 메인화면으로 이동 되도록 수정
//	window.open('http://e-book.nanet.go.kr:8080/MainPage.aspx');
//	return;

	if('Y' == isMobile){
		const regExp = /^N[0-9]+$/g;
		if(regExp.test(isbn)) {
			isbn = "NURI_"+isbn;
		}

		window.location.href = '/mobile/ebookDetailView.do?eancode=' + isbn;
		return;
	}
//	if (isbn == null || isbn == "") {
//		alert("전자책 서비스 정비 중입니다.");
//		return;
//	}

//	userId       = "mobiletest";
//	userPassword = "mobile123";
//	userName     = "모바일테스트";
//	isbn         = "9788932967233";

	var param = {
		userId       : userId,
		userPassword : userPassword,
		userName     : userName,
		isbn         : isbn
	}


	// 외부기관 링크 로그 2021-11-15
	logoOutLink('', controlNo, 'EBOK', '/search/viewEbook.do');

	openViewEbookPopup(param);
}

//#################################### audio book  ##################################
function viewAudioBook(obj, srcUrl, audioType, cn) {

	if ($(obj).hasClass("readonly")) {
		return false;
	}

	if(cn){
		/* log_viewfee 로그 막기 - 2021-11-16
		$.ajax({
			url        : "/viewer/adbk_cxg_cert_nadl.do",
			type       : "POST",
			data       : {controlNo : cn},
			dataType   : "json",
			success    : function(data) {
			}
		});
		*/
		// 외부기관 링크 로그 2021-11-15
		logoOutLink('', cn, 'ADBK', srcUrl);

	}


	// 오디오북 타입별 팝업 형태가 달라진다.
	if (audioType == "old") {
		openViewAudioPopupByOld(srcUrl);
	} else if (audioType == "new") {
		var userId          = srcUrl.split("&")[0].split('=')[1];
		var voId            = srcUrl.split("&")[1].split('=')[1];

		var param = {
			audioType : audioType,
			userId    : userId,
			voId      : voId
//			userId    : srcUrl.split("&")[0].split('=')[1],
//			voId      : "7022836"
		};

		openViewAudioPopupByNew(param);
	}
}

//#################################### media  ##################################
/*
function viewMedia(obj, controlNo, callNo) {

//  테스트용 데이터
//	controlNo = "NONB1202009091";
//	callNo    = "EV00004135";

	var param = {
		controlNo : controlNo,
		callNo    : callNo
	};

	// 외부기관 링크 로그 2021-11-15
	logoOutLink('', controlNo, 'VDBK', '/search/viewMedia.do');
	openViewMediaPopup(param);
}
*/

function viewMedia(obj, controlNo, linkUrl) {

	// 외부기관 링크 로그 2021-11-15
	logoOutLink('', controlNo, 'VDBK', linkUrl);
	window.open(linkUrl, "VOD Player");
}

//#################################### thumbnail  ##################################
function thumbImageOnError(obj) {
	var imgSrc =  "/images/ko/thumb/noimage.jpg";
	$(obj).attr("src", imgSrc);
}

/**
 * 표그림 DB를 본다.
 * @returns
 */
function viewREFDImg(covPath, controlNo) {
	if (covPath.length == 0) {
		return false;
	}

	covPath = covPath.replace("_thumb", "");
	$.ajax({
        url        : "/search/getREFDImage.do",
        type       : "POST",
        data       : {covPath : covPath, controlNo : controlNo},
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {

        		var imgSrc        = data.imgSrc        == undefined ? "" : data.imgSrc;
        		var refdType      = data.refdType      == undefined ? "" : data.refdType;
        		var docPath       = data.docPath       == undefined ? "" : data.docPath;
        		var docPath2      = data.docPath2      == undefined ? "" : data.docPath2;
        		var linkControlNo = data.linkControlNo == undefined ? "" : data.linkControlNo;
        		var linkDocSvc    = data.linkDocSvc    == undefined ? "" : data.linkDocSvc;

        		if (imgSrc.length > 0) {
        			$("#orgREFDImg").attr("src", data.imgSrc);
        		}

        		// PDF
        		if (docPath.length > 0) {
        			$("#viewPdfByREFDImg").attr("onclick", "javascript:viewDocBySingleCount('" + controlNo + "')");
        			$("#viewPdfByREFDImg").show();
        		}

        		// 출처보기
        		if (linkControlNo.length > 0) {
        			if (linkDocSvc == 10) {
        				$("#viewOrgPdfByREFDImg").attr("onclick", "javascript:viewDocBySingleCount('" + linkControlNo + "')");
        				$("#viewOrgPdfByREFDImg").show();
        			}
        		}

        		// 엑셀 다운로드
        		if (docPath2.length > 0 && refdType == "표") {
        			$("#downloadExcelByREFDImg").attr("onclick", "javascript:downloadExcelByREFDImg('" + controlNo + "')");
        			$("#downloadExcelByREFDImg").show();
        		}else{
        			$("#downloadExcelByREFDImg").hide();
        		}
        		previousFocus = document.activeElement;
        		$("#refdImg").modal();
        	}
        }
    });
}

function downloadExcelByREFDImg(controlNo) {
	alert("이 자료는 자동 문자인식 시스템을 통해 생성되므로 반드시 원본을 확인하시기 바랍니다.");
	location.href = "/search/downloadExcelByREFD.do?controlNo=" + controlNo;
}

function openViewArticle(controlNo, volumeNo) {
	$.ajax({
        url        : "/search/viewArticle.do",
        type       : "POST",
        data       : {controlNo : controlNo, volumeNo : volumeNo},
        dataType   : "json",
        success    : function(data) {
        	if (data != null && data.length > 0) {

        		var articleHtml = "";
        		for (var i = 0; i < data.length; i++) {
            		var artNo      = data[i].artNo      == undefined ? ""   : data[i].artNo;
            		var artName    = data[i].artName    == undefined ? ""   : data[i].artName;
            		var authorName = data[i].authorName == undefined ? ""   : data[i].authorName;
            		var page       = data[i].page       == undefined ? ""   : data[i].page;
            		var pdfInfo    = data[i].pdfInfo    == undefined ? null : data[i].pdfInfo;
            		var tocPath    = data[i].tocPath    == undefined ? ""   : data[i].tocPath;

        			articleHtml += "<tr>\n";
        			articleHtml += "    <td><a href=\"/search/searchInnerDetail.do?controlNo=" + artNo + "\" title=\"" + artNo + " 상세페이지 이동\">" + artName   + "</a></td>\n";
        			articleHtml += "    <td>" + authorName   + "</td>\n";
        			articleHtml += "    <td>" + page + "</td>\n";

        			if (pdfInfo != null) {
        				var count         = pdfInfo.count;
        				var iconClass     = pdfInfo.iconClass;
        				var iconDesc      = pdfInfo.iconDesc;
        				var iconDescClass = pdfInfo.iconDescClass;
        				var downloadYn    = pdfInfo.downloadYn;

        				if (parseInt(count) > 0) {
            				articleHtml += "    <td>";
            				/*
            				if (isMobile) {
            					articleHtml += "        <a href=\"#none\" class=\"original mr10 " + iconClass +  "\" onclick=\"viewPdfExec('" + artNo + "', '"+artNo.substring(0,4)+"', '" + data[i].artName + "', '"+data[i].docTtsPub+"', '"+prevSearchQuery+"');\"><span class=\"vab " + iconDescClass + "\">" + iconDesc + "</span></a>";
            				} else {
            					articleHtml += "        <a href=\"#none\" class=\"original mr10 " + iconClass +  "\" onclick=\"viewDoc(this, '" + artNo + "', '" + count + "')\";><span class=\"vab " + iconDescClass + "\">" + iconDesc + "</span></a>";
            				}
							*/
            				// JHJ 통합뷰어
            				articleHtml += "        <a href=\"#none\" class=\"original mr10 " + iconClass +  "\" onclick=\"viewDoc(this, '" + artNo + "', '" + count + "')\";><span class=\"vab " + iconDescClass + "\">" + iconDesc + "</span></a>";

            				if (downloadYn == "Y") {
            					articleHtml += "        <a href=\"#none\" class=\"original download\" onclick=\"downloadDoc(this, '" + artNo + "', '" + count + "')\";>다운로드</a>";
            				}
            				articleHtml += "    </td>\n";
        				} else {
        					articleHtml += "    <td></td>\n";
        				}
        			} else {
        				articleHtml += "    <td></td>\n";
        			}

        			if (tocPath.length > 0) {
        				articleHtml += "                    <td><a href=\"#none\" class=\"view arrow2\" title=\"보기\" onclick=\"viewVolumeToc(this, '" + artNo + "', '" + tocPath + "', '" + i +  "')\">보기</a></td>\n";
        			} else {
        				articleHtml += "    <td></td>\n";
        			}

        			articleHtml += "</tr>\n";

        			articleHtml += "            <tr class=\"viewWrap tdNone\">\n";
        			articleHtml += "                <td colspan=\"5\" class=\"tdBlock\">\n";
        			articleHtml += "                    <div class=\"wrap\">\n";
        			articleHtml += "                        <div class=\"txt tl\" id=\"TOC_" + artNo + "_" + i + "\"></div>\n";
        			articleHtml += "                    </div>\n";
        			articleHtml += "                </td>\n";
        			articleHtml += "            </tr>\n";
        		}

        		$("#articleContents").children().remove();
        		$("#articleContents").html(articleHtml);
        		previousFocus = document.activeElement;
        		$("#article").modal();

        		$(".table").footable();
        	}
        }
    });
}

/**
 * 테이블 형태의 권호기사 또는 권호의 목차 보기
 * @param obj
 * @param controlNo
 * @param filePath
 * @param seqNo
 * @returns
 */

function viewTocByTable(obj, controlNo, filePath, seqNo) {
	// 목차보기가 열려 있는 경우, 호출 안함
	if ($(obj).hasClass("on")) {
		$(obj).toggleClass("on");
    	$(obj).parent().parent().next(".viewWrap").slideToggle("fast");
		return false;
	}

	if($("#TOC_" + controlNo + "_" + seqNo).html() == '') {
		$.ajax({
	        url        : "/search/getFileContents.do",
	        type       : "POST",
	        data       : {filePath : filePath},
	        dataType   : "json",
	        success    : function(data) {
	        	$("#TOC_" + controlNo + "_" + seqNo).html(data);

	        	$(obj).toggleClass("on");
	        	$(obj).parent().parent().next(".viewWrap").slideToggle("fast");
	        }
	    });
	} else {
    	$(obj).toggleClass("on");
    	$(obj).parent().parent().next(".viewWrap").slideToggle("fast");
	}
}

//#################################### 권호 목차 정보 ##################################
function viewVolumeToc(obj, controlNo, filePath, seqNo) {

	$.ajax({
        url        : "/search/getFileContents.do",
        type       : "POST",
        data       : {filePath : filePath},
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {
        		$("#VOLUME_TOC_TBODY").children().remove();
                $("#VOLUME_TOC_TBODY").html(data);
                previousFocus = document.activeElement;
                $("#volumeToc").modal();
        	}
        }
    });
}

function printVolumeToc(obj) {
    var param = {
   		contentHtml : "<li>" + $('#VOLUME_TOC_TBODY').clone().html() + "</li>",
   		handlerType : "print"
    };

    openPrintPopup(param);
}

//#################################### 도서예약 처리, branchCode추가. 20211209 KHJ  ##################################
function fn_reser_submit(itemRegNo, branchCode) {
	$.ajax({
		type: "GET",
		url: "/loan/loanReservation.do",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		data: {itemRegNo:itemRegNo, branchCode:branchCode},
		success: function(data) {
			
			if(data != null && data.error_msg == 'search.pc.not.login' ){
				$('#searchPcLoginPw').val('');
				$('#searchPcLoginId').val('');
				$('#pwdErrorDiv').hide();
				$('#searchPcItemRegNo').val(data.itemRegNo);
				$('#searchPcBranchCode').val(data.branchCode);
				//검색대에서 열람 신청 시 실제 사용자 정보를 얻기 위한 로그인 처리 화면
				$('#searchPcLoginPopup').click();
				
			}else{
				var msg_type_code = data.message[0].msg_type_code;
				var msg_content = data.message[0].msg_content;
				var msg_name = data.message[0].msg_name;

				if(msg_name == null){
					$('#confirmPopup p.mb30').text(msg_content);
				}else{
					$('#confirmPopup p.mb30').text(msg_name);
				}

				$('#confirmPopupOpenLink').click();
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}




//#################################### 우편 복사 신청  ##################################
/**
 * 우편복사 신청목록담기(선택된 것 확인)
 */
function insertPostCopyPrepare(control_no, cdDataType, cdDbSub) {

	var check_cn = '';
	var cnCnt = 0;

	// 업무망은 못 함
	if(INTERNET_R == "1"){
		$('#confirmPopup p.mb30').text("인터넷망을 이용해 주시기 바랍니다.");
		$('#confirmPopupOpenLink').click();
		return ;
	}


	if(control_no){
		// 상세에서 담기 버튼
		// 3,4,5 시작
		// 23C
	    if(cdDataType.indexOf("3") == 0
	    	|| cdDataType.indexOf("4") == 0
	   		|| cdDataType.indexOf("5") == 0
	   		|| cdDataType == "23C"		// E-Book
	   		|| cdDbSub == "OLDP"		// 고서
	   		|| cdDbSub == "NEWS"		// 뉴스
			|| cdDbSub == "WEDB"		// 전자저널
			|| cdDbSub == "VDBK"		// 동영상자료
			|| cdDbSub == "ADBK"		// 오디오자료
			|| cdDbSub == "CDBK"		// 전자매체
			|| cdDbSub == "MIFO"		// 마이크로폼자료
			|| cdDbSub == "MAPI"		// 지도/기타자료
	   		|| cdDbSub == "TLAW"		// TLAW
	   		|| cdDbSub == "PROC"		// 국회희의록
	   		|| cdDbSub == "REFD"		// 표그림
	   		|| cdDbSub == "KSDB"		// 지식공유
	    ){
	    	alert("우편복사 신청이 불가능한 자료입니다. \n(※ 우편복사 신청 관련 문의: 02-6788-4175/4272 )");
//	    	$('#confirmPopup p.mb30').html("우편복사 신청이 불가능한 자료입니다. <br/>(※ 우편복사 신청 관련 문의: 02-6788-4175/4272 )");
//			$('#confirmPopupOpenLink').click();
			return ;
	    }

	    check_cn = control_no;
	} else {
		// 목록에서 담기 버튼
		// 1.목록 cdDataType , cdDbSub 체크
		// 2.controlNo, 타이틀 정도 모달에 세팅해서 페이지 받기





	}

	// 목록에서 체크 되면 목록으로 담기
    $('div.searchList input.chk:checked').each(function(){
		//제어번호 형태가 아닐 경우 제외 처리
		if(this.value.match(/^[A-Z]{4}\d*/gi)){
			cnCnt++;
			check_cn  += this.value + ",";
		}
	});

	if(($('div.searchList input.chk:checked').length == 0 && !control_no) || ($('div.searchList input.chk:checked').length > 0 && check_cn == '')){
		alert('신청 할 항목을 선택하십시오.');
		return;
	}

	if(!check_cn){
    	check_cn = control_no;
    } else {
    	check_cn.substring(0, check_cn.length-1);
    }

	var chkLength = $('.detailContent2 input.chk:checked').length;


	//SERL이 포함되어 있거나 여러 건의 SERL 정보가 있을 경우에는 안내 OR 전용 팝업으로 안내
	if(check_cn.match(/SERL/gi)){
//		// 학술지기사, 신문자료 1개 이상 일 때 1개만 선택가능 메시지
//		if($('div.searchList input.chk:checked').length > 1){
//			alert('학술지 자료는 1개만 선택해 주세요.');
//
//		// 1개 선택시 페이지 받기(레이어팝업)
//		}else if($('div.searchList input.chk:checked').length == 1){
//			$('.detailContent2 input.chk:checked').each(function(){
//				check_cn  = this.value;
//			});
//			$("#postCopyCn").val(check_cn);
//			$("#postCopyPage").modal();
//
//		// 선택 안 했을 시 선택 메시지
//		} else {
//			alert('우편복사 신청할 자료를 권호정보에서 1개만 선택해 주세요.');
//		}

		// 상세에서 serl 담기 시 권호 레이어 띄움
		selectPostSerlVolumnList(check_cn);
		return;

	}

	// 나중에 목록이랑 분기처리
	// 레이어 팝업창으로 페이징 받기
	$("#postCopyCn").val(check_cn);
	$("#exampleArea").css("display", "none");
	$("#postCopyPage .wrap").css("display", "inline-block");
	$("#postCopyPage").modal();

}

/**
 * 우편복사 학술지 레이어팝업
 *
 * */
function selectPostSerlVolumnList(controlNo, pubYear){

	if(!pubYear){
		pubYear = '';
	}else{
		$('#postSerlPopupList input[name="current_year"]').val(pubYear);
	}

	if(controlNo){
		$('#postSerlPopupList input[name="check_cn"]').val(controlNo);
	}else{
		controlNo = $('#postSerlPopupList input[name="check_cn"]').val();
	}

	$.ajax({
		type: "GET",
		url: "/loan/loanSerlList.do",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		data: {
			controlNo : controlNo
			, pubYear: pubYear
		},
		success: function(data) {
			if(data.status == "success"){
				if(data.pubYearList){

	//				var CALL_NO   = data.CALL_NO   == undefined ? "" : data.CALL_NO;
	//				var TITLE     = data.TITLE     == undefined ? "" : data.TITLE;
	//				var PUB_AREA  = data.PUB_AREA  == undefined ? "" : data.PUB_AREA;
	//				var PAGE      = data.PAGE      == undefined ? "" : data.PAGE;
	//				var ISSN      = data.ISSN      == undefined ? "" : data.ISSN;
	//
	//				if(CALL_NO == ""){
	//					$('#postSerlPopupList #callNo').parent().hide();
	//				}else{
	//					$('#postSerlPopupList #callNo').parent().show();
	//					$('#postSerlPopupList #callNo').text(CALL_NO);
	//				}
	//
	//				if(TITLE == ""){
	//					$('#postSerlPopupList #title').parent().hide();
	//				}else{
	//					$('#postSerlPopupList #title').parent().show();
	//					$('#postSerlPopupList #title').text(TITLE);
	//				}
	//
	//				if(PUB_AREA == ""){
	//					$('#postSerlPopupList #pub').parent().hide();
	//				}else{
	//					$('#postSerlPopupList #pub').parent().show();
	//					$('#postSerlPopupList #pub').text(PUB_AREA);
	//				}
	//
	//				if(PAGE == ""){
	//					$('#postSerlPopupList #page').parent().hide();
	//				}else{
	//					$('#postSerlPopupList #page').parent().show();
	//					$('#postSerlPopupList #page').text(PAGE);
	//				}
	//
	//				if(ISSN == ""){
	//					$('#postSerlPopupList #issn').parent().hide();
	//				}else{
	//					$('#postSerlPopupList #issn').parent().show();
	//					$('#postSerlPopupList #issn').text(ISSN);
	//				}

					$("#postSerlPopupList > div > div.bottom > div.year.mb10 > div > div.select.selectBoxD > a").text(data.pubYear);
					$('#postSerlPopupList #loanSerlPopupList input[name="current_year"]').val(data.pubYear);

					$('#postSerlPopupList #yearList li').remove();
					$('#postSerlPopupList #year option').remove();
					$(data.pubYearList.split(',')).each(function(index, value){
						if(data.pubYear == value){
							$('#postSerlPopupList #year').append('<option value="' + value + '" selected="selected">' + value + '</option>');
						}else{
							$('#postSerlPopupList #year').append('<option value="' + value + '">' + value + '</option>');
						}
						$('#postSerlPopupList #yearList').append('<li><a href="#" title="' + value + '">' + value + '</a></li>');
					});

					$('#postSerlPopupList #dataTable tbody tr').remove();
					var tbody = $('#postSerlPopupList #dataTable tbody');
					$(data.serlVolumnList).each(function(index, item){
						var tr = '<tr>';

						tr += '<td><input type="checkbox" name="check" class="chk" value="' + item.CONTROL_NO + '_' + item.VOLUME_NO + '"';
						tr += ' onclick="postSerlPageCntToggle(this)"';
						tr += '<label for="chk1">' + (index + 1) + '</label></td>';
						tr += '<td>' + item.PUB_DATE + '</td>';
						tr += '<td>' + item.VOLUME_NAME + '</td>';
						tr += '<td>' + item.BIND_STATE_NAME + '</td>';
						if(item.ISDB == 'Y'){
							tr += '<td>전자형태로만 열람 가능</td>';
							tr += '<td>유</td>';
						}else{
							tr += '<td></td>';
							tr += '<td>무</td>';
						}

						tr += '<td><input type="text" name="postSerlPageCnt" class="" disabled="disabled"/>' + '</td>';

						tr += "</tr>"
						$(tbody).append(tr);
					});

					$("#postSerlPopupList #chkAll").prop("checked", false);
					$('#btnPostSerlPopupOpen').click();

				//자료 없을
				} else {
					$('#confirmPopup p.mb30').css("white-space", "pre");
					$('#confirmPopup p.mb30').text("해당 자료의 권호정보가 없습니다. \n(※ 우편복사 신청 관련 문의: 02-6788-4175/4272)");
					$('#confirmPopupOpenLink').click();
				}
			} else if(data.status == "fail"){
				alert(data.error_msg);
			//자료 없을
			} else {
				$('#confirmPopup p.mb30').css("white-space", "pre");
				$('#confirmPopup p.mb30').text("해당 자료의 권호정보가 없습니다. \n(※ 우편복사 신청 관련 문의: 02-6788-4175/4272)");
				$('#confirmPopupOpenLink').click();
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}


function insertPostCopySerl(){
	var postCopyCn = '';
	var postCopyPageCnt = '';
	var pageVali = false;

	if($('#postSerlPopupList input.chk:checked').length == 0){
		alert('신청 할 항목을 선택하십시오.');
		return;
	}

	$('#postSerlPopupList input.chk:checked').each(function(){
		postCopyCn  += this.value + ",";
		postCopyPageCnt += $(this).parent().parent().find('input[name=postSerlPageCnt]').val() + "$";
		if(!$(this).parent().parent().find('input[name=postSerlPageCnt]').val()){
			pageVali = true;
		}
	});

	if(pageVali){
		alert("신청페이지 값을 입력해주세요.");
		return;
	}

	postCopyCn = postCopyCn.substring(0,postCopyCn.length-1);
	postCopyPageCnt = postCopyPageCnt.substring(0,postCopyPageCnt.length-1);

	$.ajax({
        url        : "/loan/insertPostCopy.do",
        type       : "POST",
        data       : {postCopyCn : postCopyCn, postCopyPageCnt : postCopyPageCnt},
        dataType   : "json",
        //async      :  false,
        success    : function(data) {
            if (data.result == "SUCCESS") {
            	$("#postSerlPopupList").find("#closeModal").click();
            	$("#postCopyPageComplete").find("p").html("우편복사 목록담기를 완료하였습니다.");
            	$("#postCopyPageComplete").modal();
            } else {
            	$("#postCopyPageComplete").find("p").html(data.resultMsg);
            	$("#postCopyPageComplete").modal();
            }
        }
    });

//	var html = "<input type='hidden' name='check_cn' value='" + postCopyCn + "'>";
//	var form = document.createElement("form");
//	form.action = "/loan/loanBasketInsert.do?loanGubun=" + loanGubun;
//	form.method = "post";
//	form.innerHTML = html;
//
//	$("body").append(form);
//
//	form.submit();
}


/**
 * 우편복사 신청목록담기(session)
 */
function insertPostCopy(){
	var postCopyCn = $("#postCopyCn").val();
	var postCopyPageCnt = $("#postCopyPageCnt").val();
//	var pageList = postCopyPageCnt.split(",");
//	var pageValidation = false;
//
//	for(var i = 0; i < pageList.length; i++){
//		if(!pageList[i]
//			|| (pageList[i] != "전체" && !/\d\-\d/.exec(pageList[i]))
//		){
//			pageValidation = true;
//		}
//	}
//
//	if(pageValidation){
//		alert("신청페이지 형식이 맞지 않습니다.");
//		return;
//	}
	if(!postCopyPageCnt){
		alert("신청페이지 값을 입력해주세요.");
		return;
	}


	$.ajax({
        url        : "/loan/insertPostCopy.do",
        type       : "POST",
        data       : {postCopyCn : postCopyCn, postCopyPageCnt : postCopyPageCnt},
        dataType   : "json",
        //async      :  false,
        success    : function(data) {
            if (data.result == "SUCCESS") {
            	$("#postCopyPage").find("#closeModal").click();
            	$("#postCopyPageComplete").find("p").html("우편복사 목록담기를 완료하였습니다.");
            	$("#postCopyPageComplete").modal();
            } else {
            	$("#postCopyPageComplete").find("p").html(data.resultMsg);
            	$("#postCopyPageComplete").modal();
            }
        }
    });

}

//function showExample(){
//	$("#exampleArea").css("display", "inline-block");
//	$("#postCopyPage .wrap").css("display", "none");
//	$("#wrap").focus()
//}
//
//function hideExample(){
//	$("#exampleArea").css("display", "none");
//	$("#postCopyPage .wrap").css("display", "inline-block");
//}

/**
 * 예시보기
 * */
function toggleExample(){

	if($("#exampleArea").css("display") == "none"){
		$("#exampleArea").show();
		$("#exampleArea").css("opacity", 0).animate({opacity:1}, 200);
		$("#exampleDim").show();

		location.href = "#exampleImg";
	} else {
		$("#exampleArea").css("opacity", 1).animate({opacity:0}, 200);
		$("#exampleArea").hide();
		$("#exampleDim").hide();
	}
}

/**
 * 우편복사 신청목록으로 이동
 */
function goPostCopyList(){
//	location.href="/loan/postCopyList.do";

	var form = document.createElement("form");
	form.action = "/loan/postCopyList.do";
	form.method = "post";

	$("body").append(form);

	form.submit();
}

/**
 * OCR을 한다.
 * @param controlNo
 * @param count
 * @returns
 */
function ProcessOcr(obj, controlNo, count) {

	if ($(obj).hasClass("readonly")) {
		return false;
	}

	if (parseInt(count) > 1) {
		getPDFInfoList(obj, controlNo, "OCR");
	} else if (parseInt(count) == 1) {
		ProcessOcrBySingleCount(controlNo);
	}
}


/**
 * 단건 원문 보기를 한다.
 * @param controlNo
 * @returns
 */
function ProcessOcrBySingleCount(controlNo) {
	var w = 800;
	var h = 520;
	var LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	var TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	var settings ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',status=yes,resizable';
	var url = "/ocr/processOcrPop.do?controlNo=" + controlNo;
    ocrPop = window.open(url, "OCR", settings);
}

function viewOcrItem(obj, controlNo, itemNo, count) {

	if ($(obj).hasClass("readonly")) {
		return false;
	}
	
	var w = 800;
	var h = 520;
	var LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	var TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	var settings ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',status=yes,resizable';
	var url = "/ocr/processOcrPop.do?controlNo=" + controlNo + "&itemRegNo="+ itemNo;
    ocrPop = window.open(url, "OCR", settings);
}

/********************** 모바일 오디오북 오디언소리 연계 시작 ***************************/
var timer;				//타이머
var schInterval;		//인터벌

function clearTimer() {
	clearInterval(schInterval);
	clearTimeout(timer);
}

function intervalSch() {
	if(document.webKitHidden || document.hidden){
		clearTimer();
	} else {

	}
}

function viewAudioBookApp(srcUrl, cn, userId) {
	var mobileType = osChk();
	var voId = "";
	var AudienAppExec = "";
	var locationUrl = "";
	
	if(srcUrl != "" && srcUrl.indexOf("voId") != -1) {
		var srcUrlSplit = srcUrl.split("&");
		
		for(var i = 0; i < srcUrlSplit.length; i++) {
			if(srcUrlSplit[i].indexOf("voId") != -1) {
				voId = srcUrlSplit[i].substring((srcUrlSplit[i].indexOf("=") + 1), srcUrlSplit[i].length);
			}
		}
	} else {
		return false;
	}
	
	if(voId == "") {
		alert("오디오파일 ID 정보가 없습니다.");
		return false;
	}
	
	if(userId == "") {
		alert("사용자 아이디를 확인할 수 없습니다.");
		return false;
	}
	
	if(cn){
		/* log_viewfee 로그 막기 - 2021-11-16
		$.ajax({
			url        : "/viewer/adbk_cxg_cert_nadl.do",
			type       : "POST",
			data       : {controlNo : cn},
			dataType   : "json",
			success    : function(data) {
			}
		});
		*/
		// 외부기관 링크 로그 2021-11-15
		logoOutLink('', cn, 'ADBK', srcUrl);
	}
	
	AudienAppExec = "iaudienb2b://?paid=039d823034d823039d80&user_id="+userId+"&void="+voId;
	
	if (mobileType == 'android') {
		jQuery.ldLayer({
			maxSecondTime: 5,
			secondTimeViewYn: false,
			msgVal: 'Loading...',
			msgValViewYn: true,
			loadingImgViewYn: true
		});
		
		ldLayerShow();
		
		// android app 설치
		locationUrl = "market://details?id=com.app.audiobook.startup";
		try {
			// 오디언소리 앱 실행
			location.href = AudienAppExec;
		} catch(e) {
			$("#frame").attr("src", AudienAppExec);
		}

		//앱설치 체크
		schInterval = setInterval(intervalSch, 500);

		timer = setTimeout(function(){
			//앱 설치X
			clearInterval(schInterval);
			location.href = locationUrl;
			ldLayerHide();
		}, 5000);
	} else if (mobileType == 'ios') {
		// iso app 설치
		locationUrl = "itms-apps://itunes.apple.com/kr/app/apple-store/id451339970";
		
		try {
			// 오디언소리 앱 실행
			location.href = AudienAppExec;
		} catch(e) {
			$("#frame").attr("src", AudienAppExec);
		}

		//앱설치 체크
		schInterval = setInterval(intervalSch, 500);

		timer = setTimeout(function(){
			//앱 설치X
			clearInterval(schInterval);
			location.href = locationUrl;
		}, 2000);
	}
}

function osChk() {
	var osNm = "";
	
	var uagent = navigator.userAgent.toLowerCase();

	var iosStoreUrl = "http://itunes.apple.com/kr/app/gughoe-jeonjadoseogwan/id995150111?mt=8";
	var androidStoreUrl = "market://details?id=kr.go.nanet.mdl";
	var openAt = new Date; // 현재 시간 체크
	if (uagent.indexOf('iphone') > -1 || uagent.indexOf('ipad') > -1 || uagent.indexOf('ipod') > -1){
		osNm = "ios";
	}
	else if (uagent.indexOf('android') > -1){
		osNm = "android";
	}else{
		osNm = "android";
	}
	
	return osNm;
}
/********************** 모바일 오디오북 오디언소리 연계 종료 ***************************/