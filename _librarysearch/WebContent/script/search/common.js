/**
 * 공통 스크립트 정의
 * @author srlee
 * @returns
 */


/**
 * 현재 포커스 된 input id로 다국어 입력처리를 위해서 전역변수로 사용함.
 */
var G_MULTI_LANG_FOCUS_ID = "";
var G_MULTI_LANG_TYPE     = "L"; // L : 리스트 검색, D : 상세검색 레이어 팝업

$(document).ready(function() {
    // 검색조건 셋팅
    initSearchCondition();
    // 이벤트 등록
    addCommonEventListeners();

    //20210107 추가
    $("input[type=radio]").next("label").attr("tabindex", "0");
    $("input[type=checkbox]").next("label").attr("tabindex", "0");
    $("input[type=checkbox].chk9").attr(							"tabindex", "-1");
    $("#skipNavi a").eq(0).click(function(){
    	$("#gnb #myLib").focus();
    });

    //소장도서관 패킷 데이터 유지 ,20210923 KHJ추가
    $(document).on('click','.selDpBranch', function() {
    	$(".selDpBranch").removeClass("openBranch");
    	$(this).addClass("openBranch");
    	$("#dpBranch").val($(this).attr('data-dpBranch'));
    });


});
//#################################### 데이터 초기화 관련  ##################################
/**
 * 검색조건 초기화
 * @returns
 */
function initSearchCondition() {

    var searchType = $("#searchType").val();
    if (searchType == "INNER_SEARCH") {
        // #1. 기본검색, 전체(초록,목차,본문포함) 등 selectbox 셋팅
        try {$("#selZone").val(zone).prop("selected", true); } catch (error){ }
        var text = $("#selZone option:selected").text();
        $("#selZone").attr("title", text);
        $("#selZoneLabel").text(text);

        // 메인 검색은 제외
        var searchMehtod = $("#searchMehtod").val();
        if (searchMehtod != "M") {
            // 왼쪽 facet 선택 관련
            var selectedFacetList = new Array();
            $("#FACET_ORG_DOC > div > ul > li").each(function() {
                if ($(this).hasClass("on")) {
                    var parentMenuName = $(this).attr("data-api-name");
                    var childMenuName = "";
                    $("#FACET_ORG_DOC > div > ul > li > div > ul > li").each(function() {
                        if ($(this).hasClass("on")) {
                            childMenuName = $(this).attr("data-api-name");
                        }
                    })

                    var menuName = parentMenuName;
                    if (childMenuName.length > 0) {
                        menuName += " > " + childMenuName.replace("-", "");
                    }

                    var selectedFacet = {
                        menuType : $(this).attr("data-api-type"),
                        menuCode : $(this).attr("data-api"),
                        menuName : menuName,
                    };
                    selectedFacetList.push(selectedFacet);
                }
            });

            $("#FACET_LANGUAGE > div > ul > li").each(function(index) {
                if ($(this).hasClass("on")) {
                    var selectedFacet = {
                        menuType : $(this).attr("data-api-type"),
                        menuCode : $(this).attr("data-api"),
                        menuName : $(this).attr("data-api-name"),
                    };
                    selectedFacetList.push(selectedFacet);
                }
            });

            if($("#FACET_LANGUAGE").hasClass("on")) {
            	if ($("#FACET_LANGUAGE").children("div").children("ul").children("li").length <= 3 ) {
                	// 언어 facet 높이 자동 조절
            		$("#FACET_LANGUAGE").children("div").children("ul").addClass("on");
                    // 더보기 버튼 삭제 히든처리
            		$("#FACET_LANGUAGE").children("div").children("div").hide();
                }
            }

            //소장도서관 패킷정보 추가, 20211125 KHJ
            $("#FACET_DPBRANCH > div > ul > li").each(function(index) {
                if ($(this).hasClass("on")) {
                    var selectedFacet = {
                        menuType : $(this).attr("data-api-type"),
                        menuCode : $(this).attr("data-api"),
                        menuName : $(this).attr("data-api-name"),
                    };
                    selectedFacetList.push(selectedFacet);
                }
            });


            //학술지종류 정보 추가, 20211224 KHJ
            $("#FACET_JOURNALKIND > div > ul > li").each(function(index) {
                if ($(this).hasClass("on")) {
                    var selectedFacet = {
                        menuType : $(this).attr("data-api-type"),
                        menuCode : $(this).attr("data-api"),
                        menuName : $(this).attr("data-api-name"),
                    };
                    selectedFacetList.push(selectedFacet);
                }
            });



            try {
                if (fieldText.length > 0) {
                    var fieldTextArr = fieldText.split("@");
                    for (var i = 0; i < fieldTextArr.length; i++) {
                        var tempArr = fieldTextArr[i].split(":");

                        if (tempArr[1] == "DP_PUB_YEAR") {
                            var selectedFacet = {
                                menuType : "pubYear",
                                menuCode : fieldTextArr[i],
                                menuName : tempArr[0],
                            };
                            selectedFacetList.push(selectedFacet);
                        }
                    }
                }
            } catch (error) {}

            if (selectedFacetList.length > 0) {
                var searchCancelHtml = "<ul>\n";
                for (var i = 0; i < selectedFacetList.length; i++) {
                    var selectedFacet = selectedFacetList[i];
                    searchCancelHtml += "<li><span>" + selectedFacet.menuName + "</span><a href=\"javascript:cancelLeftFacet('" + selectedFacet.menuType + "')\" class=\"cancel\" title='취소'><img src=\"/images/ko/ico/close8.png\" alt='취소' /></a></li>\n"
                }
                searchCancelHtml += "</ul>\n";
                $(".searchCancel").children().remove();
                $(".searchCancel").html(searchCancelHtml);
                $("#FACET_SEARCH_CANCEL").show();
            }
        }
    }
}

/**
 * 이벤트를 등록한다.
 */
function addCommonEventListeners() {
    // form submit 전 이벤트
    $("#searchForm").submit(function() {
    	var searchMehtod = $("#searchMehtod").val();
    	$("#searchBtn").attr('disabled',true);

    	var searchText = $("#searchQuery").val().trim().length;
    	if (searchText == 0 && searchMehtod != "D") {
    		alert("검색어를 입력해 주세요.");
    		$("#searchBtn").attr('disabled',false);
    		return false;
    	}

        var searchType = $("#searchType").val();
        if (searchType == "INNER_SEARCH") {
            if ($(this).attr("action") == "") {
                $(this).attr("action", "/search/searchInnerList.do");
            }

            // 리스트 검색인 경우
            if (searchMehtod == "M" || searchMehtod == "L") {

                /*
            	 * 특수문자 제거
            	 * 처음에 정규식으로 처리 하였으나 연산자 검색시 (ex) 검색어1 ~ 검색어2) 에도 특수문자가 들어갈 수 있기때문에
            	 * 아래와 같이 제외시킬 특수문자만 등록 후 체크하도록 변경함
            	 * chkStr 변수에 제외시킬 특수문자만 추가
            	 * ex) chkStr = "@,!,*"
            	 *
            	 * '@' 특수문자는 결과 내 검색 기능 이용시에 필요하기 때문에 검색어로 입력 못하도록 제외함
            	 */
            	var chkStr = "@";
            	var chkStrArr = chkStr.split(",");
                for (var i = 0; i < chkStrArr.length; i++) {
                	if($("#searchQuery").val().indexOf(chkStrArr[i]) > -1) {
                		$("#searchQuery").val($("#searchQuery").val().replaceAll(chkStrArr[i], ""))
                	}
                }

                searchText = $("#searchQuery").val().trim().length;
                if (searchText == 0 && searchMehtod != "D") {
                	alert("검색어를 입력하세요.");
                	$("#searchBtn").attr('disabled',false);
                	return false;
                }

                var searchQuery = $("#searchQuery").val();
                searchQuery = replacedSearchQueryBySpecialChar(searchQuery);

                // 동의어 검색
                if ($("#synonymYn").val() == "Y") {
                    var sysnonymList = getSynonymList(searchQuery);
                    if (sysnonymList.length > 0) {
                        searchQuery = searchQuery + " | " + sysnonymList.join(" | ");
                    }
                }

                var currZone = $("#zone").val();
                if (currZone.length == 0) {
                    currZone = $("#selZone option:selected").val();
                }
                var op          = "AND";
                var queryText   = searchQuery + ":" + currZone + ":" + op;

                $("#zone").val(currZone);
                if (searchQuery.length > 0 && searchQuery != "*") { // 저자명참조 검색시 searchQuery는 *
                    $("#queryText").val(queryText);
                }
                //기본 검색인 경우 전체 검색, 20211124 KHJ
                $("#dpBranch").val("ALL");
                //console.log("searchQuery=="+searchQuery+", queryText=="+queryText);
                //debugger;
            // FACET 검색인 경우
            } else if (searchMehtod == "F") {
        		 // 검색어가 없고, FACET 검색인 경우 이전 검색어로 검색 처리
            	$("#searchQuery").val(prevSearchQuery);
            	$("#queryText").val($("#prevQueryText").val());
            }
        } else if (searchType == "OUTER_SEARCH") {
            if ($(this).attr("action") == "") {
                $(this).attr("action", "/search/searchOuterList.do");
            }

            var currZone = $("#zone").val();
            if (currZone.length == 0) {
                $("#zone").val($("#selZone option:selected").val());
            }

            // 외부기관 자료구분 div
            if ($(".dataSort").css("display") == "block") {
                if ($("input:checkbox[name=chk_outer_api]:checked").length == 0) {
                    alert("자료구분을 선택하세요.");
                    return false;
                }

                var checkedDbIdListArr = new Array();
                $("input:checkbox[name=chk_outer_api]:checked").each(function() {
                    checkedDbIdListArr.push($(this).val());
                });
                $("#checkedDbIdList").val(checkedDbIdListArr.join(","));
            }
        }
    });

    // 상세검색
    $("#detailSearch").on($.modal.BEFORE_OPEN, function(event, modal) {
        // 라디오 버튼 초기화
        $("input:radio[name=mainDbDivCode]:input[value=ALL]").attr("checked", true);
        // 하위 높이 초기화
        $(".secondDepth").css('top', 0);
        $("#detailSearch .bottom .section.first").css('paddingBottom', 0);
        // 데이터 초기화
        loadCriteriaFields("ALL");
        return false;
    });

    // 내부검색인 경우, 자동완성 //20210107수정
    if ($("#searchType").val() == "INNER_SEARCH") {
        $("#searchQuery").keyup(function(e) {
        	var nKey = parseInt(e.keyCode); //검색어입력필드키이벤트
			if(nKey != 13 && nKey != 37 && nKey != 38 && nKey != 39 && nKey != 40){
				fillAutocomplete(this);
			}
        });
    }

    // 내부검색인 경우, 저자명 자동완성 20210205
    if ($("#searchType").val() == "INNER_SEARCH") {
        $("#authorName").keyup(function(e) {
        	var nKey = parseInt(e.keyCode); //검색어입력필드키이벤트
			if(nKey != 13 && nKey != 37 && nKey != 38 && nKey != 39 && nKey != 40){
				fillAuthorNameAutocomplete(this);
			}
        });
    }

}

//#################################### 검색 관련  ##################################
/**
 * 리스트를 검색한다.
 */
function searchInnerList(searchQuery) {
    // 현재 검색 종류가 외부기관 검색인 경우, ZONE 을 ALL_NI_TOC로 기본 셋팅
    if ($("#searchType").val() == "OUTER_SEARCH") {
        $("#zone").val("ALL_NI_TOC");
        $("#searchClass").val("S");
    }

    $("#searchType").val("INNER_SEARCH");
    $("#resultType").val("INNER_SEARCH_LIST");

    if (searchQuery != null) {
        $("#searchQuery").val(searchQuery);
    }

    // #4. form submit
    var form = $("#searchForm");
    //var formData = $("#searchForm").serialize();
    form.attr("action", "/search/searchInnerList.do");
    form.submit();
}

function searchOuterList() {
    // 현재 검색 종류가 소장자료 검색인 경우, ZONE 을 BI로 기본 셋팅
    if ($("#searchType").val() == "INNER_SEARCH") {
        $("#zone").val("BI");
    }

    $("#searchType").val("OUTER_SEARCH");
    $("#resultType").val("OUTER_SEARCH_LIST");

    var form = $("#searchForm");
    form.attr("action", "/search/searchOuterList.do");
    form.submit();
}

function searchInnerDetail(controlNo, hanjaYn) {
    // 변경 할 사항을 hidden에 저장
    $("#searchType").val("INNER_SEARCH");
    $("#resultType").val("INNER_SEARCH_DETAIL");
    $("#searchMehtod").val("L");
    $("#controlNo").val(controlNo);
    $("#hanjaYn").val(hanjaYn);

    // 유지해야 할 사항을 hidden에 저장
    $("#searchQuery").val(replacedSearchQueryBySpecialChar(prevSearchQuery));
    $("#totalSize").val(totalSize);
    $("#totalSizeByMenu").val(totalSizeByMenu);
    $("#topMainMenuCode").val(topMainMenuCode);
    $("#topSubMenuCode").val(topSubMenuCode);
    $("#isdb").val(isdb);
    $("#isdbsvc").val(isdbsvc);
    $("#tt1").val(tt1);
    $("#down").val(down);
    $("#fieldText").val(fieldText);
    $("#languageCode").val(languageCode);
    //소장도서관 패킷정보 추가, 20211125 KHJ
    $("#dpBranch").val(dpBranch);

    var form = $("#searchForm");
    var formData = $("#searchForm").serialize();
    form.attr("action", "/search/searchInnerDetail.do?"+formData);
    form.submit();
}


/**
 * 팝업닫기후 -> 상세 이동. 20211028 KHJ
 * */
function searchInnerDetailMove(controlNo) {
    // 변경 할 사항을 hidden에 저장
    $("#searchType").val("INNER_SEARCH");
    $("#resultType").val("INNER_SEARCH_DETAIL");
    $("#controlNo").val(controlNo);
    $("#searchQuery").val(controlNo);
    $("#searchMehtod").val("P");
    $("#asideState").val("false");
    $("#hanjaYn").val("Y");

    $("#totalSize").val("1");
    $("#totalSizeByMenu").val("1");

    var form = $("#searchForm");
    var formData = $("#searchForm").serialize();
    form.attr("action", "/search/searchInnerDetail.do?"+formData);
    form.submit();
}


/**
 * 자료구분을 변경한다.
 */
function changeDbDiv(mainMenuCode, subMenuCode) {
    // 변경 사항을 hidden에 저장
    if (mainMenuCode != null) {
        $("#topMainMenuCode").val(mainMenuCode);
    }
    if (subMenuCode != null) {
        $("#topSubMenuCode").val(subMenuCode);
    }

    $("#searchMehtod").val("F");
    $("#searchClass").val(searchClass);
    if (searchClass == "G") {
        var knowPubArr = new Array();
        if (subMenuCode == "10" || subMenuCode == "20" || subMenuCode == "10_HH") {
            $(".thirdDepth > div.inner > ol > #g_" + subMenuCode).parent().children().each(function() {
                if (subMenuCode != $(this).attr("data-api")) {
                    knowPubArr.push($(this).attr("data-api"));
                }
            });

            $("#knowPub").val(knowPubArr.join(","));
        } else {
            $("#knowPub").val(subMenuCode);
        }
    }

    // 유지해야 할 사항을 hidden에 저장
    $("#zone").val(zone);
    $("#fieldText").val(fieldText);
    $("#pageSize").val(pageSize);
    $("#orderBy").val(orderBy);
    $("#hanjaYn").val(hanjaYn);
    //소장도서관 패킷정보 추가, 20211125 KHJ
    $("#dpBranch").val("ALL");

    // 검색
    searchInnerList();
}

function changePageSizeAndOrderBy() {

	$("#searchMehtod").val("F");

    // 변경 사항을 hidden에 저장
    $("#pageSize").val($("#selPageSize option:checked").val());
    $("#orderBy").val($("#selOrderBy option:checked").val());

    // 유지해야 할 사항을 hidden에 저장
    $("#zone").val(zone);
    $("#topMainMenuCode").val(topMainMenuCode);
    $("#topSubMenuCode").val(topSubMenuCode);
    $("#hanjaYn").val(hanjaYn);
    $("#languageCode").val(languageCode);
    $("#isdb").val(isdb);
    $("#isdbsvc").val(isdbsvc);
    $("#tt1").val(tt1);
    $("#down").val(down);
    $("#fieldText").val(fieldText);
    //소장도서관 패킷정보 추가, 20211125 KHJ
    $("#dpBranch").val(dpBranch);
    $("#journalKind").val(journalKind);

    searchInnerList();
}

/**
 * 모바일에서 검색조건 셀렉트박스 선택 시 해당 검색조건으로 조회 한다.
 * ex) 페이지 X건씩 보기, 정렬방식
 * @param obj
 * @param val
 * @returns
 */
function setSearchSelectBox(obj, val) {
	$(obj).val(val).prop("selected", true);
	changePageSizeAndOrderBy();
}

/**
 * 발행연도를 변경한다.
 * 발행연도 검색의 경우, 기존에는 개별 파라미터를 사용했으나 현재는 fieldText로 만들어 사용한다.
 * 따라서 fieldText에 내용이 있는 경우, 발행연도 부분만 추출하여 변경된 발행연도로 교체하는 작업을 해야함.
 */
function changePubYear() {
    // 변경 사항을 hidden에 저장
    var startPubYear = $("#startPubYear").val();
    var endPubYear   = $("#endPubYear").val();

    var pubYear          = startPubYear + "-" + endPubYear;
    var pubYearFieldText = pubYear + ":DP_PUB_YEAR:RANGE";

    if (fieldText.length > 0) {
        var fieldTextArr = fieldText.split("@");
        for (var i = 0; i < fieldTextArr.length; i++) {
            var tempArr = fieldTextArr[i].split(":");
            if (tempArr[1] == "DP_PUB_YEAR") {
                $("#prevPubYearFieldText").val(fieldTextArr[i]);
                break;
            }
        }
    }

    fieldText = fieldText.replace($("#prevPubYearFieldText").val(), "");
    fieldText += pubYearFieldText

    $("#fieldText").val(fieldText);
    $("#searchMehtod").val("F");


    // 유지해야 할 사항을 hidden에 저장
    $("#zone").val(zone);
    $("#topMainMenuCode").val(topMainMenuCode);
    $("#topSubMenuCode").val(topSubMenuCode);
    $("#pageSize").val(pageSize);
    $("#orderBy").val(orderBy);
    $("#hanjaYn").val(hanjaYn);
    $("#languageCode").val(languageCode);
    $("#isdb").val(isdb);
    $("#isdbsvc").val(isdbsvc);
    $("#tt1").val(tt1);
    $("#down").val(down);
    //소장도서관 패킷정보 추가, 20211125 KHJ
    $("#dpBranch").val(dpBranch);
    $("#journalKind").val(journalKind);

    searchInnerList();
}

/**
 * 검색어를 변경한다.
 */
function changeSearchQuery(searchQuery) {
    // 변경 사항을 hidden에 저장
    $("#searchQuery").val(searchQuery);
    $("#searchMehtod").val("L");

    searchInnerList();
}

/**
 * 원문을 변경한다.
 * @returns
 */
function changeOrgDoc(menuType, menuCode) {
    $("#searchMehtod").val("F");
    // 원문있는 자료중에서 하위 메뉴 클릭시, isdb 값을 1로 고정
    if (menuType == "isdbsvc") {
        $("#isdb").val("Y");
        $("#" + menuType).val(menuCode);
    } else {
        $("#" + menuType).val(menuCode);
    }

    // 유지해야 할 사항을 hidden에 저장
    $("#zone").val(zone);
    $("#topMainMenuCode").val(topMainMenuCode);
    $("#topSubMenuCode").val(topSubMenuCode);
    $("#pageSize").val(pageSize);
    $("#orderBy").val(orderBy);
    $("#hanjaYn").val(hanjaYn);
    $("#fieldText").val(fieldText);
    $("#languageCode").val(languageCode);
    //소장도서관 패킷정보 추가, 20211125 KHJ
    $("#dpBranch").val(dpBranch);
    $("#journalKind").val(journalKind);

    searchInnerList();
}

/**
 * 언어를 변경한다.
 */
function changeLanguage(languageCode) {
    $("#languageCode").val(languageCode);
    $("#searchMehtod").val("F");

    // 유지해야 할 사항을 hidden에 저장
    $("#zone").val(zone);
    $("#topMainMenuCode").val(topMainMenuCode);
    $("#topSubMenuCode").val(topSubMenuCode);
    $("#pageSize").val(pageSize);
    $("#orderBy").val(orderBy);
    $("#hanjaYn").val(hanjaYn);
    $("#fieldText").val(fieldText);
    $("#isdb").val(isdb);
    $("#isdbsvc").val(isdbsvc);
    $("#tt1").val(tt1);
    $("#down").val(down);
    //소장도서관 패킷정보 추가, 20211125 KHJ
    $("#dpBranch").val(dpBranch);
    $("#journalKind").val(journalKind);

    searchInnerList();
}


/**
 * 소장도서관 패킷을 변경한다.(분기처리), 20211125 KHJ
 * ULK (국회도서관)
 * BNK (국회부산도서관)
 */
function changeDpBranch(dpBranch) {
    $("#dpBranch").val(dpBranch);
    $("#searchMehtod").val("F");

    // 유지해야 할 사항을 hidden에 저장
    $("#zone").val(zone);
    $("#topMainMenuCode").val(topMainMenuCode);
    $("#topSubMenuCode").val(topSubMenuCode);
    $("#pageSize").val(pageSize);
    $("#orderBy").val(orderBy);
    $("#hanjaYn").val(hanjaYn);
    $("#fieldText").val(fieldText);
    $("#isdb").val(isdb);
    $("#isdbsvc").val(isdbsvc);
    $("#tt1").val(tt1);
    $("#down").val(down);
    $("#journalKind").val(journalKind);

    searchInnerList();
}



/**
 * 학술지종류 추가, 20211224 KHJ
 */
function changeJournalKind(journalKind) {
	$("#journalKind").val(journalKind);
    $("#dpBranch").val(dpBranch);
    $("#searchMehtod").val("F");

    // 유지해야 할 사항을 hidden에 저장
    $("#zone").val(zone);
    $("#topMainMenuCode").val(topMainMenuCode);
    $("#topSubMenuCode").val(topSubMenuCode);
    $("#pageSize").val(pageSize);
    $("#orderBy").val(orderBy);
    $("#hanjaYn").val(hanjaYn);
    $("#fieldText").val(fieldText);
    $("#isdb").val(isdb);
    $("#isdbsvc").val(isdbsvc);
    $("#tt1").val(tt1);
    $("#down").val(down);

    searchInnerList();
}



function getInSession() {
    var asideState = $("#asideState").val();
    $.ajax({
        type:"post",
        url:"/search/getInSession.do",
        data: {"asideState" : asideState},
        dataType:"json",
        success:function(data) {}
    });
}


/**
 * search class를 변경한다. (S : 일반자료구분, G : 공공정책자료)
 */
function changeSearchClass(searchClass) {
    // 변경 사항을 hidden에 저장
    $("#searchClass").val(searchClass);
    $("#searchMehtod").val("L");

    searchInnerList();
}

/**
 * 검색 리스트에서 한자 한글 변환 여부를 변경한다.
 * @param hanjaYn
 * @returns
 */
function changeHanjaYnByList(hanjaYn) {
    $("#searchMehtod").val("F")

    // 변경 사항을 hidden에 저장
    $("#hanjaYn").val(hanjaYn);

    // 유지해야 할 사항을 hidden에 저장
    $("#zone").val(zone);
    $("#topMainMenuCode").val(topMainMenuCode);
    $("#topSubMenuCode").val(topSubMenuCode);
    $("#pageNum").val(pageNum);
    $("#pageSize").val(pageSize);
    $("#orderBy").val(orderBy);

    $("#isdb").val(isdb);
    $("#isdbsvc").val(isdbsvc);
    $("#tt1").val(tt1);
    $("#down").val(down);
    $("#fieldText").val(fieldText);
    $("#languageCode").val(languageCode);
    //소장도서관 패킷정보 추가, 20211125 KHJ
    $("#dpBranch").val(dpBranch);

    searchInnerList();
}

function searchListByCriteria() {
    var formData = $("#criteriaForm").serializeArray();

    var zoneObj        = new Object();
    var searchQueryObj = new Object();
    var opObj          = new Object();
    var limitObj       = new Object();

    //var tempArr = new Array();
    formData.forEach(function(item, index, array) {
        if (item.name.indexOf("zone") > -1) {
            zoneObj[item.name] = item.value;
        } else if (item.name.indexOf("searchQuery") > -1) {
            searchQueryObj[item.name] = item.value;
        } else if (item.name.indexOf("op") > -1) {
            opObj[item.name] = item.value;
        } else {
            if (limitObj[item.name] != undefined) {
                limitObj[item.name] = limitObj[item.name] + "-" + item.value;
            } else {
                limitObj[item.name] = item.value;
            }
        }
    });

    // 키워드 필드를 기준으로 queryText 생성
    var queryTextArr = new Array();
    var searchQueryObjKeys = Object.keys(searchQueryObj);
    for (var i = 0; i < searchQueryObjKeys.length; i++) {
        var searchQueryKey = searchQueryObjKeys[i];
        var searchQuery    = searchQueryObj[searchQueryKey];
        if (searchQuery != "") {
            var index = searchQueryKey.substring(searchQueryKey.length - 1, searchQueryKey.length);

            var zone = zoneObj["zone" + index];
            var op   = opObj["op" + index];
            if (op == null || op == undefined) {
                op = "AND";
            }
            var tempQueryText = searchQuery + ":" + zone + ":" + op;
            queryTextArr.push(tempQueryText);
        }
    }

    if (queryTextArr.length == 0) {
		alert("검색어를 입력해 주세요.");
		return false;
	}

    // 제한필드를 기준으로 fieldText 생성
    var fieldTextArr = new Array();
    var tempText = "";
    var limitObjKeys = Object.keys(limitObj);
    for (var i = 0; i < limitObjKeys.length; i++) {
        var limitObjKey  = limitObjKeys[i];
        var limitText    = limitObj[limitObjKey];

        if (limitObjKey == "mainDbDivCode" || limitObjKey == "subDbDivCode") {
            if (limitObjKey == "mainDbDivCode") {
                $("#topMainMenuCode").val(limitText);
            } else if (limitObjKey == "subDbDivCode") {
                $("#topSubMenuCode").val(limitText);
            }
        } else {
            if (limitText != "" && limitText != "ALL" && limitText != "-" && limitText.indexOf("--") == -1) {
                if (limitObjKey.indexOf("DP_PUB_YEAR") > -1 || limitObjKey.indexOf("ASSEM_DAESU") > -1 || limitObjKey.indexOf("ASSEM_ORDER") > -1) {
                	var arrField =  limitText.split('-');
                    if(arrField[1] != 'ALL' && arrField[2]!='ALL')
                    	fieldTextArr.push(encodeURIComponent(limitText) + ":" + limitObjKey + ":RANGE");

                } else if(limitObjKey.indexOf("TLAW_FIELD") > -1) {
                    var arrField =  limitText.split('-');
                    if(arrField[1] != 'ALL' && arrField[2]!='ALL')
                    {
	                    limitObjKey = arrField[0];
	                    limitText = arrField[1]+"-"+arrField[2];
	                    fieldTextArr.push(encodeURIComponent(limitText) + ":" + limitObjKey + ":RANGE");
                    }
                } else if(limitObjKey.indexOf("P04") > -1 || limitObjKey.indexOf("P05") > -1 || limitObjKey == "NO_FIELD") {
                    if(limitObjKey == "NO_FIELD" || limitObjKey != tempText) {
                        tempText = limitText;
                        continue;
                    }
                    limitObjKey = "TLAW_USC_TITLE";

                    fieldTextArr.push(encodeURIComponent(limitText) + ":" + limitObjKey + ":AND");
                } else if(limitObjKey.indexOf("LAW_COMMITT") > -1) {
                    limitObjKey = "ASSEM_CONFER";
                    fieldTextArr.push(encodeURIComponent(limitText) + ":" + limitObjKey + ":AND");
                } else if(limitObjKey.indexOf("REFD_TYPE") > -1) {
                	var refdArr = limitText.split("-");

                	var refdTable = refdArr[0];
                	var refdImg   = refdArr[1];
                	if (refdTable != undefined && refdImg != undefined) {
                		fieldTextArr.push(encodeURIComponent(refdTable) + ":" + limitObjKey + ":OR");
                		fieldTextArr.push(encodeURIComponent(refdImg) + ":" + limitObjKey + ":AND");
                	} else {
                		if (refdTable != undefined)	{
                			fieldTextArr.push(encodeURIComponent(refdTable) + ":" + limitObjKey + ":AND");
                		} else if (refdImg != undefined) {
                			fieldTextArr.push(encodeURIComponent(refdImg) + ":" + limitObjKey + ":AND");
                		}
                	}
                } else {

                     fieldTextArr.push(encodeURIComponent(limitText) + ":" + limitObjKey + ":AND");
                }
            }
        }
    }

    var queryText = queryTextArr.join("@");
    var fieldText = fieldTextArr.join("@");

    $("#queryText").val(queryText);
    $("#fieldText").val(fieldText);
    $("#searchMehtod").val("D");

    // #4. form submit
    var form = $("#searchForm");
    form.submit();
}

/**
 * 용어관계사전 용어를 검색한다.
 */
function getSynonymList(searchQuery) {
    if (searchQuery == "" ) {
        return false;
    }

    var sysnonymList = new Array();
    $.ajax({
        url        : "/search/searchThesaurusList.do",
        type       : "POST",
        data       : {term : searchQuery},
        dataType   : "json",
        async      :  false,
        success    : function(data) {
            if (data.response == "SUCCESS") {

                for (var i = 0; i < data.synonymList.length; i++) {
                    sysnonymList.push(data.synonymList[i].value);
                }
            }
        }
    });

    return sysnonymList;
}
//#################################### 다국어  ##################################
/**
 * 다국어를 변경한다.
 * @param obj
 * @param code
 * @returns
 */
function changeMultiLang(obj, code) {

    var langArr = marrUniLang[code];

    var langHtml = "";
    for (var i = 0; i < langArr.length; i++) {
        langHtml += "<a href=\"#none\" title=\"" + langArr[i] + "\" onclick=\"addMultiLang('" + langArr[i] + "')\">" + langArr[i] + "</a>\n";
    }

    //console.log(">>>>>> langHtml  = " + langHtml);
    $(obj).parent().children(".content").children(".box").children().remove();
    $(obj).parent().children(".content").children(".box").html(langHtml);
}

/**
 * 검색어에 다국어를 추가한다.
 * @param lang
 * @returns
 */
function addMultiLang(lang) {
    if (G_MULTI_LANG_TYPE == "L") {
        G_MULTI_LANG_FOCUS_ID = "searchQuery";
    } else if (G_MULTI_LANG_TYPE == "D") {
        if (G_MULTI_LANG_FOCUS_ID.length == 0 || G_MULTI_LANG_FOCUS_ID == "searchQuery") {
            alert("검색어 입력란을 선택하세요.");
            return false;
        }
    }

    var currentValue = $("#" + G_MULTI_LANG_FOCUS_ID).val();
    $("#" + G_MULTI_LANG_FOCUS_ID).val(currentValue + lang)

}

/**
 * 포커스된 input의 id를 저장한다.
 * @param focusId
 * @returns
 */
function setFocusIdForMultiLang(focusId) {
    G_MULTI_LANG_FOCUS_ID = focusId;
}

//#################################### 상세검색 레이어 팝업  ##################################
/**
 * 자료 구분별 상세검색 필드를 로드한다.
 */
function loadCriteriaFields(dbDivCode) {
    $.ajax({
        url        : "/search/getDetailSearchFieldList.do",
        type       : "POST",
        data       : {dbDivCode : dbDivCode},
        dataType   : "json",
        success    : function(data) {
            // 키워드 필드
            var keywordHtml = "";
            var keywordFieldList = data.keywordFieldList;
            if (keywordFieldList != null && keywordFieldList.length > 0) {
                for (var i = 0; i < keywordFieldList.length; i++) {

                    keywordHtml += "<div class=\"item\">\n";
                    keywordHtml += "    <div class=\"btn btn1\">\n";
                    keywordHtml += "        <label for=\"zone" + i +  "\"" + "class=\"skip\">검색 영역 선택 </label>\n";
                    keywordHtml += "        <select id=\"zone" + i +  "\"" + "name=\"zone" + i + "\">\n"

                    var codeList = keywordFieldList[i].codeList;
                    for (var j = 0; j < codeList.length; j++) {
                        var selected = "";
                        if (keywordFieldList[i].name == codeList[j].codeName) {
                            selected = "selected=\"selected\"";
                        }
                        keywordHtml += "            <option value=\"" + codeList[j].code + "\" " + selected + ">" + codeList[j].codeName + "</option>\n";
                    }

                    keywordHtml += "        </select>\n";
                    keywordHtml += "    </div>\n";

                    keywordHtml += "    <div class=\"btn\">\n";
                    keywordHtml += "        <label for=\"searchQuery" + i +  "\"" + "class=\"skip\">검색어입력 </label>\n";
                    keywordHtml += "        <input type=\"text\" id=\"searchQuery" + i +  "\"" + " title=\"검색어입력\" name=\"searchQuery" + i + "\" onfocus=\"setFocusIdForMultiLang('searchQuery" + i + "');\" onkeydown=\"if(event.keyCode == 13) searchListByCriteria();\" >\n"
                    keywordHtml += "    </div>\n";
                    if (keywordFieldList.length != i+1) {
                    	keywordHtml += "    <div class=\"btn2\">\n";
                        keywordHtml += "        <label for=\"op" + i +  "\"" + "class=\"skip\">검색 조건 선택 </label>\n";
                        keywordHtml += "        <select id=\"op" + i +  "\"" + "name=\"op" + i + "\">\n"
                        keywordHtml += "            <option value=\"AND\">AND</option>\n";
                        keywordHtml += "            <option value=\"OR\">OR</option>\n";
                        /*keywordHtml += "            <option value=\"AND NOT\">AND NOT</option>\n";*/
                        keywordHtml += "            <option value=\"NOT\">AND NOT</option>\n";
                        keywordHtml += "        </select>\n";
                        keywordHtml += "    </div>\n";
                    }
                    keywordHtml += "</div>\n";
                }
            }

            // 제한 필드
            var limitHtml = "";
            var limitFieldList = data.limitFieldList;
            if (limitFieldList != null && limitFieldList.length > 0) {
                for (var i = 0; i < limitFieldList.length; i++) {
                    var dbDivCode = limitFieldList[i].dbDivCode;
                    var fieldNm   = limitFieldList[i].fieldNm;
                    var fieldType = limitFieldList[i].fieldType;
                    var name      = limitFieldList[i].name;
                    limitHtml += "<li>\n";
                    limitHtml += "    <h3><label for=\"" + fieldNm +  "\">" + name +  "</label></h3>\n";
                    limitHtml += "    <div>\n";
                    // 기간 설정 필드
                    if (fieldType == "PD") {
                        limitHtml += "        <div class=\"btn\">\n";
                        limitHtml += "            <label for=\"" + fieldNm + "_START" +  "\" class=\"skip\">" + name + " 시작일</label>\n";
                        limitHtml += "            <input type=\"text\" title=\"시작일\" id=\"" + fieldNm + "_START" +  "\"" + "name=\"" + fieldNm + "\">\n"
                        limitHtml += "        </div>\n";
                        limitHtml += "        <span class=\"dash\">~</span>\n";
                        limitHtml += "        <div class=\"btn\">\n";
                        limitHtml += "            <label for=\"" + fieldNm + "_END" +  "\" class=\"skip\">" + name + " 종료일</label>\n";
                        limitHtml += "            <input type=\"text\" title=\"종료일\" id=\"" + fieldNm + "_END" +  "\"" + "name=\"" + fieldNm + "\">\n"
                        limitHtml += "        </div>\n";
                    } else if (fieldType == "SS") {
                        limitHtml += "        <div class=\"btn btn1\">\n";
                        limitHtml += "            <select id=\"" + fieldNm +  "\"" + " title=\"제한선택\" name=\"" + fieldNm + "\">\n"
                        var codeList = limitFieldList[i].codeList;
                        if (codeList.length > 0) {
                            for (var j = 0; j < codeList.length; j++) {
                                limitHtml += "                <option value=\"" + codeList[j].code + "\">" + codeList[j].codeName + "</option>\n";
                            }
                        } else {
                            limitHtml += "                <option value=\"ALL\">전체</option>\n";
                        }

                        limitHtml += "          </select>\n";
                    } else if (fieldType == "MS") {
                        limitHtml += "        <div class=\"btn\">\n";

                        if (fieldNm == "ASSEM_DAESU") {
                            limitHtml += "            <select id=\"" + fieldNm + "_START" +  "\"" + " title=\"국회대수\" name=\"" + fieldNm + "\" onchange=\"loadAssemOrderAndCommit('" + dbDivCode + "')\">\n"
                        } else if (fieldNm == "ASSEM_ORDER") {
                            limitHtml += "            <select id=\"" + fieldNm + "_START" +  "\"" + " title=\"회기\" name=\"" + fieldNm + "\" onclick=\"checkAssemDaesu()\">\n"
                        } else {
                            limitHtml += "            <select id=\"" + fieldNm + "_START" +  "\"" + " title=\"회기\" name=\"" + fieldNm + "\">\n"
                        }
                        var codeList = limitFieldList[i].codeList;
                        if (codeList.length > 0) {
                            for (var j = 0; j < codeList.length; j++) {
                                limitHtml += "                <option value=\"" + codeList[j].code + "\">" + codeList[j].codeName + "</option>\n";
                            }
                        } else {
                            limitHtml += "                <option value=\"ALL\">전체</option>\n";
                        }

                        limitHtml += "            </select>\n";
                        limitHtml += "        </div>\n";

                        limitHtml += "        <div class=\"btn\">\n";

                        if (fieldNm == "ASSEM_DAESU") {
                            limitHtml += "            <select id=\"" + fieldNm + "_END" +  "\"" + " title=\"국회대수\" name=\"" + fieldNm + "\" onchange=\"loadAssemOrderAndCommit('" + dbDivCode + "')\">\n";
                        } else if (fieldNm == "ASSEM_ORDER") {
                            limitHtml += "            <select id=\"" + fieldNm + "_END" +  "\"" + " title=\"회기\" name=\"" + fieldNm + "\" onclick=\"checkAssemDaesu()\">\n";
                        } else {
                            limitHtml += "            <select id=\"" + fieldNm + "_END" +  "\"" + " title=\"회기\" name=\"" + fieldNm + "\">\n";
                        }

                        var codeList = limitFieldList[i].codeList;
                        if (codeList.length > 0) {
                            for (var j = 0; j < codeList.length; j++) {
                                limitHtml += "                <option value=\"" + codeList[j].code + "\">" + codeList[j].codeName + "</option>\n";
                            }
                        } else {
                            limitHtml += "                <option value=\"ALL\">전체</option>\n";
                        }
                        limitHtml += "            </select>\n";
                        limitHtml += "        </div>\n";

                    } else if (fieldType == "CHK") {
//                    	<div class="chk">
//                        	<span><input type="checkbox" id="dbTable" name="db"><label for="dbTable">표</label></span>
//                        	<span><input type="checkbox" id="dbPic" name="db"><label for="dbPic">그림</label></span>
//                        </div>


                        var codeList = limitFieldList[i].codeList;
                        if (codeList.length > 0) {
                        	limitHtml += "            <div class=\"chk\">\n"
                            for (var j = 0; j < codeList.length; j++) {
                                limitHtml += "                <span>\n";
                                limitHtml += "                    <input type=\"checkbox\" title=\"선택\" id=\"" + fieldNm + "_" + j + "\" name=\"" + fieldNm + "\" value=\"" +  codeList[j].code + "\">\n";
                                limitHtml += "                    <label for=\"" + fieldNm + "_" + j + "\">" + codeList[j].codeName + "</label>\n";
                                limitHtml += "                </span>\n";
                            }
                        	limitHtml += "        </div>\n";
                        }
                    }

                    limitHtml += "        </div>\n";
                    limitHtml += "    </div>\n";
                    limitHtml += "</li>\n"
                }
            }

            // 키워드 필드 리로드
            $("#keywordField").children().remove();
            $("#keywordField").html(keywordHtml);
            // 제한 필드 리로드
            $("#limitField").children().remove();
            $("#limitField").html(limitHtml);
        }
    });
}

function loadTlawFields(dbDivCode) {
    $.ajax({
        url        : "/search/getDetailSearchFieldList.do",
        type       : "POST",
        data       : {dbDivCode : dbDivCode},
        dataType   : "json",
        success    : function(data) {
            // 키워드 필드
            var keywordHtml = "";
            var keywordFieldList = data.keywordFieldList;
            if (keywordFieldList != null && keywordFieldList.length > 0) {
                for (var i = 0; i < keywordFieldList.length; i++) {

                    keywordHtml += "<div class=\"item\">\n";
                    keywordHtml += "    <div class=\"btn btn1\">\n";
                    keywordHtml += "        <label for=\"zone" + i +  "\"" + "class=\"skip\">검색 영역 선택 </label>\n";
                    keywordHtml += "        <select id=\"zone" + i +  "\"" + "name=\"zone" + i + "\">\n"

                    var codeList = keywordFieldList[i].codeList;
                    for (var j = 0; j < codeList.length; j++) {
                        var selected = "";
                        if (keywordFieldList[i].name == codeList[j].codeName) {
                            selected = "selected=\"selected\"";
                        }
                        keywordHtml += "            <option value=\"" + codeList[j].code + "\" " + selected + ">" + codeList[j].codeName + "</option>\n";
                    }

                    keywordHtml += "        </select>\n";
                    keywordHtml += "    </div>\n";

                    keywordHtml += "    <div class=\"btn\">\n";
                    keywordHtml += "        <label for=\"searchQuery" + i +  "\"" + "class=\"skip\">검색어입력 </label>\n";
                    keywordHtml += "        <input type=\"text\" title=\"검색어입력\" id=\"searchQuery" + i +  "\"" + "name=\"searchQuery" + i + "\" onfocus=\"setFocusIdForMultiLang('searchQuery" + i + "');\" onkeydown=\"if(event.keyCode == 13) searchListByCriteria();\" >\n"
                    keywordHtml += "    </div>\n";

                    keywordHtml += "    <div class=\"btn2\">\n";
                    keywordHtml += "        <label for=\"op" + i +  "\"" + "class=\"skip\">검색 조건 선택 </label>\n";
                    keywordHtml += "        <select id=\"op" + i +  "\"" + "name=\"op" + i + "\">\n"
                    keywordHtml += "            <option value=\"AND\">AND</option>\n";
                    keywordHtml += "            <option value=\"OR\">OR</option>\n";
                    /*keywordHtml += "            <option value=\"AND NOT\">AND NOT</option>\n";*/
                    keywordHtml += "            <option value=\"NOT\">AND NOT</option>\n";
                    keywordHtml += "        </select>\n";
                    keywordHtml += "    </div>\n";
                    keywordHtml += "</div>\n";
                }
            }

            // 제한 필드
            var limitHtml = "";
            var limitFieldList = data.limitFieldList;
            if (limitFieldList != null && limitFieldList.length > 0) {
                for (var i = 0; i < limitFieldList.length; i++) {
                    var dbDivCode = limitFieldList[i].dbDivCode;
                    var fieldNm   = limitFieldList[i].fieldNm;
                    var fieldType = limitFieldList[i].fieldType;
                    var name      = limitFieldList[i].name;

                    if(i == 0){

                        limitHtml += "<div class=\"item\">\n";
                        limitHtml += "    <div class=\"btn btn1\">\n";
                        limitHtml += "        <select id=\"" + fieldNm +  "\"" + "name=\"" + fieldNm + "\">\n"
                        var codeList = limitFieldList[i].codeList;
                        if (codeList.length > 0) {
                            limitHtml += "        <option value=\"ALL\">법령관련일</option>\n";
                            for (var j = 0; j < codeList.length; j++) {
                                limitHtml += "    <option value=\"" + codeList[j].code + "\">" + codeList[j].codeName + "</option>\n";
                            }
                        }
                        limitHtml += "        </select>\n";
                        limitHtml += "    </div>\n";

                        limitHtml += "    <div class=\"btn btn1\">\n";
                        limitHtml += "        <label for=\"" + fieldNm + "_START" +  "\" class=\"skip\">" + name + "</label>\n";
                        limitHtml += "        <input type=\"text\" title=\"시작일\" id=\"" + fieldNm + "_START" +  "\"" + "name=\"" + fieldNm + "\">\n"
                        limitHtml += "    </div>\n";
                        limitHtml += "    <div class=\"btn btn1\">\n";
                        limitHtml += "        <label for=\"" + fieldNm + "_END" +  "\" class=\"skip\">" + name + "</label>\n";
                        limitHtml += "        <input type=\"text\" title=\"종료일\" id=\"" + fieldNm + "_END" +  "\"" + "name=\"" + fieldNm + "\">\n"
                        limitHtml += "    </div>\n";

                        limitHtml += "</div>\n";
                        limitHtml += "<div class=\"item\">\n";
                    } else if (0 < i && i < 6) {
                        limitHtml += "    <div class=\"btn btn11\">\n";
                        limitHtml += "        <select id=\"" + fieldNm +  "\"" + " title=\"United States Code\" name=\"" + fieldNm + "\" >\n"
                        var codeList = limitFieldList[i].codeList;
                        if (codeList.length > 0) {
                            limitHtml += "        <option value=\"\">"+name+"</option>\n";
                            for (var j = 1; j < codeList.length; j++) {
                                limitHtml += "    <option value=\"" + codeList[j].codeName + "\">" + codeList[j].codeName + "</option>\n";
                            }
                        }
                        if("NO_FIELD" == fieldNm){
                            limitHtml += "        <option value=\"\">"+name+"</option>\n";
                            limitHtml += "        <option value=\"P04\">United States Code</option>\n";
                            limitHtml += "        <option value=\"P05\">Code of Federal Regulations</option>\n";
                        }

                        limitHtml += "        </select>\n";
                        limitHtml += "    </div>\n";
                    } else {
                        if(i == 6){
                            limitHtml += "</div>\n";
                        }
                        limitHtml += "<li id=\"united"+i+"\" style=\"display:none\">\n";
                        limitHtml += "    <h3><label for=\"" + fieldNm +  "\">" + name +  "</label></h3>\n";
                        limitHtml += "    <div>\n";
                        limitHtml += "        <div class=\"btn btn3\">\n";
                        limitHtml += "            <select id=\"" + fieldNm +  "\"" + "name=\"" + fieldNm + "\" >\n"
                        var codeList = limitFieldList[i].codeList;
                        if (codeList.length > 0) {
                            for (var j = 0; j < codeList.length; j++) {
                                limitHtml += "                <option value=\"" + codeList[j].codeName + "\">" + codeList[j].codeName + "</option>\n";
                            }
                        } else {
                            limitHtml += "                <option value=\"ALL\">전체</option>\n";
                        }

                        limitHtml += "          </select>\n";
                        limitHtml += "        </div>\n";
                        limitHtml += "    </div>\n";
                        limitHtml += "</li>\n"
                    }
                }
            }

            // 키워드 필드 리로드
            $("#keywordField").children().remove();
            $("#keywordField").html(keywordHtml);
            // 제한 필드 리로드
            $("#limitField").children().remove();
            $("#limitField").html(limitHtml);


        }
    });

    $(document).on('change','#NO_FIELD', function() {
        var val = $('#NO_FIELD option:checked').val();
        if("P04" == val) {
            $('#united6').show();
            $('#united7').hide();
        } else if("P05" == val){
            $('#united6').hide();
            $('#united7').show();
        } else {
            $('#united6').hide();
            $('#united7').hide();
        }
    });
}



/**
 * 국회회의록 회수와 위원회 정보를 얻는다.
 * @param divId
 * @returns
 */
function loadAssemOrderAndCommit(dbDivCode) {
    var startDaesu = $("#ASSEM_DAESU_START option:selected").val();
    var endDaesu   = $("#ASSEM_DAESU_END option:selected").val();
    var confer     = $("#ASSEM_CONFER option:selected").val();

    console.log(">>>>>> loadAssemOrderAndCommit startDaesu = " + startDaesu + ", endDaesu =" + endDaesu + ", confer = " + confer);

    // 회수 옵션 삭제
    $("#ASSEM_ORDER_START").find("option").remove().end().append("<option value=\"ALL\">전체</option>");
    $("#ASSEM_ORDER_END").find("option").remove().end().append("<option value=\"ALL\">전체</option>");

    if (dbDivCode == "PROC") {
        // 위원회 옵션 삭제
        $("#ASSEM_COMMIT").find("option").remove().end().append("<option value=\"ALL\">전체</option>");
    }

    if (startDaesu == "ALL" && endDaesu == "ALL") {
        return false;
    }

    if (startDaesu == "ALL") {
        startDaesu = "";
    }

    if (endDaesu == "ALL") {
        endDaesu = "";
    }

    $.ajax({
        url        : "/search/getAssemOrderAndCommitList.do",
        type       : "POST",
        data       : {
            startDaesu : startDaesu,
            endDaesu   : endDaesu,
            confer     : confer
        },
        dataType   : "json",
        success    : function(data) {
            if (data != null) {
                var assemOrderList  = data.assemOrderList;
                for (var i = 0; i < assemOrderList.length; i++) {
                    var code     = assemOrderList[i].CODE;
                    var codeName = assemOrderList[i].CODE_NAME;
                    $("#ASSEM_ORDER_START").append("<option value=\"" + code + "\">" +  codeName + "</option>");
                    $("#ASSEM_ORDER_END").append("<option value=\"" + code + "\">" +  codeName + "</option>");
                }

                if (dbDivCode == "PROC") {
                    var assemCommitList = data.assemCommitList;
                    for (var i = 0; i < assemCommitList.length; i++) {
                        var code     = assemCommitList[i].CODE;
                        var codeName = assemCommitList[i].CODE_NAME;
                        $("#ASSEM_COMMIT").append("<option value=\"" + code + "\">" +  codeName + "</option>");
                    }
                }
            }
        }
    });
}

function checkAssemDaesu(dbDivCode) {
    var startDaesu = $("#ASSEM_DAESU_START option:selected").val();
    var endDaesu   = $("#ASSEM_DAESU_END option:selected").val();

    if (startDaesu == "ALL" && endDaesu == "ALL") {
        alert("대수를 선택하세요.");
        return false;
    }
}

function resetForm() {
    var mainDbDivCode = $("input:radio[name=mainDbDivCode]:checked").val();
    var subDbDivCode  = $("input:radio[name=subDbDivCode]:checked").val();

    $("#criteriaForm")[0].reset();

    $("input:radio[name=mainDbDivCode]:input[value=" + mainDbDivCode + "]").attr("checked", true);
    $("input:radio[name=subDbDivCode]:input[value=" + subDbDivCode + "]").attr("checked", true);
}

//#################################### 기타 관련  ##################################
/**
 * 프로그램 다운로드 팝업을 연다.
 * @returns
 */
function viewDownloadProgram() {
//    var winPlatform = "Windows XP";
//    if (winPlatform == "Windows XP" || winPlatform == "Windows Vista") {
//        $("#downloadViewer").attr("href", "https://viewer.nanet.go.kr/assets/nanet/nalsvc/StreamdocsAgentSetup_portable_xp.exe")
//    } else {
        //$("#downloadViewer").attr("href", "https://viewer.nanet.go.kr/assets/nanet/nalsvc/StreamdocsAgentSetup_portable.exe")
		$("#downloadViewer").attr("href", "https://docviewer.nanet.go.kr/dist/NADLPlugin-setup.exe")
//    }

    $("#donwloadProgram").modal();
}

function getWinPlatform() {

    var appVersion = navigator.appVersion;
    var winPlatform;
    if (navigator.platform==='Win32') {
      if( appVersion.indexOf('98')!== -1) {
          winPlatform = 'Windows 98' ;
      } else if( appVersion.indexOf('95') !== -1 ) {
          winPlatform = 'Windows 95' ;
      } else if( appVersion.indexOf('Me') !== -1) {
          winPlatform = 'Windows Me' ;
      } else if( appVersion.indexOf('NT 5.0') !== -1) {
          winPlatform = 'Windows 2000' ;
      } else if( appVersion.indexOf('NT 5.1') !== -1) {
          winPlatform = 'Windows XP' ;
      } else if( appVersion.indexOf('NT 5.2') !== -1) {
          winPlatform = 'Windows 2003' ;
      } else if( appVersion.indexOf('NT 6.0') !== -1) {
          winPlatform = 'Windows Vista' ;
      } else if( appVersion.indexOf('NT 6.1') !== -1) {
          winPlatform = 'Windows 2008' ;
      } else if( appVersion.indexOf('NT')!== -1 ) {
          winPlatform = 'Windows NT' ;
      }
    } else {
        winPlatform = navigator.platform;
    }

    return winPlatform;
}

//검색결과 취소, 추가. 20211224 KHJ
function cancelLeftFacet(menuType) {
    console.log(">>>>> cancelLeftFacet + " + menuType);

    if (menuType == "isdb") {
        isdb    = "";
        isdbsvc = "";
    } else if (menuType == "tt1") {
        tt1 = "";
    } else if (menuType == "down") {
        down = "";
    } else if (menuType == "pubYear") {
        if (fieldText.length > 0) {
            var currPubYearFieldText = "";
            var fieldTextArr = fieldText.split("@");
            for (var i = 0; i < fieldTextArr.length; i++) {
                var tempArr = fieldTextArr[i].split(":");
                if (tempArr[1] == "DP_PUB_YEAR") {
                    currPubYearFieldText = fieldTextArr[i];
                    break;
                }
            }

            if (currPubYearFieldText.length > 0) {
                fieldText = fieldText.replace(currPubYearFieldText, "");
                if (prevPubYearFieldText.length > 0) {
                    fieldText += prevPubYearFieldText;
                }
            }
        }
    } else if (menuType == "language") {
        languageCode = "";
    }
    else if (menuType == "dpBrahch") {
    	dpBranch = "";
    }
    else if (menuType == "journalKind") {
    	journalKind = "";
    }

    $("#searchMehtod").val("F");

    // 유지해야 할 사항을 hidden에 저장
    $("#zone").val(zone);
    $("#topMainMenuCode").val(topMainMenuCode);
    $("#topSubMenuCode").val(topSubMenuCode);
    $("#pageSize").val(pageSize);
    $("#orderBy").val(orderBy);
    $("#hanjaYn").val(hanjaYn);
    $("#isdb").val(isdb);
    $("#isdbsvc").val(isdbsvc);
    $("#tt1").val(tt1);
    $("#down").val(down);
    $("#fieldText").val(fieldText);
    $("#languageCode").val(languageCode);
    //소장도서관 패킷정보 추가, 20211125 KHJ
    $("#dpBranch").val(dpBranch);
    $("#journalKind").val(journalKind);

    searchInnerList();
}

/**
 * 오늘하루열지 않기 쿠기 셋팅
 * @param name
 * @param value
 * @param expireDay
 * @returns
 */
function setDoNotOpenTodayCookie(name, value, expireDay) {
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expireDay);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
}

function replacedSearchQueryBySpecialChar(searchQuery) {
	if (searchQuery.length == 0) {
		return "";
	}

	 //searchQuery = searchQuery.replaceAll(":", "");
     searchQuery = searchQuery.replaceAll("&#034;", "\"");
     searchQuery = searchQuery.replaceAll("&#039;", "\'");
     searchQuery = searchQuery.replaceAll("&amp;", "&");

     return searchQuery;
}

function onSelectChange(){
	if('${isMobile}'){
		changePageSizeAndOrderBy();
	}
}


/**
 * 20211103 KHJ
 * 외부링크 로고관리, a링크 외부호출인경우 처리
 * -> a링크에서 외부로 나가는경우 이 함수를 적용.
 *    함수에 넘어올 연계기관 코드를 입력해줘야함
 *    ($(this), 제어번호, 연계기관, url)
 * */
function logoOutLink(_this, controlNo, linkUrlDbdiv, url){

	var linkUrl = '';
	if(_this){
		linkUrl = _this.attr("href");
	} else {
		linkUrl = url;
	}

	$.ajax({
        type:"post",
        url:"/search/selectLogoOutLink.do",
        data: {"linkUrl" : linkUrl, "controlNo": controlNo, "linkUrlDbdiv":linkUrlDbdiv},
        dataType:"json",
        success:function(data) {
        },
        error : function(data) {
            alert("error");
        }
    });
}
