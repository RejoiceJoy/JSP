/**
 * 국회소장자료 검색리스트에서만 사용하는 스크립트 정의
 * @author srlee
 * @returns
 */

$(document).ready(function() {
	showBestMeterailService();
	var infographicDrMode = $('#infographicDrMode').val();
	if("true" != infographicDrMode){
		loadInfoServiceCount();
	}
//	loadInfoServiceCount();
});

//#################################### 초록, 목차, 해제  ##################################
/**
 * 파일 컨텐츠 정보 (초록, 목차, 해제)
 * @param controlNo
 * @param fileType
 * @returns
 */
function showFileContents(obj, controlNo, filePath, fileType) {
	// 현재 목차, 초록, 해제 보기가 열려있는 상태면 호출 안함
	if ($(obj).hasClass("on")) {
		return false;
	}

	$.ajax({
        url        : "/search/getFileContents.do",
        type       : "POST",
        data       : {filePath : filePath},
        dataType   : "json",
        success    : function(data) {
        	$("#" + fileType + "_" + controlNo + " > .box").html(data);
        }
    });
}

function showFileContentsPop(mypage, myname, w, h, scroll) {
	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    settings ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',status=yes,resizable';
    win = window.open(mypage, myname, settings);
}

//#################################### 안건보기  ##################################
/**
 * 회의록 안건보기
 * @param controlNo
 * @param content
 * @returns
 */
function showProcContents(obj, controlNo, content, fileType) {
	// 열려있는 상태면 호출 안함
	if ($(obj).hasClass("on")) {
		return false;
	}

	$("#" + fileType + "_" + controlNo + " > .box").html(content);

}

//#################################### 권호  ##################################

function volumeBeanGroupJSON(controlNo, annexType) {
	$.ajax({
		url        : "/search/volumeBeanGroupJSON.do",
        type       : "POST",
        data       : {controlNo : controlNo, annexType : annexType},
        dataType   : "json",
        success    : function(data) {
        	var volumeDataHtml = "";
    		var volumeData = data.volumeBeanGroup;
    		
    		for (var i = 0; i < volumeData.length; i++) {
    			volumeDataHtml += "<option value="+volumeData[i].PUB_YEAR+">" + volumeData[i].PUB_YEAR + "</option>"; 
    		}
    		
    		$("#listNo_"+controlNo).children().remove();
    		$("#listNo_"+controlNo).html(volumeDataHtml);
    		
    		var selectAnnexType = data.selectAnnexType;
    		$("#annexSelect").val(selectAnnexType);
        },
        complete    : function(data) {
        	// viewVolume(controlNo);
        }
	});
}

/**
 * 권호
 * @param controlNo
 * @returns
 */
function showVolume(controlNo) {
	var annexType = $("#annexSelect").val();
	var pubYear = $("#listNo_"+controlNo).val();
	pubYear = pubYear == 0 ? "" : pubYear;

	$.ajax({
        url        : "/search/viewVolume.do",
        type       : "POST",
        data       : {controlNo : controlNo, pubYear : pubYear, annexType : annexType},
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {
        		var volumeHtml = "";
        		volumeHtml = "<div class=\"tWrap\">\n";

        		selectAnnexType = data.selectAnnexType;
        		
        		volumeHtml += "<select id=\"annexSelect\" name=\"annexSelect\" class=\"select2\" title=\"분관선택\" onchange=\"javascript:volumeBeanGroupJSON('" + controlNo + "', this.value);\" style=\"margin: 5px;\">\n";
        		volumeHtml += "<option value=\"ULK\">서울 본관</option>\n";
        		volumeHtml += "<option value=\"BNK\">부산관</option>\n";
        		volumeHtml += "</select>\n";
        		
        		var group = data.volumeBeanGroup;
        		volumeHtml += "<select id=\"listNo_" + controlNo + "\" title=\"발행년 선택\" name=\"listNo\" class=\"select2\">\n";
        		for (var i = 0; i < group.length; i++) {
        			if (i==0 && pubYear == "") {
        				volumeHtml += "<option selected=selected value=" + group[i].PUB_YEAR + ">" + group[i].PUB_YEAR + "</option>\n";
        			}
        			else {
        				if (pubYear == group[i].PUB_YEAR) {
            				volumeHtml += "<option selected=selected value=" + group[i].PUB_YEAR + ">" + group[i].PUB_YEAR + "</option>\n";
            			}
            			else {
            				volumeHtml += "<option value=" + group[i].PUB_YEAR + ">" + group[i].PUB_YEAR + "</option>\n";
            			}
        			}

        		}
        		volumeHtml += "</select>\n";
        		volumeHtml += "<span class=\"recommend\"><a href=\"javascript:showVolume('" + controlNo + "');\" title=\"조회\">조회</a></span>\n";
        		volumeHtml += "<br>(1990년 이전 발행 자료는 소장사항을 참조하십시오.)";

        		volumeHtml    += "    <table class=\"table tStyle3\" style=\"margin-top: 3px;\">\n";
        		volumeHtml    += "        <caption class=\"skip\">권호기사 목록 테이블로 기사명, 저자명, 페이지, 원문, 기사목차 순으로 되어있습니다.</caption>\n";
        		/*volumeHtml    += "        <colgroup>\n";
        		volumeHtml    += "            <col width=\"12%\">\n";
        		volumeHtml    += "            <col width=\"27%\">\n";
        		volumeHtml    += "            <col width=\"12%\">\n";
        		volumeHtml    += "            <col width=\"10%\">\n";
        		volumeHtml    += "            <col width=\"14%\">\n";
        		volumeHtml    += "            <col width=\"12%\">\n";
        		volumeHtml    += "            <col width=\"10%\">\n";
        		volumeHtml    += "        </colgroup>\n";*/
        		volumeHtml    += "        <thead>\n";
        		volumeHtml    += "            <tr>\n";
        		volumeHtml    += "                <th scope=\"col\">발행일자</th>\n";
        		volumeHtml    += "                <th scope=\"col\">권호명</th>\n";
        		volumeHtml    += "                <th scope=\"col\" data-breakpoints=\"xs sm\">열람제한</th>\n";
        		volumeHtml    += "                <th scope=\"col\" data-breakpoints=\"xs\">자료실</th>\n";
        		volumeHtml    += "                <th scope=\"col\">기사보기</th>\n";
        		volumeHtml    += "                <th scope=\"col\" data-breakpoints=\"xs sm md\">원문</th>\n";
        		volumeHtml    += "                <th scope=\"col\" data-breakpoints=\"xs sm md\">권호목차</th>\n";
        		volumeHtml    += "            </tr>\n";
        		volumeHtml    += "        </thead>\n";
        		volumeHtml    += "        <tbody>\n";

        		var data = data.volumeBeanList;
        		for (var i = 0; i < data.length; i++) {
        			var pubDate        	= data[i].pubDate       == undefined ? "" : data[i].pubDate;
        			var volumeName     	= data[i].volumeName    == undefined ? "" : data[i].volumeName;
        			var loanStateCode  	= data[i].loanStateCode == undefined ? "" : data[i].loanStateCode;
        			var location        = data[i].location      == undefined ? "" : data[i].location;
        			var docPath         = data[i].docPath       == undefined ? "" : data[i].docPath;
        			var tocPath         = data[i].tocPath       == undefined ? "" : data[i].tocPath;
        			var pdfInfo         = data[i].pdfInfo    == undefined ? null : data[i].pdfInfo;

        			var titles 			= pubDate.substring(0,4)+"."+pubDate.substring(4,6)+"."+pubDate.substring(6,8);

        			volumeHtml    += "            <tr>\n";
        			//volumeHtml    += "                <td class=\"tl\"><a href=\"#none\" title=\"  \">" + pubDate + "</a></td>\n";
//        			volumeHtml    += "                <td><a href=\"#none\" title=\"" + titles + "\">" + pubDate.substring(0,4)+"."+pubDate.substring(4,6)+"."+pubDate.substring(6,8) + "</a></td>\n";
        			volumeHtml    += "                <td>" + titles + "</td>\n";
        			volumeHtml    += "                <td>" + volumeName + "</td>\n";
        			volumeHtml    += "                <td>" + loanStateCode + "</td>\n";
        			volumeHtml    += "                <td>" + location + "</td>\n";
        			if (data[i].articleCnt > 0) {
        				volumeHtml += "    <td><a href=\"javascript:openViewArticle('" + data[i].controlNo + "', '" + data[i].volumeNo + "');\" title='기사보기'>기사보기</a></td>\n";
        			}
        			else {
        				volumeHtml += "    <td></td>\n";
        			}

// 20210118 org back start
//        			volumeHtml    += "                <td>\n";
////        			if (docPath.length > 0) {
////        				if (isMobile) {
////        					volumeHtml    += "                    <a href=\"#none\" class=\"original\" title=\"원문보기(음성지원)\" onclick=\"viewPdfExec('"+data[i].controlNo+ "_"+data[i].volumeNo+"', '"+data[i].controlNo.substring(0,4)+"', '" + volumeName + "', '1', '"+prevSearchQuery+"');\">원문보기(음성지원)</a>\n";
////        				} else {
////        					volumeHtml    += "                    <a href=\"#none\" class=\"original\" title=\"원문보기(음성지원)\" onclick=\"viewDocBySingleCount('"+data[i].controlNo+ "_"+data[i].volumeNo+"');\">원문보기(음성지원)</a>\n";
////        				}
////        					volumeHtml    += "                    <a href=\"#none\" class=\"download\" title=\" 다운로드\"onclick=\"downloadBySingleCount('"+data[i].controlNo+ "','"+data[i].volumeNo+"')\";>다운로드</a>\n";
////        			}
//        			volumeHtml    += "                </td>\n";
// 20210118 org back end
        			// 20210118 mody start
        			if (pdfInfo != null) {
        				var count         = pdfInfo.count;
        				var iconClass     = pdfInfo.iconClass;
        				var iconDesc      = pdfInfo.iconDesc;
        				var iconDescClass = pdfInfo.iconDescClass;
        				var downloadYn    = pdfInfo.downloadYn;

        				if (parseInt(count) > 0) {
        					volumeHtml += "    <td>";
//            				if (isMobile) {
//            					volumeHtml += "        <a href=\"#none\" class=\"mr10 " + iconClass +  "\" onclick=\"viewPdfExec('" + data[i].controlNo + "_" +data[i].volumeNo+ "', 'SERL', '" + volumeName + "', '"+data[i].docTtsPub+"', '"+prevSearchQuery+"');\"><span class=\"vab " + iconDescClass + "\">" + iconDesc + "</span></a>";
//            				} else {
//            					volumeHtml += "        <a href=\"#none\" class=\"mr10 " + iconClass +  "\" onclick=\"viewDoc(this, '" + data[i].controlNo + "_" +data[i].volumeNo+ "', '" + count + "')\";><span class=\"vab " + iconDescClass + "\">" + iconDesc + "</span></a>";
//            				}

            				volumeHtml += "        <a href=\"#none\" class=\"mr10 " + iconClass +  "\" onclick=\"viewDoc(this, '" + data[i].controlNo + "_" +data[i].volumeNo+ "', '" + count + "')\";><span class=\"vab " + iconDescClass + "\">" + iconDesc + "</span></a>";

            				if (downloadYn == "Y") {
//            					volumeHtml += "        <a href=\"#none\" class=\"original download\" onclick=\"downloadDoc(this, '" + data[i].controlNo + "_" +data[i].volumeNo+ "', '" + count + "')\";>다운로드</a>";
            					volumeHtml += "       <br><a href=\"#none\" class=\"download\" onclick=\"downloadBySingleCount('" + data[i].controlNo + "', '" +data[i].volumeNo+ "', '" + count + "')\";>다운로드</a>";
            				}
            				volumeHtml += "    </td>\n";
        				} else {
        					volumeHtml += "    <td></td>\n";
        				}
        			} else {
        				volumeHtml += "    <td></td>\n";
        			}
        			// 20210118 mody end

        			volumeHtml    += "                <td>\n";

        			if (tocPath.length > 0) {
        				volumeHtml    += "                    <a href=\"#none\" class=\"view\" title=\"보기\" onclick=\"viewVolumeToc(this, '" + data[i].volumeNo + "', '" + tocPath + "', '" + i +  "')\">보기</a>\n"
        			}

        			volumeHtml    += "                </td>\n";
        			volumeHtml    += "            </tr>\n";
        		}

        		volumeHtml    += "        </tbody>\n";
        		volumeHtml    += "    </table>\n";
        		volumeHtml    += "</div>\n";
        		volumeHtml    += "<div class=\"btnWrap\">\n";
        		volumeHtml    += "    <a href=\"#none\" class=\"btn close\" title=\"닫기\" onclick=\"closeVolume('" + controlNo + "')\">닫기</a>\n";
        		volumeHtml    += "</div>\n";

        		//$("#VOLUME_" + controlNo).children().remove();
                $("#VOLUME_" + controlNo).html(volumeHtml);

                $(".table").footable();
                $(".table").addClass("detailSubTable3");
        	}
        }, complete    : function(data) {
    		$("#annexSelect").val(selectAnnexType).prop("selected", true);
        }
    });
}

/**
 * 권호 for Pc
 * @param controlNo
 * @returns
 */
function showVolumePc(controlNo) {
//	var pubYear = $("#listNo_"+controlNo).val();
//	pubYear = pubYear == 0 ? "" : pubYear;

	var callUrl = "/VolumeNIssue.do";
	var parameter = "cn="+controlNo+"&pubYear=";
	var fullUrl = callUrl+ "?" + parameter;
	var w = 800;
	var h = 455;

	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    settings ='height='+'560'+',width='+'1000'+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+'yes'+',status=yes,resizable';
    volumePop = window.open(fullUrl, 'volumePop', settings);
	return false;
}

/**
 * 권호기사
 * @param controlNo
 * @returns
 */
function showArticle(controlNo, volumeNo) {
	$.ajax({
        url        : "/search/viewArticle.do",
        type       : "POST",
        data       : {controlNo : controlNo, volumeNo : volumeNo},
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {
        		var articleHtml = "<div class=\"tWrap\">\n";
        		articleHtml    += "    <table class=\"table tStyle3\">\n";
        		articleHtml    += "        <caption class=\"skip\">권호기사 목록 테이블로 기사명, 저자명, 페이지, 원문, 기사목차 순으로 되어있습니다.</caption>\n";
        		articleHtml    += "        <colgroup>\n";
        		articleHtml    += "            <col>\n";
        		articleHtml    += "            <col width=\"10%\">\n";
        		articleHtml    += "            <col width=\"12%\">\n";
        		articleHtml    += "            <col width=\"30%\">\n";
        		articleHtml    += "            <col width=\"10%\">\n";
        		articleHtml    += "        </colgroup>\n";
        		articleHtml    += "        <thead>\n";
        		articleHtml    += "            <tr>\n";
        		articleHtml    += "                <th scope=\"col\">기사명</th>\n";
        		articleHtml    += "                <th scope=\"col\">저자명</th>\n";
        		articleHtml    += "                <th scope=\"col\" data-breakpoints=\"xs\">페이지</th>\n";
        		articleHtml    += "                <th scope=\"col\" data-breakpoints=\"xs sm\">원문</th>\n";
        		articleHtml    += "                <th scope=\"col\">기사목차</th>\n";
        		articleHtml    += "            </tr>\n";
        		articleHtml    += "        </thead>\n";
        		articleHtml    += "        <tbody>\n";

        		for (var i = 0; i < data.length; i++) {
        			var artNo      = data[i].artNo      == undefined ? ""   : data[i].artNo;
            		var artName    = data[i].artName    == undefined ? ""   : data[i].artName;
            		var authorName = data[i].authorName == undefined ? ""   : data[i].authorName;
            		var page       = data[i].page       == undefined ? ""   : data[i].page;
            		var pdfInfo    = data[i].pdfInfo    == undefined ? null : data[i].pdfInfo;
            		var tocPath    = data[i].tocPath    == undefined ? ""   : data[i].tocPath;

            		var titles = artName.replaceAll("\"","").replaceAll("<","").replaceAll(">","");

        			articleHtml    += "            <tr>\n";
        			articleHtml    += "                <td class=\"tl\"><a href=\"Javascript:searchInnerDetail('"+artNo+"', 'Y')\" title=\"" + titles + "\">" + artName + "</a></td>\n";
        			articleHtml    += "                <td>" + authorName + "</td>\n";
        			articleHtml    += "                <td>" + page + "</td>\n";

        			if (pdfInfo != null) {
        				var count         = pdfInfo.count;
        				var iconClass     = pdfInfo.iconClass;
        				var iconDesc      = pdfInfo.iconDesc;
        				var iconDescClass = pdfInfo.iconDescClass;
        				var downloadYn    = pdfInfo.downloadYn;

        				if (parseInt(count) > 0) {
            				articleHtml += "    <td>";
            				articleHtml += "        <a href=\"#none\" class=\"mr10 " + iconClass +  "\" onclick=\"viewDoc(this, '" + artNo + "', '" + count + "')\";><span class=\"vab " + iconDescClass + "\">" + iconDesc + "</span></a>"

            				if (downloadYn == "Y") {
            					articleHtml += "        <a href=\"#none\" class=\"download\" onclick=\"downloadDoc(this, '" + artNo + "', '" + count + "')\";>다운로드</a>";
            				}
            				articleHtml += "    </td>\n";
        				} else {
        					articleHtml += "    <td></td>\n";
        				}
        			} else {
        				articleHtml += "    <td></td>\n";
        			}

        			if (tocPath.length > 0) {
        				articleHtml    += "                    <td><a href=\"#none\" class=\"view\" title=\"보기\" onclick=\"viewArticleToc(this, '" + artNo + "', '" + tocPath + "', '" + i +  "')\">보기</a></td>\n";
        			} else {
        				articleHtml += "    <td></td>\n";
        			}
        			articleHtml    += "                </td>\n";
        			articleHtml    += "            </tr>\n";

        			articleHtml    += "            <tr class=\"viewWrap tdNone\">\n";
        			articleHtml    += "                <td colspan=\"5\" class=\"tdBlock\">\n";
        			articleHtml    += "                    <div class=\"wrap\">\n";
        			articleHtml    += "                        <div class=\"txt\" id=\"TOC_" + artNo + "_" + i + "\"></div>\n";
        			articleHtml    += "                    </div>\n";
        			articleHtml    += "                </td>\n";
        			articleHtml    += "            </tr>\n";
        		}

        		articleHtml    += "        </tbody>\n";
        		articleHtml    += "    </table>\n";
        		articleHtml    += "</div>\n";
        		articleHtml    += "<div class=\"btnWrap\">\n";
        		articleHtml    += "    <a href=\"#none\" class=\"btn close\" title=\"닫기\" onclick=\"closeArticle('" + controlNo + "')\">닫기</a>\n";
        		articleHtml    += "</div>\n";

        		$("#ARTICLE_" + controlNo).children().remove();
                $("#ARTICLE_" + controlNo).html(articleHtml);

                $(".table").footable();
                $(".table").addClass("detailSubTable2");
        	}
        }
    });
}

function showArticlePc(controlNo, volumeNo){
	var callUrl = "/VolumeNReport.do";
	var parameter = "cn="+controlNo+"&volumeNo="+volumeNo;
	var fullUrl = callUrl+ "?" + parameter;
	var w = 800;
	var h = 455;

	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    settings ='height='+'560'+',width='+'1400'+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+'yes'+',status=yes,resizable';
    articlePop = window.open(fullUrl, 'articlePop', settings);
	return false;
}

function viewRelatedDataToc(obj) {
	$(obj).parent().parent().next(".tocDetail2").slideToggle("fast");
}

function viewArticleToc(obj, controlNo, filePath, seqNo) {
	// 목차보기가 열려 있는 경우, 호출 안함
	if ($(obj).hasClass("on")) {
		$(obj).toggleClass("on");
    	$(obj).parent().parent().next(".viewWrap").slideToggle("fast");
		return false;
	}

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
}

function closeArticle(controlNo) {
	$("#ARTICLE_" + controlNo).slideToggle("fast");
	$(".dataInfo .article").removeClass("on");
	//$(".dataInfo .footable-detail-row").css('display','none');
	//$(".dataInfo .viewWrap").css('display','none');
}

function closeVolume(controlNo) {
	$("#VOLUME_" + controlNo).slideToggle("fast");
	$(".dataInfo .volume").removeClass("on");
}

//#################################### 이용현황  ##################################
/**
 * 이용현황, 20211117 KHJ 추가
 * @param controlNo
 * @returns
 */
function showUsageStatus(dbDiv, controlNo, userClass1, usedLib, loanCheck, combiCount) {

	var branchCode = $("#USAGESTATUS_"+controlNo).find("#branchNo").val();

	$.ajax({
        url        : "/search/getUsageStatusList.do",
        type       : "POST",
        data: {
			controlNo : controlNo
			, branchCode: branchCode
		},
        dataType   : "json",
        success    : function(data) {

        	branchCode     		= branchCode == undefined ? "ALL" : branchCode;
        	var branchCnt 		= data[0].branchCnt == undefined ? "" : data[0].branchCnt;
        	var drBranch   		= data[0].drBranch == undefined ? "" : data[0].drBranch;
			var drReservation 	= data[0].drReservation == undefined ? "" : data[0].drReservation;


        	if (data != null) {
        		var usageStatusHtml = "<div class=\"tWrap\">\n";

        		//selectBox추가, (서울 본관, 부산관) 20211117 KHJ
        		if(branchCnt > 1){
        			usageStatusHtml	   += "<select id='branchNo' class='select2' title='패킷 선택'>";
                    usageStatusHtml	   += "<option value='ALL'>전체</option>";
                    if(branchCode == "ULK" ){usageStatusHtml+= "<option value='ULK' selected>서울 본관</option>";}
                    else{usageStatusHtml+= "<option value='ULK'>서울 본관</option>";}
                    if(branchCode == "BNK" ){usageStatusHtml+= "<option value='BNK' selected>부산관</option>";}
                    else{usageStatusHtml+= "<option value='BNK'>부산관</option>";}
                    usageStatusHtml	   += "</select>";
                    usageStatusHtml	   += "<span class='recommend'>";
                    usageStatusHtml	   += "<a href='javascript:showUsageStatus(\""+dbDiv+"\",\""+controlNo+"\",\""+userClass1+"\",\""+usedLib+"\",\""+loanCheck+"\",\""+combiCount+"\");' title='조회'>조회</a>";
                    usageStatusHtml	   += "</span>";
        		}



        		usageStatusHtml	   += "<div class=\"legend\">\n";
        		usageStatusHtml	   += "		<ul>\n";
        		/**
        		 * 예약가능자: 직원, 부산관검색대, 부산관이용자 (이공연주무관님 요청)
        		 **/
        		if(drReservation != 'true'){
	        		if( userClass1 == '3'
	        			|| (combiCount == '1' && usedLib == 'BNK')
	        			|| (userClass1 == '0' && usedLib == 'BNK' && loanCheck == '0000')){
	        				usageStatusHtml	   += "			<li class=\"charIcon1\"><span>R</span> 예약</li>\n";
	        		}
        		}
        		/**
        		 * 서비스(상호이용)가능자: 직원, 서울 본관검색대, 부산관검색대, 부산관이용자 (이공연주무관님 요청)
        		 **/
        		if(drBranch != 'true'){
        			if( userClass1 == '3'
        				|| (combiCount == '1' && usedLib == 'ULK')
        				|| (combiCount == '1' && usedLib == 'BNK')
        				|| (userClass1 == '0' && usedLib == 'BNK' && loanCheck == '0000')){
        					usageStatusHtml	   += "			<li class=\"charIcon2\"><span>M</span> 상호이용</li>\n";
        			}
        		}
        		usageStatusHtml	   += "		</div>\n";
        		usageStatusHtml	   += "</ul>\n";



        		usageStatusHtml    += "    <table class=\"table tStyle3\">\n";
        		usageStatusHtml    += "        <caption class=\"skip\">이용현황 테이블로 등록번호, 청구기호, 권별정보, 자료실, 이용여부, 예약으로 구성 되어있습니다.</caption>\n";
        		usageStatusHtml    += "        <colgroup>\n";
        		usageStatusHtml    += "            <col width=\"15%\">\n";
        		usageStatusHtml    += "            <col width=\"15%\">\n";
        		if (dbDiv != 'MIFO' && dbDiv != 'VDBK' && dbDiv != 'ADBK' && dbDiv != 'CDBK' && dbDiv != 'MAPI') {
        			usageStatusHtml    += "            <col width=\"15%\">\n";
        		}
        		usageStatusHtml    += "            <col>\n";
        		usageStatusHtml    += "            <col width=\"15%\">\n";
        		usageStatusHtml    += "            <col width=\"*%\">\n";
        		usageStatusHtml    += "        </colgroup>\n";
        		usageStatusHtml    += "        <thead>\n";
        		usageStatusHtml    += "            <tr>\n";
        		usageStatusHtml    += "                <th scope=\"col\">등록번호</th>\n";
        		if (dbDiv != 'MIFO' && dbDiv != 'VDBK' && dbDiv != 'ADBK' && dbDiv != 'CDBK' && dbDiv != 'MAPI') {
        			usageStatusHtml    += "                <th scope=\"col\" data-breakpoints=\"xs\">청구기호</th>\n";
        		}
        		usageStatusHtml    += "                <th scope=\"col\" data-breakpoints=\"xs\">권별정보</th>\n";
        		usageStatusHtml    += "                <th scope=\"col\">자료실</th>\n";
        		usageStatusHtml    += "                <th scope=\"col\">이용여부</th>\n";

        		/**
        		 * 예약가능자: 직원, 부산관검색대, 부산관이용자 (이공연주무관님 요청)
        		 **/
        		if(drReservation != 'true'){
	        		if( userClass1 == '3'
	        			|| (combiCount == '1' && usedLib == 'BNK')
	        			|| (userClass1 == '0' && usedLib == 'BNK' && loanCheck == '0000')){
	        			usageStatusHtml    += "                <th scope=\"col\">예약</th>\n";
	        		}
        		}

        		/**
        		 * 서비스(상호이용)가능자: 직원, 서울 본관검색대, 부산관검색대, 부산관이용자 (이공연주무관님 요청)
        		 **/
        		if(drBranch != 'true'){
        			if( userClass1 == '3'
        				|| (combiCount == '1' && usedLib == 'ULK')
        				|| (combiCount == '1' && usedLib == 'BNK')
        				|| (userClass1 == '0' && usedLib == 'BNK' && loanCheck == '0000')){
        				usageStatusHtml    += "                <th scope=\"col\">서비스</th>\n";
        			}
        		}

        		usageStatusHtml    += "            </tr>\n";
        		usageStatusHtml    += "        </thead>\n";
        		usageStatusHtml    += "        <tbody>\n";

        		for (var i = 0; i < data.length; i++) {

        			var itemRegNo     = data[i].itemRegNo == undefined ? "" : data[i].itemRegNo;
        			var callNo        = data[i].callNo == undefined ? "" : data[i].callNo;
        			var volumnNo      = data[i].volumnNo == undefined ? "" : data[i].volumnNo;
        			var location = data[i].location == undefined ? "" : data[i].location;
        			var loanStateCode = data[i].loanStateCode == undefined ? "" : data[i].loanStateCode;
        			var reservation = data[i].reservation == undefined ? "" : data[i].reservation;
        			var ruleSeqNo    = data[i].ruleSeqNo == undefined ? "" : data[i].ruleSeqNo;
        			var mUsed 		 = data[i].mUsed == undefined ? "0" : data[i].mUsed;
        			var brCode	     = data[i].branchCode == undefined ? "0" : data[i].branchCode;
        			//if(brCode == "BNK"){loanStateCode = "[부산관]이용준비중";}

        			usageStatusHtml    += "            <tr>\n";
        			usageStatusHtml    += "                <td>" + itemRegNo + "</td>\n";
        			if (dbDiv != 'MIFO' && dbDiv != 'VDBK' && dbDiv != 'ADBK' && dbDiv != 'CDBK' && dbDiv != 'MAPI') {
        				usageStatusHtml    += "                <td>" + callNo + "</td>\n";
        			}
        			usageStatusHtml    += "                <td>" + volumnNo + "</td>\n";
        			usageStatusHtml    += "                <td>" + location + "</td>\n";
        			usageStatusHtml    += "                <td>" + loanStateCode + "</td>\n";

        			/**
            		 * 예약가능자: 직원, 부산관검색대, 부산관이용자 (이공연주무관님 요청)
            		 **/
        			if(drReservation != 'true'){
    	        		if( userClass1 == '3'
    	        			|| (combiCount == '1' && usedLib == 'BNK')
    	        			|| (userClass1 == '0' && usedLib == 'BNK' && loanCheck == '0000')){
        				usageStatusHtml    += "<td class=\"charIcon\">"+ reservation +"</td>\n";
    	        		}
        			}


        			/**
            		 * 서비스(상호이용)가능자: 직원, 서울 본관검색대, 부산관검색대, 부산관이용자 (이공연주무관님 요청)
            		 **/
	        		if(drBranch != 'true'){
	        			if( userClass1 == '3'
	        				|| (combiCount == '1' && usedLib == 'ULK')
	        				|| (combiCount == '1' && usedLib == 'BNK')
	        				|| (userClass1 == '0' && usedLib == 'BNK' && loanCheck == '0000')){
	        				usageStatusHtml    += " <td class=\"charIcon\">";
		        			//rule번호가 0이 아닌것, mUsed -> 0이 아닌것
		        			if(ruleSeqNo != 0 && mUsed != 0){
		        				usageStatusHtml    += " 	<span class=\"charIcon2\" onclick='loanMutalInsert(\"M\",\""+controlNo+"\");' >M</span>";
		        			}
		        			usageStatusHtml    += " </td>";
	        			}
	        		}

        			usageStatusHtml    += "            </tr>\n";

        		}//for - END

        		//데이터가 없는경우 추가, 20211124 KHJ
        		if(data.length == 0){
        			usageStatusHtml       += "<tr><td colspan='6' class=\"noResult\" >데이터가 없습니다.</td></tr>";
        		}

        		usageStatusHtml    += "        </tbody>\n";
        		usageStatusHtml    += "    </table>\n";
        		usageStatusHtml    += "</div>\n";
        		//usageStatusHtml    += "<div class=\"btnWrap\">\n";
        		//usageStatusHtml    += "    <a href=\"#none\" class=\"btn close\" title=\"닫기\" onclick=\"closeUsageStatus('" + controlNo + "')\">닫기</a>\n";
        		//usageStatusHtml    += "<div>\n";

        		$("#USAGESTATUS_" + controlNo).children().remove();
                $("#USAGESTATUS_" + controlNo).html(usageStatusHtml);

                //$(".table").footable();
                //$(".table").addClass("detailSubTable1");
        	}//data if - END
        }
    });
}


function closeUsageStatus(controlNo) {
	$("#USAGESTATUS_" + controlNo).slideToggle("fast");
}

//#################################### 국회도서관 정보서비스 레이어팝업  ##################################
function loadInfoServiceCount() {
	// 스트레스 테스트. 운영시 주석 처리..
	//return false;

	var searchQuery = $("#searchQuery").val();
	if (searchQuery.length == 0) {
		return false;
	}

	$.ajax({
        url        : "/info/lawListCount.do",
        type       : "POST",
        data       : {
        	isTotalSearch : "Y",
        	searchKey     : searchQuery
    	},
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {
        		if (parseInt(data.totalCount) > 0) {
        			$("#lawCount").text(numberWithComma(data.totalCount));
        			makeInfoServiceView('0', 'Law', 'https://law.nanet.go.kr', '/index.do?dlSearch=' + encodeURI(searchQuery));
        		}
        	}
        }
    });

	$.ajax({
        url        : "/info/AmposListCount.do",
        type       : "POST",
        data       : {
        	query            : searchQuery,
        	abSeminarDivCode : 10,
        	docPage			 : 1,
        	docSize			 : 3
    	},
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {
        		if (parseInt(data.totalCount) > 0) {
        			$("#amposCount").text(numberWithComma(data.totalCount));
        			makeInfoServiceView('1', 'Ampos', 'https://ampos.nanet.go.kr:7443', '/materialSeminarTotalList.do?queryText=' + encodeURI(searchQuery));
        		}
        	}
        }
    });

	$.ajax({
        url        : "/info/ClikListCount.do",
        type       : "POST",
        data       : {
        	pageNum  : 1,
    		pageSize : 3,
    		pageType : "summary",
    		reSearch : "N",
    		query	 : searchQuery
        },
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {
        		if (parseInt(data.totalCount) > 0) {
        			$("#clickCount").text(numberWithComma(data.totalCount));
        			makeInfoServiceView('2', 'Clik', 'https://clik.nanet.go.kr', '/potal/search/search.do?query=' + encodeURI(searchQuery.trim()));
        		}
        	}
        }
    });

	$.ajax({
        url        : "/info/ArchivesListCount.do",
        type       : "POST",
        data       : {
        	search_type : "ALL",
    		search_text : searchQuery
        },
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {
        		if (parseInt(data.totalCount) > 0) {
        			$("#archivesCount").text(numberWithComma(data.totalCount));
        			makeInfoServiceView('3', 'Archives', 'https://archives.nanet.go.kr', '/search/searchList.do?search_type=ALL&search_text=' + encodeURI(searchQuery));
        		}
        	}
        }
    });

	$.ajax({
        url        : "/info/HumanListCount.do",
        type       : "POST",
        data       : {searchQuery : searchQuery},
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {
        		data = JSON.parse(data);
        		if (parseInt(data.total) > 0) {
        			$("#humanCount").text(numberWithComma(data.total));
//        			makeInfoServiceView('4', 'Human', 'https://hn.nanet.go.kr', '/searchList.do?deSearchChk=&useQueryConvert=F&searchText=' + encodeURI(searchQuery));
        			makeInfoServiceView('4', 'Human', 'https://hn.nanet.go.kr', '/totalSearch.do?mainDtlSearchText_first=' + encodeURI(searchQuery.trim()));
        		}
        	}
        }
    });

	$.ajax({
        url        : "/info/ArgosListCount.do",
        type       : "POST",
        data       : {searchQuery : searchQuery},
        dataType   : "json",
        success    : function(data) {
        	if (data != null && data.result) {
        		if (parseInt(data.result[0].resultCnt) > 0) {
        			$("#argosCount").text(numberWithComma(data.result[0].resultCnt));
        			// TODO : 담당자한테 정보 받아서 처리해야함
        			makeInfoServiceView('5', 'Argos', '', data.result[0].url);
        		}
        	}
        }
    });
}

//링크 만들기
function makeInfoServiceView(idx, target, url, retUrl) {
	/* aside.jsp 내용변경으로 인한 기존방식 주식처리. 20210727 KHJ
	 * $(".infoService > ul > li:eq(" + idx + ")").click(function() {
		viewInfoService(target, url, retUrl);
	});*/
	$(".serviceList2 > li:eq(" + idx + ")").click(function() {
		viewInfoService(target, url, retUrl);
	});
}

/**
 * 상세보기
 * target	: 시스템 이름
 * url		: 각 시스템별 통합검색용 상세보기 url
 * retUrl	: 상세보기로 이동할 url (한글 파라미터는 encodeURI()로 인코딩해야함)
 * USE		: tschView("Law", "1.12.123:1000", "/test.do?param1=encodeURI(한글)&param2=2")
 */
function viewInfoService(target, url, retUrl) {
	// 로그 정보 적재
	insertInfoServiceLog(target);

	if (target == "Ampos") {
		if (userId.length > 0) {
			var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("target", "_blank");
			form.setAttribute("action", url + "/login.do");

			var hiddenInput1 = document.createElement("input");
			hiddenInput1.setAttribute("type", "hidden");
			hiddenInput1.setAttribute("id",   "userId");
			hiddenInput1.setAttribute("name", "userId");
			hiddenInput1.setAttribute("value", userId);
			form.appendChild(hiddenInput1);

			var hiddenInput2 = document.createElement("input");
			hiddenInput2.setAttribute("type", "hidden");
			hiddenInput2.setAttribute("id",   "retURL");
			hiddenInput2.setAttribute("name", "retURL");
			hiddenInput2.setAttribute("value", retUrl);
			form.appendChild(hiddenInput2);

			document.body.appendChild(form);
			form.submit();

		} else {
			window.open(url + retUrl, "_blank");
		}
	} else {
		window.open(url + retUrl, "_blank");
	}
}

function insertInfoServiceLog(linkSystem) {
	$.ajax({
		url: "/info/insertInfoServiceLog.do",
		method: "POST",
		data: {
			linkSystem  : linkSystem,
			searchQuery : $("#searchQuery").val()
		}
	});
}

function numberWithComma(value) {
	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
//#################################### 저자 프로필보기  ##################################
/**
 * 저자프로필을 본다.
 * @param controlNo
 * @returns
 */
function showAuthorProfile(obj, controlNo) {
	$.ajax({
        url        : "/search/getAuthorProfileList.do",
        type       : "POST",
        data       : {controlNo : controlNo},
        dataType   : "json",
        success    : function(data) {
        	if (data != null) {
        		var authorHtml = "<div class=\"tWrap\">\n";
        		authorHtml    += "    <table class=\"tStyle3 detailSubTable4\">\n";
        		authorHtml    += "        <caption class=\"skip\">저자프로필 목록 테이블로 저자명, 프로필 순으로 되어있습니다.</caption>\n";
        		authorHtml    += "        <colgroup>\n";
        		authorHtml    += "            <col width=\"15%\">\n";
        		authorHtml    += "            <col>\n";
        		authorHtml    += "        </colgroup>\n";
        		authorHtml    += "        <thead>\n";
        		authorHtml    += "            <tr>\n";
        		authorHtml    += "                <th scope=\"col\">저자</th>\n";
        		authorHtml    += "                <th scope=\"col\">프로필</th>\n";
        		authorHtml    += "            </tr>\n";
        		authorHtml    += "        </thead>\n";
        		authorHtml    += "        <tbody>\n";

        		for (var i = 0; i < data.length; i++) {
        			var authorName    = data[i].authorName    == undefined ? "" : data[i].authorName;
        			var authorProfile = data[i].authorProfile == undefined ? "" : data[i].authorProfile;
        			authorHtml    += "            <tr>\n";
        			authorHtml    += "                <td><a href=\"#none\" title=\"  \">" + authorName + "</a></td>\n";
        			authorHtml    += "                <td class=\"tl\">" + authorProfile + "</td>\n";
        			authorHtml    += "            </tr>\n";
        		}
        		authorHtml    += "        </tbody>\n";
        		authorHtml    += "    </table>\n";
        		authorHtml    += "</div>\n";
        		authorHtml    += "<div class=\"btnWrap\">\n";
        		authorHtml    += "    <a href=\"#none\" class=\"btn close\" title=\"닫기\" onclick=\"closeAuthorProfile('" + controlNo + "')\">닫기</a>\n";
        		authorHtml    += "</div>\n";

        		$("#AUTHOR_" + controlNo).children().remove();
                $("#AUTHOR_" + controlNo).html(authorHtml);
        	}
        }
    });
}

function closeAuthorProfile(controlNo) {
	$("#AUTHOR_" + controlNo).slideToggle("fast");
}

//#################################### print  ##################################
function printTocOrExpOrAbs(obj) {
	var contentHtml = "<li>" + $(obj).parent().find(".box").clone().html() + "</li>";

	$('input[name="contentHtml"]').val(contentHtml);
	$('input[name="handlerType"]').val("print");

	var form = $("#exportForm");
	var printWin = window.open("about:blank", "export");

	form.attr("target", "export");
	form.submit();
}

//#################################### 자료추천서비스  ##################################
function showBestMeterailService() {
	if (document.cookie.indexOf("bestMeterialTodayCookie=done") < 0) {
		$("#bestMeterialServiceArea").show();
	}
}

function closeBestMeterialService(closeType) {
	if (closeType == "TODAY") {
		setDoNotOpenTodayCookie("bestMeterialTodayCookie", "done", 1); // in common.js
	}
	$("#bestMeterialServiceArea").hide();
}

