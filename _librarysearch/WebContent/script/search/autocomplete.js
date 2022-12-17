/**
 * 자동완성 스크립트 정의
 * @author srlee
 * @returns
 */
function fillAutocomplete(obj) {
	var searchQuery = $(obj).val();
    if (searchQuery.length < 2) {
        $(".autoComplete").children().remove();
        $(".autoComplete").hide();
       // $("#searchBtn").attr("disabled",true);
        return false;
    }

    $("#searchBtn").attr("disabled",false);

    var currZone  = $("#selZone option:selected").val();
    var indexType = "";

    //alert(currZone);

    var indexType = "";
    if (currZone.startsWith("TITLE")) {
    	indexType = "TITLE";
    }
    else if (currZone.startsWith("AUTHOR")) {
    	indexType = "AUTHOR";
    }
    else if (currZone.startsWith("PUB")) {
    	indexType = "PUB";
    }
    else {
    	indexType = "";
    }
    var queryText = encodeURIComponent(searchQuery) + ":ALL_NI_TOC:AND";

    if (searchQuery.length > 20) {
    	return false;
    }

    $.ajax({
        url        : "/search/autocomplete.do",
        type       : "post",
        data       : {searchQuery : searchQuery, queryText : queryText, indexType : indexType},
        dataType   : "json",
        success    : function(data) {
			g_ac_pos = -1;
			g_ac_data_count = data.length;
            if (data != null && data.length > 0) {
                var autocompleteHtml = "<ul>\n";
                for (var i = 0; i < data.length; i++) {

                	var dpTitleFull = data[i].dpTitleFull;
                	// 하이라이팅 제거
                	escapeDpTitleFull = dpTitleFull.replace("<font color='red'>", "").replace("</font>", "").replaceAll("\'", "").replaceAll("\"", "");
                	//autocompleteHtml += "<li><a href=\"#none\" title=\"  \" onclick=\"searchInnerList('" + escapeDpTitleFull +"')\">" + data[i].dpTitleFull + "</a></li>\n";
                	autocompleteHtml += "<li><a href=\"#none\" title=\"  \" onclick=\"searchInnerList('" + escapeDpTitleFull +"')\">" + data[i].dpTitleFull.replace(searchQuery, "<font color='red'>" + searchQuery + "</font>", 1) + "</a></li>\n";

                }
                autocompleteHtml += "</ul>\n";
                autocompleteHtml += "<div class=\"close tr\">\n";
                autocompleteHtml += "    <a href=\"#none\" title=\"닫기\" onclick=\"closeAutocomplete();\" onfocusout=\"closeAutocomplete();\">닫기</a>\n";
                autocompleteHtml += "</div>\n";
                $(".autoComplete").children().remove();
                $(".autoComplete").html(autocompleteHtml);
                $(".autoComplete").show();
            } else {
            	$(".autoComplete").children().remove();
            	$(".autoComplete").hide();
            }
        }
    });
}

function closeAutocomplete() {
    $(".autoComplete").hide();
}

function focusoutAutocomplete() {
	$(".autoComplete").hide();
}

/* 서치 Key 이벤트 처리 */
//검색 리스트 카운트
var g_ac_pos = -1;
//검색 리스트 개수
var g_ac_data_count = 10;
function moveAutoCompleteItem(pos)
{
	if(pos < 0)
	{
		if(g_ac_pos <= 0) return;

		g_ac_pos += pos;

		$(".autoComplete>ul>li").eq(g_ac_pos+1).css("background", "#ffffff");
		$(".autoComplete>ul>li").eq(g_ac_pos).css("background", "#f4f4f4");

		$(".autoComplete>ul>li").eq(g_ac_pos).find("a").focus();

		$('#searchQuery').val($(".autoComplete>ul>li").eq(g_ac_pos).text());
		$('#searchQuery').focus();
	}
	else if(pos > 0)
	{

		if(g_ac_pos >= (g_ac_data_count-1)) return;

		g_ac_pos += pos;

		$(".autoComplete>ul>li").eq(g_ac_pos-1).css("background", "#ffffff");
		$(".autoComplete>ul>li").eq(g_ac_pos).css("background", "#f4f4f4");

		$(".autoComplete>ul>li").eq(g_ac_pos).find("a").focus();

		$('#searchQuery').val($(".autoComplete>ul>li").eq(g_ac_pos).text());
		$('#searchQuery').focus();
	}
}

$(document).ready(function(){
	//메인화면 검색어 키입력 //20210107수정
	$('#searchQuery').keydown(function (e) {
		numKeyCode = parseInt(e.keyCode); //검색어입력필드키이벤트
	//	$(numKeyCode).appendTo("#test");
		switch (numKeyCode){ //키이벤트
		case 13: //Enter
		case 16: //Shift
		case 17: //Ctrl
		case 18: //Alt
		case 19: //Pause/Break
		case 45: //Insert
		case 36: //Home
		case 33: //PageUp
		case 34: //PageDown
		case 35: //End
		case 144: //NumLock
		case 20: //Caps Lock
		case 25: //한자
		case 93: //
		case 145: //Scroll Lock
		case 12: //5
			break;
		case 27: //ESC
			$('.autoComplete').css("display","none");
			break;
		case 37: //←
		case 38: //↑
			setTimeout("moveAutoCompleteItem(-1)", 10);
			break;
		case 39: //→
		case 9: //Tab
			break;
		case 40: //↓
			setTimeout("moveAutoCompleteItem(1)", 10);
			break;
		default: //etc
			if(numKeyCode > 111 & numKeyCode < 124 )
			{
				break;
			}
			/*if(g_ac_active)
			{
				// 자동완성 ajax 호출
				setTimeout("callAutoCompleteData(\"new\", \"widesrchElem\")", 10);
			}*/
			break;
		}
	});

});
/* 서치 Key 이벤트 처리 */




/**
 * 저자명 자동완성 스크립트 정의
 * @author srlee
 * @returns
 */
function fillAuthorNameAutocomplete(obj) {
	var searchAuthor = $(obj).val();
    if (searchAuthor.length < 2) {
        $(".authorNameAutocomplete").children().remove();
        $(".authorNameAutocomplete").hide();
       // $("#searchBtn").attr("disabled",true);
        return false;
    }

    if (searchAuthor.length > 20) {
    	return false;
    }

    var indexType = "AUTHOR";
    var queryText = encodeURIComponent(searchAuthor) + ":ALL_NI_TOC:AND";

    $.ajax({
        url        : "/search/autocomplete.do",
        type       : "post",
        data       : {searchQuery : searchAuthor, queryText : queryText, indexType : indexType},
        dataType   : "json",
        success    : function(data) {
			g_ac_pos = -1;
			g_ac_data_count = data.length;
            if (data != null && data.length > 0) {
                var autocompleteHtml = "<ul>\n";
                for (var i = 0; i < data.length; i++) {

                	var dpTitleFull = data[i].dpTitleFull;
                	// 하이라이팅 제거
                	escapeDpTitleFull = dpTitleFull.replace("<font color='red'>", "").replace("</font>", "").replaceAll("\'", "").replaceAll("\"", "");
                	//autocompleteHtml += "<li><a href=\"#none\" title=\"  \" onclick=\"searchInnerList('" + escapeDpTitleFull +"')\">" + data[i].dpTitleFull + "</a></li>\n";
                	autocompleteHtml += "<li><a href=\"#none\" title=\"  \" onclick=\"searchAuthorNameAutocomplete('" + escapeDpTitleFull +"')\">" + data[i].dpTitleFull.replace(searchAuthor, "<font color='red'>" + searchAuthor + "</font>", 1) + "</a></li>\n";

                }
                autocompleteHtml += "</ul>\n";
                autocompleteHtml += "<div class=\"close tr\">\n";
                autocompleteHtml += "    <a href=\"#none\" title=\"닫기\" onclick=\"closeAuthorNameAutocomplete();\" onfocusout=\"closeAuthorNameAutocomplete();\">닫기</a>\n";
                autocompleteHtml += "</div>\n";
                $(".authorNameAutocomplete").children().remove();
                $(".authorNameAutocomplete").html(autocompleteHtml);
                $(".authorNameAutocomplete").show();
            } else {
            	$(".authorNameAutocomplete").children().remove();
            	$(".authorNameAutocomplete").hide();
            }
        }
    });

}


function searchAuthorNameAutocomplete(authorName){
	$("#authorName").val(authorName);
	insertSearchPopupLog('NADL', 'A');
}

function closeAuthorNameAutocomplete() {
    $(".authorNameAutocomplete").hide();
}

function focusoutAuthorNameAutocomplete() {
	$(".authorNameAutocomplete").hide();
}

/* 서치 Key 이벤트 처리 */
//검색 리스트 카운트
var g_ac_pos = -1;
//검색 리스트 개수
var g_ac_data_count = 10;
function moveAuthorNameAutocompleteItem(pos)
{
	if(pos < 0)
	{
		if(g_ac_pos <= 0) return;

		g_ac_pos += pos;

		$(".authorNameAutocomplete>ul>li").eq(g_ac_pos+1).css("background", "#ffffff");
		$(".authorNameAutocomplete>ul>li").eq(g_ac_pos).css("background", "#f4f4f4");

		$(".authorNameAutocomplete>ul>li").eq(g_ac_pos).find("a").focus();

		$('#authorName').val($(".authorNameAutocomplete>ul>li").eq(g_ac_pos).text());
		$('#authorName').focus();
	}
	else if(pos > 0)
	{

		if(g_ac_pos >= (g_ac_data_count-1)) return;

		g_ac_pos += pos;

		$(".authorNameAutocomplete>ul>li").eq(g_ac_pos-1).css("background", "#ffffff");
		$(".authorNameAutocomplete>ul>li").eq(g_ac_pos).css("background", "#f4f4f4");

		$(".authorNameAutocomplete>ul>li").eq(g_ac_pos).find("a").focus();

		$('#authorName').val($(".authorNameAutocomplete>ul>li").eq(g_ac_pos).text());
		$('#authorName').focus();
	}
}

$(document).ready(function(){
	//메인화면 검색어 키입력 //20210107수정
	$('#authorName').keydown(function (e) {
		numKeyCode = parseInt(e.keyCode); //검색어입력필드키이벤트
	//	$(numKeyCode).appendTo("#test");
		switch (numKeyCode){ //키이벤트
		case 13: //Enter
		case 16: //Shift
		case 17: //Ctrl
		case 18: //Alt
		case 19: //Pause/Break
		case 45: //Insert
		case 36: //Home
		case 33: //PageUp
		case 34: //PageDown
		case 35: //End
		case 144: //NumLock
		case 20: //Caps Lock
		case 25: //한자
		case 93: //
		case 145: //Scroll Lock
		case 12: //5
			break;
		case 27: //ESC
			$('.authorNameAutocomplete').css("display","none");
			break;
		case 37: //←
		case 38: //↑
			setTimeout("moveAuthorNameAutocompleteItem(-1)", 10);
			break;
		case 39: //→
		case 9: //Tab
			break;
		case 40: //↓
			setTimeout("moveAuthorNameAutocompleteItem(1)", 10);
			break;
		default: //etc
			if(numKeyCode > 111 & numKeyCode < 124 )
			{
				break;
			}
			/*if(g_ac_active)
			{
				// 자동완성 ajax 호출
				setTimeout("callAutoCompleteData(\"new\", \"widesrchElem\")", 10);
			}*/
			break;
		}
	});

});
/* 서치 Key 이벤트 처리 */

