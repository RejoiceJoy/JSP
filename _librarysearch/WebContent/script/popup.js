// ########################################################################
// 국회도서관  Popup JS
// 2020.10.30 (srlee) : 파일 생성
// ########################################################################

/**
 * PopupUtil을 사용하여 팝업창을 오픈한다.
 * @param popUrl
 * @param popName
 * @param param
 * @param callbackName
 * @param context
 */
function openPopupWindow(popUrl, popName, param, callbackName, context) {
	return PopupUtil.openWindow({
	    url : popUrl,
	    name : popName,
	    width : 800,
	    height : 600,
	    moveCenter : true,
	    status : true,
	    scrollbars : true,
	    resizable : true,
	    param : param,
	    callbackName : callbackName,
	    callbackContext : context
	});
}

/**
 * PopupUtil을 사용하여 팝업창을 오픈한다.
 * @param popUrl
 * @param popName
 * @param param
 * @param callbackName
 * @param context
 * @param width
 * @param height
 */
function openReSizePopupWindow(popUrl, popName, param, callbackName, context, width, height) {
	return PopupUtil.openWindow({
		url : popUrl,
		name : popName,
		width : width,
		height : height,
		moveCenter : true,
		status : true,
		scrollbars : true,
		resizable : true,
		param : param,
		callbackName : callbackName,
		callbackContext : context
	});
}

/**
 * 팝업
 * @param mypage
 * @param myname
 * @param w
 * @param h
 * @param scroll
 */
function openPopupNoResizing(mypage,myname,w,h,scroll){
    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    settings ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable=no';
    win = window.open(mypage,myname,settings);
    event.returnValue = false;
}

//#################### 공통 팝업 ####################
/**
 * e-book 팝업
 * @param param
 * @param callbackName
 * @param callbackContext
 * @returns
 */
function openViewEbookPopup(param) {
	return PopupUtil.openWindow({
	    url        : "/search/viewEbook.do",
	    width      : 1100,
	    height     : 700,
	    moveCenter : true,
	    method     : "post",
	    name       : "e-book",
	    param      : param
	});
}

/**
 * 오디오북 올드 버전
 * @param srcUrl
 * @returns
 */
function openViewAudioPopupByOld(srcUrl) {
	return PopupUtil.openWindow({
	    url        : srcUrl,
	    width      : 1024,
	    height     : 768,
	    moveCenter : true,
	    name       : "audioByOld"

	});
}

/**
 * 오디오북 신규 버전
 * @param param
 * @returns
 */
function openViewAudioPopupByNew(param) {
	return PopupUtil.openWindow({
	    url        : "https://audio-book.nanet.go.kr:7443/audiensori/login/sso",
	    width      : 1024,
	    height     : 768,
	    moveCenter : true,
	    param      : param,
	    name       : "audioByNew"
	});
}

/**
 * 동영상 파일
 * @param param
 * @returns
 */
function openViewMediaPopup(param) {
	return PopupUtil.openWindow({
	    url        : "/search/viewMedia.do",
	    width      : 855,
	    height     : 670,
	    moveCenter : true,
	    param      : param,
	    name       : "media"
	});
}


/**
 * 영상자료목록 리스트
 * 20210712 KHJ 김현재
 * @param param
 * @returns
 */
function openViewVideoDataList() {
	return PopupUtil.openWindow({
	    url        : "/search/viewVideoDataList.do",
	    width      : 1180,
	    height     : 700,
	    moveCenter : true,
	    name       : "videoDataList"
	});
}


/**
 * 연속간행물 리스트
 * @param param
 * @returns
 */
function openViewSerials() {
	return PopupUtil.openWindow({
	    url        : "/search/viewSerials.do",
	    width      : 800,
	    height     : 700,
	    moveCenter : true,
	    name       : "serial"
	});
}

/**
 * 대체학위 리스트
 * @param param
 * @returns
 */
function openViewAltDegree() {
	return PopupUtil.openWindow({
	    url        : "/search/searchAltDegreeList.do",
	    width      : 850,
	    height     : 750,
	    moveCenter : true,
	    name       : "altDegree"
	});
}

/**
 * 융합서비스
 * @param param
 * @returns
 */
function openViewPolicyCloudData(param) {
	return PopupUtil.openWindow({
	    url        : "/cloud/viewPolicyCloudData.do",
	    width      : 1200,
	    height     : 800,
	    param      : param,
	    moveCenter : true,
	    name       : "policy"
	});
}

/**
 * 융합서비스
 * @param param
 * @returns
 */
function openViewAuthorCloudData(param) {
	return PopupUtil.openWindow({
	    url        : "/cloud/viewAuthorCloudData.do",
	    width      : 1200,
	    height     : 800,
	    param      : param,
	    moveCenter : true,
	    name       : "author"
	});
}

function openPrintPopup(param) {
	return PopupUtil.openWindow({
	    url        : "/result/search/output.do",
	    name       : "print",
	    method     : "post",
	    width      : 850,
	    height     : 750,
	    param      : param,
	    moveCenter : true
	});
}