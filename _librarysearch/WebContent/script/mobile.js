var dldrm_systemId = "dlib";
var dldrm_serverUrl = "http://clikdrm.nanet.go.kr";
var isWifiState = false;
var useType = '';
var fnCallback = null;
var appVersion = '';
var appVersionOk = true;
var chkUpdate = false;
var pushId = '';
var uuid = '';
// 뒤로가기 처리를 위해서 sessionStorage에 정보를 담아 둡니다.
var refererChk;
var back_referer = [];

//download 변수
var d_cn = '';
var d_vol = '';
var d_db_code = '';
var d_docType = '';
var d_title = '';
var d_query = '';
var d_rasmbly_id = '';

$(document).ready(function() {
	getCurrentAppVersion(); // 버전체크

	// 스크롤 up, down 시 footer control
	var didScroll;
	var delta = 5;
	var lastScrollTop = 0;
	var topnavbarHeight = $('header').outerHeight();
	var bottomnavbarHeight = $('footer').outerHeight();
	$(window).scroll(function(event){
	    didScroll = true;
	});
	setInterval(function() {
	    if (didScroll) {
	        hasScrolled();
	        didScroll = false;
	    }
	}, 150);

	function hasScrolled() {
        var st = $(this).scrollTop();
        if(Math.abs(lastScrollTop - st) <= delta)
            return;
        if (st > lastScrollTop && st > topnavbarHeight){
            // Scroll Down
        	 $('#mobileMenu').hide();
        	 $('.topmenu').show();
        } else {
            // Scroll Up
            if(st + $(window).height() < $(document).height()) {
                $('#mobileMenu').show();
                $('.topmenu').hide();
            }
        }
        lastScrollTop = st;
	}
})

if(typeof Storage !== "undefined") {
	refererChk = window.sessionStorage.getItem("back_referer");

	if(refererChk === null) {
		back_referer.push({"referer_url" : location.href})
		window.sessionStorage.setItem("back_referer", JSON.stringify(back_referer));
	} else if(refererChk.constructor === "String".constructor) {
		back_referer = JSON.parse(refererChk);

		if(back_referer.length > 0) {
			var url = back_referer[back_referer.length-1].referer_url;
			if(url != location.href) {
				if(location.href.indexOf("searchInnerList") == -1 && location.href.indexOf("searchOuterList") == -1) {
					back_referer.push({"referer_url" : location.href})
					window.sessionStorage.setItem("back_referer", JSON.stringify(back_referer));
				}
			}
		} else {
			back_referer.push({"referer_url" : location.href})
			window.sessionStorage.setItem("back_referer", JSON.stringify(back_referer));
		}
	} else {
		alert("웹 스토리지를 지원하지 않습니다.");
	}
}

function putSearchHistory() {
	if(typeof Storage !== "undefined") {
		refererChk = window.sessionStorage.getItem("back_referer");

		if(refererChk.constructor === "String".constructor) {
			back_referer = JSON.parse(refererChk);
			back_referer.push({"referer_url" : location.href + "?" + $("#searchForm").serialize()})
			window.sessionStorage.setItem("back_referer", JSON.stringify(back_referer));
		} else {
			alert("웹 스토리지를 지원하지 않습니다.");
		}
	}
}

//APP버전을 반환한다.
function getCurrentAppVersion(){
	chkUpdate = true;
	try {
		var platform = getPlatform();
		var uagent = navigator.userAgent || navigator.vendor || window.opera;
		
		if(platform == 'iphone' || (platform == 'ipad' && !/safari/i.test(uagent.toLowerCase()))){

			if(!/fb/i.test(uagent.toLowerCase()) && !/kakao/i.test(uagent.toLowerCase()) && !/band/i.test(uagent.toLowerCase()) && !/line/i.test(uagent.toLowerCase()) && !/twitter/i.test(uagent.toLowerCase()) && !/samsungbrowser/i.test(uagent.toLowerCase()) ) {
				location.href = 'http://mdl.nanet.go.kr:7000/jsCall?Function=getCurrentAppVersion';
				//location.href = 'http://mdl2017.nanet.go.kr:7000/jsCall?Function=getCurrentAppVersion';
			} else {
			}
		}else if(platform == 'android' || platform == 'android_tablet'){
			window.MainActivity.getCurrentAppVersion();
		}else if(platform == 'window'){
			//
		}
	} catch (e) {
		chkUpdate = false;
	}
}

//APP버전 정보를 받는다.
function returnCurrentAppVersion(appVer){
	if($('#app_ver')){
		$('#app_ver').text(appVer);
	}

    appVersion = appVer;
	if(chkUpdate){
		//현재 최신버전 정보를 가져온다.
		var platform = getPlatform();
		var url = "/html/mobile/curAppVer.html";
		var params = "platform=" + platform;
		$.ajax({
	        type: "GET",
	        dataType: "text",
	        url: url,
	        data: params,
	        success:function(data){
	        	var isShow = true;
	        	if(data != null){

	        	    var curVer = '';
	        		if(platform == 'iphone' || platform == 'ipad'){
	        			curVer = data.split('/')[0];
	        		}else if(platform == 'android' || platform == 'android_tablet'){
	        			curVer = data.split('/')[1];
	        		}

	        		if(curVer != ''){
	        			appVer = parseInt(appVer.replace(/\./g, ''));
	        			curVer = parseInt(curVer.replace(/\./g, ''));

	        			if(appVer < curVer){
	        				appVersionOk = false;
	        				if(confirm("애플리케이션이 업데이트 되었습니다.\n확인 버튼을 누르면 설치 페이지로 이동합니다.")){
		        				isShow = false;
		        				
	        					if(platform == 'iphone' || platform == 'ipad') {
	        					    location.href = 'http://mdl.nanet.go.kr:7000/jsCall?Function=openUrl&url=' + escape(encodeURIComponent("http://itunes.apple.com/kr/app/%EA%B5%AD%ED%9A%8C-%EC%A0%84%EC%9E%90%EB%8F%84%EC%84%9C%EA%B4%80/id995150111?l=ko&ls=1&mt=8"));
	        	        		}else if(platform == 'android' || platform == 'android_tablet'){
	        	        		    window.open("https://play.google.com/store/apps/details?id=kr.go.nanet.mdl", "_blank");
	        	        		}
	        				}
	        			}
	        		}
	        	}
	        },
	        beforeSend:function(){},
	        error:function(e){}
	    });

		//로딩이미지 표시 여부
		if(platform == 'android' || platform == 'android_tablet'){

			var v = appVer.replace(/\./g, '');
//				if(v.length > 3){
//					v = v.substring(0, 3);
//				}

			var ver = parseInt(v);
			if(ver <= 101){
				isShowLoadingImg = false;
			}
		}
		if(isShowLoadingImg) $('#loading').show();

		chkUpdate = false;

		//디바이스ID
		getDeviceId();
	}
}

//챗봇화면을 호출한다.
function openChatBot(){
	var user_class = "0";
	var platform = getPlatform();
	if(platform == 'iphone' || platform == 'ipad'){
		location.href = 'http://mdl.nanet.go.kr:7000/jsCall?Function=openChatBot&user_class=' + user_class;
	}else if((platform == 'android' || platform == 'android_tablet') && appVersion != ''){
		window.MainActivity.openChatBot(user_class);
	}else{
		alert("모바일 앱에서 이용가능한 서비스입니다.");
	}
}

//챗봇화면에서 전자도서관 화면으로 검색요청(더보기, 상세화면)
function searchChatBot(search_flag, query, ti, au, pp, pd, user_class, dbdiv){

	//search_flag = S : 목록검색, D : 상세화면
	if(search_flag == "D"){
        if(typeof Storage !== "undefined") {
            var cnNum = query.split("_");
            window.sessionStorage.setItem("cn", cnNum[0]);
            window.sessionStorage.setItem("cnNum", cnNum[1]);
            window.sessionStorage.setItem("sw", $("#txt_sw").val());
        }

        $("#cbForm").remove();

        var form = document.createElement("form");
        form.id = "cbForm";
        form.name = "cbForm";
        form.action = "/search/searchInnerDetail.do";
        form.method = "post";

        addElement(form, "controlNo", query);

    	//document.getElementsByTagName("body")[0].appendChild(form);
    	$("body").append(form);

        form.submit();

	}else{
		var queryText = "";
        var fieldText = "";
        var showQuery = "";

        if(query != null && query != ""){
        	var q = query.split("@");
        	for(var i=0; i<q.length; i++){
        		queryText += (queryText.length > 0 ? "@" : "") + q[i] + ":ALL_NI_TOC:AND";
        		showQuery += (showQuery.length > 0 ? " " : "") + q[i];
        	}
        }

        if(ti != null && ti != ""){
        	queryText += (queryText.length > 0 ? "@" : "") + ti + ":(^TITLE^TITLE_BI^)^TITLE_WS:AND";
        	showQuery += (showQuery.length > 0 ? " " : "") + ti;
        }
        if(au != null && au != ""){
        	queryText += (queryText.length > 0 ? "@" : "") + au + ":AUTHOR^AUTHOR_BI^AUTHOR_WS^DP_AUTHOR:AND";
        	showQuery += (showQuery.length > 0 ? " " : "") + au;
        }
        if(pp != null && pp != ""){
        	queryText += (queryText.length > 0 ? "@" : "") + pp + ":PUB^PUB_BI^PUB_WS^DP_PUB:AND";
        	showQuery += (showQuery.length > 0 ? " " : "") + pp;
        }
        if(pd != null && pd != ""){
        	fieldText += (fieldText.length > 0 ? "@" : "") + pd + ":DP_PUB_YEAR:RANGE";
        }
        if(dbdiv == null || dbdiv == "" || dbdiv == "ALL"){
        	dbdiv = "";
        }

        $("#cbForm").remove();

        var form = document.createElement("form");
        form.id = "cbForm";
        form.name = "cbForm";
        //var params = $("#cbForm").serialize();//.replace(/%/g,'%25');
        //form.action = "/mobile/SearchListNew.do?" + params;
        form.action = "/search/searchInnerList.do";
        form.method = "post";
        addElement(form, "queryText", queryText);
        addElement(form, "searchQuery", showQuery);
        addElement(form, "fieldText", fieldText);
        addElement(form, "searchType", "INNER_SEARCH");
        addElement(form, "resultType", "INNER_SEARCH_LIST");
        addElement(form, "searchMehtod", "M");
        addElement(form, "topSubMenuCode", dbdiv);

    	//document.getElementsByTagName("body")[0].appendChild(form);
    	$("body").append(form);

        form.submit();
	}
}

function addElement(frm, name, value){
	var input = document.createElement("input");
	input.type = "hidden";
	input.name = name;
	input.value = value;

	frm.appendChild(input);
}

//Wifi정보를 요청한다.
function checkWifi(use_type, fn_callback){
    useType = use_type;
    fnCallback = fn_callback;

    var platform = getPlatform();

	if(platform == 'iphone' || platform == 'ipad') {
		// DEPLOY-SERVER
	    location.href = 'http://mdl.nanet.go.kr:7000/jsCall?Function=isWifi';
	    // DEV-SERVER
	    //location.href = 'http://mdl2017.nanet.go.kr:7000/jsCall?Function=isWifi';
	} else if(platform == 'android' || platform == 'android_tablet') {
		window.MainActivity.isWifi();
	}

	returnIsWifi('Y');//DELETE
}

//Wifi정보를 받는다.
function returnIsWifi(result){
	if(result == 'Y')
		isWifiState = true;
	else
		isWifiState = false;

	//다운로드일 경우 콜백함수를 호출한다.
	if(useType == 'D'){
		if(fnCallback != undefined && fnCallback != null){
			fnCallback();
		}
	}

	useType = '';
	fnCallback = null;
}

//Wifi체크 콜백함수
function callback(){
    var isDownload = false;
    if(isWifiState) {
        isDownload = true;
    } else {
        //wifi가 아닐 경우 경고 메시지
        if(confirm('3G/LTE 등으로 접속 시 데이터 통화료가 발생할 수 있습니다.\n다운로드 하시겠습니까?')){
            isDownload = true;
        }
    }

    if(isDownload){
        //downloadPDF(d_cn, d_vol, d_db_code, d_docType, d_title, d_query, d_rasmbly_id);

        if (d_vol == null || d_vol == 'null' || d_vol == undefined || d_vol == 'undefined' || d_vol == '<null>') {
            d_vol = "";
        }
        if(d_query == null || d_query == 'null' || d_query == undefined || d_query == 'undefined'){
            d_query = "";
        }
        if(d_rasmbly_id == null || d_rasmbly_id == 'null' || d_rasmbly_id == undefined || d_rasmbly_id == 'undefined'){
            d_rasmbly_id = "";
        }

        //로그용 변수에 세팅
        log_cn = d_cn;
        log_vol = d_vol;
        log_db_code = d_db_code;
        log_docType = d_docType;
        log_title = d_title;
        log_query = d_query;
        log_rasmbly_id = d_rasmbly_id;

        downloadPDF(d_cn, d_vol);
    }

    d_cn = '';
    d_vol = '';
    d_db_code = '';
    d_docType = '';
    d_title = '';
    d_query = '';
    d_rasmbly_id = '';
}

//Wifi체크 콜백함수
function callback2() {
	var form = document.downSend;

    form.uuid.value = d_uuid;
    form.cn.value = d_cn;
    form.vol.value = d_vol;
    form.book_type.value = d_docType;
    form.book_name.value = d_title;
    form.author.value = d_author;
    form.publisher.value = d_publisher;
    form.query.value = d_query;

    form.action="/mobile/myLib.do";
    form.target='_self';
    // 20190621 분류함 기능 추가
    if('의원회관' != null && '의원회관' != '') {
    	inputCabinet(form);
  		return;
    }
    //
    form.submit();
}

//내서재 담기
function inputCabinet(form) {
	openCabinet("list");
	cabinetForm = form;
}

//분류함 오픈
function openCabinet(val) {
	// list		: 내서재담기 클릭
	// move	: 분류함이동
	// edit	: 분류함관리
	$("#myCabinetOpener").val(val);

	if(val == "list") {
		$(".dialogTop > h3").text("분류함 선택");
		$(".dialogTop > h3").addClass("selectImage");
	} else if (val=="move") {
		if(!myLibCheck()) { return; }
		$(".dialogTop > h3").text("분류함 이동");
		$(".dialogTop > h3").addClass("selectImage");
	} else if (val=="edit") {
		$(".dialogTop > h3").text("분류함 관리");
		$(".dialogTop > h3").removeClass("selectImage");
	}
	dialogInit();
}

function dialogInit() {
	$(".myCabinetDialog").scrollTop(0);
	if($("#myCabinetDialog").css("display") == "none"){
		pageLoad();
		showOverlay();// open
		$("body").css("overflow","hidden");
	} else {
		hideOverlay();// close
		$("body").css("overflow","");
	}
}

//분류함 데이터 가져오기
function pageLoad() {
	$.ajax({
		url				:	"/mobile/myCabinetList.do?deco=non",
		type			:	"POST",
    	dataType	:	"json",
    	async 		:	false,
        success 	:	function(result) {
       		$(".dialogBody").empty();

        	var appendHtml = "";
       		for ( var index in result.item ) {
  				var count = parseInt(index)+1;
	    		if($("#myCabinetOpener").val() == "list" || $("#myCabinetOpener").val() == "move") {
	    			// 이동, 선택
	    			appendHtml+="<div class='pop-Box pop-Txt'>";
					appendHtml+="<b class='b_select' onclick='selectCabinet("+count+")'><img src='../images/mylib/check1.png' alt='선택'></b>";
	    			appendHtml+=	"<input type='text'  id='cabinetNm"+count+"' value='"+result.item[index].cate_nm+"' maxlength='30' disabled='true'></input>";
	    			appendHtml+=	"<input type='hidden'	id='cabinetCd" +count+"'	value='"+result.item[index].cate_no+"'>";
	    		} else if($("#myCabinetOpener").val() == "edit") {
	    			// 관리
		    		appendHtml+="<div class='pop-Box'>";
	    			if(count != 1){
// 	    				appendHtml+="<div class='test01'>";
	    				appendHtml+=	"<b class='b_edit' onclick='editCabinet("+count+")'><img src='../images/mylib/btn_1.png' alt='수정'></b>";
	    				appendHtml+=	"<b class='b_delete' onclick='deleteCabinet("+count+")'><img src='../images/mylib/btn_2.png' alt='삭제'></b>";
// 	    				appendHtml+="</div>";
	    				appendHtml+="<input type='text'  id='cabinetNm"+count+"' value='"+result.item[index].cate_nm+"' maxlength='30'></input>";
	    				appendHtml+="<input type='hidden'	id='cabinetOriNm" +count+"'	value='"+result.item[index].cate_nm+"'>";
	    				appendHtml+="<input type='hidden'	id='cabinetCd" +count+"'	value='"+result.item[index].cate_no+"'>";
	    			}else {
	    				// 기본함
	    				appendHtml+="<input type='text'  id='cabinetNm"+count+"' value='"+result.item[index].cate_nm+"' maxlength='30' disabled='true'></input>";
	    				appendHtml+="<input type='hidden'	id='cabinetCd" +count+"'	value='"+result.item[index].cate_no+"'>";
	    			}
	    		}
				appendHtml+="</div>";

       		}

// 			if($("#myCabinetOpener").val() == "edit" || $("#myCabinetOpener").val() == "move") {
				appendHtml+="<div class='pop-Box pop-Add'>";
				appendHtml+=	"<input id='addCabinetNm' type='text' maxlength='30' placeholder='분류함 명을 입력하세요.'>";
				appendHtml+=	"<b class='b_add' onclick='saveCabinet();'><img src='../images/mylib/btn_3.png' alt='추가'></b>";
				appendHtml+="</div>";
// 			}

       		$(".dialogBody").append(appendHtml);
        },
	        error:function(request,status,error){
				alert("error");
	       }
    });

	// 분류함 선택 클릭 (담기, 이동)
	function selectCabinet(no) {

		var cabinet_no = $("#cabinetCd"+no).val();
		var cabinet_nm = $("#cabinetNm"+no).val();
		var session_cabinet_no = $("#sbSearchCabinetSession").val();

		// 내서재 담기인 경우
		if($("#myCabinetOpener").val() == "list") {
			if(!confirm("'"+cabinet_nm + "' 를 선택하시겠습니까?")) {
				return;
			}
			// 내서재담기 클릭했을때 로딩화면 보여줌
			$(".spinner").show();
			cabinetForm.cabinet_no.value = cabinet_no;
			cabinetForm.submit();
			return;
		}

		var cns = "";
		var flag = $('#flag').val();
		var layout_type = 'img';
		if(flag == 1){
		    layout_type = 'data';
		}

		var chk_list = $('#' + layout_type + '_list').find(':input[name=chkbox]');
		for(var i=0; i<chk_list.length; i++){
		    var chkbox = chk_list[i];
		    if($(chkbox).is(":checked")){
		        var cn = $(chkbox).parent().find(':input[name="cn"]').val();
		        var vol = $(chkbox).parent().find(':input[name="vol"]').val();
		        if(vol == null || vol == 'null' || vol == '<null>' || vol == 'undefined' || vol == undefined){
		            vol = '';
		        }
		        if(vol != ''){
		            vol = '_' + vol;
		        }

		        if(cns.length > 0)
		            cns +=  "," + cn + vol;
		        else
		            cns = cn + vol;
		    }
	    }
		if(cns == null || cns == '' || cns.length <= 0){
		    alert("이동할 자료를 선택하세요.");
		    return;
		}

		if(!confirm("선택한 자료를 '"+cabinet_nm + "' 으로 이동하시겠습니까?")) {
			return;
		}

		//체크되어 있는 문서 번호
		$.ajax({
			data			:	{"cabinet_no" : cabinet_no, "cns" : cns},
			url				:	"/mobile/myCabinetMove.do?deco=non",
			type			:	"POST",
	    	dataType	:	"json",
	    	async 		:	false,
	        success 	:	function(result) {
	        	// 페이지 새로고침
	        	// 분류함 이동 후 내서재페이지에서 이동시킨 분류함으로 조회되게 하려면 이부분 수정 cabinet_no만 넘겨주면될듯
				$(".spinner").show();
	        	//location.href = "/mobile/myLib.do";	// 내서재페이지로 이동
				//location.href = "/mobile/myLib.do?searchcabinet="+cabinet_no;	// 이동시킨 분류함으로 세팅하여 내서재 페이지 이동
				location.href = "/mobile/myLib.do?searchcabinet="+session_cabinet_no;	// 기존 분류함 유지하여 내서재 페이지 이동
	        },
	        error		:	function(error) {
	        	alert("error");
	        }
	    });

	}
}

//챗봇화면에서 원문보기 호출
function openViewerChatBot(cn, vol, dbdiv, title, tt1){
/* 구버전 원문뷰어 소스
	var userId = "";

	$.ajax({
        type: "GET",
        dataType: "text",
        url: "/ezpdfdrm/jsp/getUserInfo.jsp",
        data: "",
        async: false,
        success:function(data){
        	if(data != null && data != ''){
        		var userInfo = data.split(",");
        		userId = userInfo[0];
        	}
        },
        beforeSend:function(){},
        error:function(e){}
    });

	if(typeof userId == "undefined" || userId == null || userId == ""){
		userId = "";
	}

	getDocUrl(userId, cn, vol, 'E', dbdiv, title, '', '', tt1, 'Y');
*/
	window.open("/view/callViewer.do?controlNo=" + cn + "&orgId=dl&linkSysId=NADL", cn + " Viewer");
}

//뷰어 호출을 위해 원문 url을 가져온다.
function getDocUrl(user_id, cn, vol, db_code, docType, title, query, rasmblyId, tt1, isChatbot, itemNo) {

	var platform = getPlatform();
	if(platform == 'iphone' || platform == 'ipad' || platform == 'android' || platform == 'android_tablet'){
		checkWifi();
	}
	if(query == null || query == 'null' || query == undefined || query == 'undefined'){
		query = '';
	}
	if(rasmblyId == null || rasmblyId == 'null' || rasmblyId == undefined || rasmblyId == 'undefined'){
		rasmblyId = '';
	}
	if (vol == null || vol == 'null' || vol == undefined || vol == 'undefined' || vol == '<null>') {
		vol = '';
	}
	if(itemNo == null || itemNo == 'null' || itemNo == undefined || itemNo == 'undefined'){
		itemNo = '';
	}

	var collection_id = 'dl';
//	if(db_code == 'E'){
//		//dldrm_systemId = dldrm_systemId;
//		collection_id = 'dl';
//	}else{
//		dldrm_systemId = clikdrm_systemId;
//		collection_id = vol;
//	}

	//if(clientType == 'mobile'){
		//parent.showDownloadPopup();

		//원문 url 취득
		$.ajax({
			url:"/ezpdfdrm/jsp/getJobInfo.jsp?cn=" + cn + "&vol=" + vol + "&sysid=dlib&job=fastopen&deco=non&tt1="+tt1+"&itemNo="+itemNo,
			type:"GET",
			async:true,
			dataType:"text",
			success:function(ret){
				//parent.hideDownloadPopup();

				//뷰어 호출
				if(ret.indexOf('[E],') == -1 && ret.indexOf('ERROR') == -1){

					var dataArr = ret.split(',');
					var result = dataArr[0];
					var docSize = dataArr[1];
					var path = dataArr[2];
					var img_pdf_yn = dataArr[3];
					var isOk = false;

					if(result == 'OK'){
						//Wifi일 때 경고 메시지를 보여준다.
						//if(!parent.isWifiState){    // INZENT
					    if(!isWifiState){
							if(confirm('3G/LTE 등으로 접속 시 데이터 통화료가 발생할 수 있습니다(' + docSize + ').\n원문보기 하시겠습니까?')){
								isOk = true;
							}
						}else{
							isOk = true;
						}

						if(isOk){
							//원문보기 로그 등록
							var url = "/mobile/regAppViewLog.do";
							//regAppViewLog (cn,'','','','',collection_id,docType,'V');
							var params = "cn=" + cn + "&itemNo=" + itemNo;

							$.ajax({
						        type: "POST",
						        data_type : "text",
						        url: url,
						        data: params,
						        async:false,
						        success:function(data){},
						        beforeSend:function(){},
						        error:function(e){},
						        complete : function(data){
									//뷰어 호출
						        	openViewer(user_id, 'W', path, vol, db_code, img_pdf_yn, isChatbot);
					           	}
					    	});
						}else{
							//parent.hideDownloadPopup();
						}
					}else{
						//parent.hideDownloadPopup();
						alert("원문보기 서비스에 장애가 발생하였습니다.\n관리자(02-788-4250)에게 문의하시기 바랍니다.");
					}
				}else{
					alert(ret.replace('[E],', ''));
				}
			},
			error:function() {
				//parent.hideDownloadPopup();
				alert("원문보기 서비스에 장애가 발생하였습니다.\n관리자(02-788-4250)에게 문의하시기 바랍니다.");
			}
		});

		return;
	//}else{
		//hideDownloadPopup();
		//alert('PC에서는 사용하실 수 없습니다.');
		//return;
	//}
}

//뷰어를 호출한다.
function openViewer(user_id, type, path, vol, db_code, img_pdf_yn, isChatbot){

	if(user_id == null || user_id == '' || user_id == 'null' || user_id == 'undefined')
		user_id = '';

	if(type == null || type == '' || type == 'null' || type == 'undefined')
		type = '';

	if(path == null || path == '' || path == 'null' || path == 'undefined')
		path = '';

	if(db_code == null || db_code == '' || db_code == 'null' || db_code == 'undefined')
		db_code = '';

	if(vol == null || vol == '' || vol == 'null' || vol == 'undefined')
		vol = '';

	if(img_pdf_yn == null || img_pdf_yn == '' || img_pdf_yn == 'null' || img_pdf_yn == 'undefined')
		img_pdf_yn = 'N';

	var platform = getPlatform();
	if(platform == 'iphone' || platform == 'ipad'){
	    // DEPLOY-SERVER
//		if(isChatbot == 'Y'){
//			location.href = 'http://mdl.nanet.go.kr:7000/jsCall?Function=openViewerForChatBotController&user_id='+escape(encodeURIComponent(user_id))+'&type='+escape(encodeURIComponent(type))+'&path='+escape(encodeURIComponent(path))+'&db_code='+escape(encodeURIComponent(db_code))+'&vol='+escape(encodeURIComponent(vol))+'&img_pdf_yn='+escape(encodeURIComponent(img_pdf_yn));
//		}else{
			location.href = 'http://mdl.nanet.go.kr:7000/jsCall?Function=openViewer&user_id='+escape(encodeURIComponent(user_id))+'&type='+escape(encodeURIComponent(type))+'&path='+escape(encodeURIComponent(path))+'&db_code='+escape(encodeURIComponent(db_code))+'&vol='+escape(encodeURIComponent(vol))+'&img_pdf_yn='+escape(encodeURIComponent(img_pdf_yn));
//		}
	    // DEV-SERVER
		//location.href = 'http://mdl2017.nanet.go.kr:7000/jsCall?Function=openViewer&user_id='+escape(encodeURIComponent(user_id))+'&type='+escape(encodeURIComponent(type))+'&path='+escape(encodeURIComponent(path))+'&db_code='+escape(encodeURIComponent(db_code))+'&vol='+escape(encodeURIComponent(vol))+'&img_pdf_yn='+escape(encodeURIComponent(img_pdf_yn));
	}else if(platform == 'android' || platform == 'android_tablet'){
		window.MainActivity.openViewer(user_id != '' ? escape(encodeURIComponent(user_id)) : user_id, type, path, vol, db_code, img_pdf_yn, false);
	}
}

/*
 * 디바이스의 플랫폼 정보를 확인하여 리턴합니다.
 */
function getPlatform(){
	var platform = '';
	//var uagent = navigator.userAgent.toLowerCase();
	var uagent = navigator.userAgent || navigator.vendor || window.opera;

	if (/windows phone/i.test(uagent.toLowerCase())) {
	    platform = 'window';
	} else if (/iphone/i.test(uagent.toLowerCase())) {
	    if(/safari/i.test(uagent.toLowerCase())){
	        // safari 란 단어가 들어가 있으면 웹 환경에서 표기하는 내용입니다.
            platform = 'WEB Browser';
        } else {
            platform = 'iphone';
        }
	} else if (/ipad/i.test(uagent.toLowerCase()) || /mac os x/i.test(uagent.toLowerCase())) {
	    if(/safari/i.test(uagent.toLowerCase())){
	        // safari 란 단어가 들어가 있으면 웹 환경에서 표기하는 내용입니다.
	        platform = 'WEB Browser';
	    } else {
	        platform = 'ipad';
	    }
    } else if (/android/i.test(uagent.toLowerCase())) {
        if(uagent.toLowerCase().indexOf('mobile') == -1){
            platform = 'android_tablet';
        }else{
            platform = 'android';
        }
    } else if (/macintosh/i.test(uagent.toLowerCase())){
    	if('ontouchend' in document){
    		platform = 'ipad';
    	} else {
    		platform = 'WEB Browser';
    	}
    }

	console.log("UserAgent: " + uagent);
	console.log("Check Platform: " + platform);

	return platform;
}

function setClientType(){
	var platform = getPlatform();
	if(platform == 'iphone' || platform == 'ipad' || platform == 'android_tablet' || platform == 'android'){
		clientType = "mobile";
		telNum = "4250";
	}
}

/*
 * 하단 네비게이션의 동작을 처리해 줍니다.
 */
function goPage(type) {
    // .spinner를 매 page마다 보여주었으나
    // 페이지가 깜빡이는 느낌이 너무 강해서 주석처리합니다.
    //$(".spinner").show();
    try {
        var platform = getPlatform();

        switch(type) {
            case "home":
                {
                    // 웹 로그 수집
                    try {
                        //_trk_clickTrace('EVT', '^하단메뉴^홈으로');
                    } catch(_e) {
                    }
                    location.href = "/m/main.do";
                }
                break;
            case "back":
                {
                    // 웹 로그 수집
                    try {
                        //_trk_clickTrace( 'EVT', '^하단메뉴^뒤로');
                    } catch(_e) {
                    }

                    // 뒤로가기 이벤트를 처리합니다.
                    // 뒤로가기는 각 웹뷰의 세션 스토리지에 담아둔 값을 이용하여
                    // 처리하는 방식으로 변경합니다.
                    try {

                        var refererChk;
                        var back_referer = [];

                        if(typeof Storage !== "undefined") {
                            refererChk = window.sessionStorage.getItem("back_referer");

                            // 웹 스토리지에 해당 정보가 존재하지 않는다면
                            // 기존의 뒤로가기 로직으로 처리합니다.
                            if(refererChk === null) {

                                if(platform == 'iphone' || platform == 'ipad') {
                                    if (back_referer_val == "") {
                                        location.href = document.referrer;
                                    } else {
                                        location.href = back_referer_val;
                                    }
                                } else {
                                    if (back_referer_val == "") {
                                        window.history.back();
                                    } else {
                                        location.href = back_referer_val;
                                    }

                                }
                            } else if(refererChk.constructor === "String".constructor) {
                                // 웹 스토리지에 정보가 존재한다면
                                back_referer = JSON.parse(refererChk);

                                if(back_referer.length > 0) {
                                    // 뒤로가기 설정 값이 1개밖에 없다면
                                    if(back_referer.length <= 2) {
                                        var url = back_referer[back_referer.length-1].referer_url;
                                        back_referer.splice(1, 1);
                                        window.sessionStorage.setItem("back_referer", JSON.stringify(back_referer));

                                        // 뒤로가기가 상세화면에서 목록으로 가는 내용이라면
                                        if(url.indexOf("searchInnerList") > -1) {
                                        	window.history.back();

                                        } else {
                                            // 그외의 항목은 뒤로가기 동작으로 처리합니다.
                                        	location.href = url;
                                        }

                                    } else {
                                        var url = back_referer[back_referer.length-2].referer_url;
                                        back_referer.splice(back_referer.length-1);
                                        window.sessionStorage.setItem("back_referer", JSON.stringify(back_referer));

//                                        if(url.indexOf("searchInnerList") > -1 || url.indexOf("searchOuterList") > -1) {
//                                        	window.history.back();
//                                        } else {
                                            // 그외의 항목은 뒤로가기 동작으로 처리합니다.
                                        	location.href = url;
//                                        }

                                    }
                                }
                            }
                        }
                    } catch(ex) {
                        // 뒤로가기 처리 중 에러가 발생하면 기존로직으로 우회합니다.
                        if(platform == 'iphone' || platform == 'ipad') {
                            if (back_referer_val == "") {
                                location.href = document.referrer;
                            } else {
                                location.href = back_referer_val;
                            }
                        } else {
                            if (back_referer_val == "") {
                                window.history.back();
                            } else {
                                location.href = back_referer_val;
                            }

                        }
                    }
                }
                break;
            case "forward":
                {
                    history.go(1);
                }
                break;
            case "mypage":
                {
                    // 웹 로그 수집
                    try {
                        //_trk_clickTrace('EVT', '^하단메뉴^마이페이지');
                    } catch(_e) {
                    }
                    location.href = '/mylist/list.do';
                }
                break;
            case "chatbot":
            {
            	//alert('오픈 준비중 입니다.');
            	openChatBot();
            }
            break;
        }
    } catch (ex) {
        //$(".spinner").hide();
    }
}

// 디바이스ID 받는다.(index.jsp)
function returnDeviceId(deviceId){

    //alert("Device ID: " + deviceId);
	uuid = deviceId;

	//PUSH ID
	setTimeout(function() {
		getPushId();
	}, 500);
}

// 푸시아이디 요청한다.(index.jsp)
function getPushId(){
	var platform = getPlatform();
	if(platform == 'iphone' || platform == 'ipad'){
		//location.href = 'http://mdl2017.nanet.go.kr:7000/jsCall?Function=getPushId';
	    location.href = 'http://mdl.nanet.go.kr:7000/jsCall?Function=getPushId';
	}else if(platform == 'android' || platform == 'android_tablet'){
		window.MainActivity.getPushId();
	}
}

// 푸시아이디 받는다.(index.jsp)
function returnPushId(pId){
	pushId = pId;
}

/**
 * 원문 뷰어 실행 기능(PDF)
 */
 function viewPdfExec(s_cn,s_db_name,s_title_info,s_tts,query,item_no) {
     // 웹로그
     try{
         _trk_flashEnvView('_TRK_G2=1', '_TRK_PNC='+s_cn, '_TRK_PNC_NM='+s_title_info);
     } catch(ex) {
     }

     //setClientType();
     var platform = getPlatform();
     if(platform.indexOf('android') > -1 || platform.indexOf('iphone') > -1 || platform.indexOf('ipad') > -1){
     	try{
     		getDocUrl(userId, s_cn, '', 'E', s_db_name, s_title_info, query, '', s_tts, 'N', item_no);
     	} catch(ex) {
     		alert('원문보기 서비스는 앱을 통하여 이용하시기 바랍니다.');
         }
     } else {
          // alert('PC에서는 사용하실 수 없습니다.');
     	alert('원문보기 서비스는 앱을 통하여 이용하시기 바랍니다.');
     }
  }

 /**
  * 원문 다운로드 실행
  */
 function downPdfExec(s_cn,s_db_name,s_type,s_filepath,s_filelink,s_ctcode,s_bookcount,s_pubyear,s_pagecount,s_tocfn,s_cr,s_viewerVer,s_title_info,s_author_info,s_publisher,s_hj2hg,s_tts,s_download,s_can_download,s_policy_id,s_policy_db_code,s_policy_user_code,s_Cd,s_isext1,query){

     // 웹로그
     try{
         _trk_flashEnvView('_TRK_G2=1', '_TRK_PNC='+s_cn, '_TRK_PNC_NM='+s_title_info);
     } catch(ex) {
     }


     setClientType();
     var platform = getPlatform();
     if(platform.indexOf('android') > -1 || platform.indexOf('iphone') > -1 || platform.indexOf('ipad') > -1){

         //로그인 상태 체크
         var url = '/mobile/checkLogin.do?deco=non';
         $.ajax({
             type: "POST",
             data_type : "text",
             url: url,
             async:false,
             success:function(data){
             	try {
	                    if(data != null && data != ''){
	                        var userid = data.split(',')[0].replace(/\s/gi, '');
	                        //var no_seq = data.split(',')[1].replace(/\s/gi, '');
	                        //var user_class = data.split(',')[2].replace(/\s/gi, '');
	                        //var user_class2 = data.split(',')[3].replace(/\s/gi, '');

	                        d_cn = s_cn;
	                        d_vol = '';
	                        d_docType = s_db_name;
	                        d_title = s_title_info;
	                        d_author = s_author_info;
	                        d_publisher = s_publisher;
	                        d_query = query;
	                        d_uuid = getUUID();

	                        //Wifi체크
	                        // checkWifi('D', callback);
	                        checkWifi('D', callback2);
	                    }
             	} catch(ex) {
             		alert('다운로드 서비스는 앱을 통하여 이용하시기 바랍니다.');
             	}

             },
             beforeSend:function(){},
             error:function(e){},
             complete : function(data){}
         });

     }else{
         // alert('PC에서는 사용하실 수 없습니다.');
     	alert('다운로드 서비스는 앱을 통하여 이용하시기 바랍니다.');
     }
 }

//다운로드(내서재에서 다운로드 아이콘을 클릭했을 때)
 function startDownloadFile(cn, vol, db_code, docType, title, query, rasmblyId){
     setClientType();

     d_cn = cn;
     d_vol = vol;
     d_db_code = db_code;
     d_docType = docType;
     d_title = title;
     d_query = query;
     d_rasmbly_id = rasmblyId;

     //Wifi체크
     checkWifi('D', callback);
 }

//다운로드한 파일 목록 정보를 받는다.
 function returnDownloadFileList(result, functionName, isDownloaded){
     if(functionName == 'addDownloadFile'){
         //다운로드 목록을 만든다.
         //setImgList(result);

         //이미 다운받은 파일인지 체크
         if(result != null && result != ''){
             var data = JSON.parse(result);
             var list = data.filelist;

             var isExist = false;
             for(var i=0; i<list.length; i++){
                 var cn =  list[i].cn;
                 var vol = list[i].vol;
                 var download_complete = list[i].download_complete;

                 if(cn == "${cn}" && vol == "${docInfo.collection_id}" && download_complete == 'Y'){
                     isExist = true;
                     break;
                 }
             }

             //alert("${cn}"+"\n"+"${docInfo.collection_id}"+"\n"+db_code+"\n"+"${docInfo.book_type}"+"\n"+"${docInfo.book_name}"+"\n"+"${query}"+"\n"+"${docInfo.rasmbly_id}");

             if(!isExist){
                 //파일다운로드를 시작
                 startAddDownloadFile("${cn}", "${docInfo.collection_id}", db_code, "${docInfo.book_type}", "${docInfo.book_name}", "${query}", "${docInfo.rasmbly_id}");
             }else{
                 if(confirm('이미 다운로드한 문서입니다.\n다시 다운로드 하시겠습니까?')){
                     //파일다운로드를 시작
                     startAddDownloadFile("${cn}", "${docInfo.collection_id}", db_code, "${docInfo.book_type}", "${docInfo.book_name}", "${query}", "${docInfo.rasmbly_id}");
                 }
             }
         }else{
             //파일다운로드를 시작
             startAddDownloadFile("${cn}", "${docInfo.collection_id}", db_code, "${docInfo.book_type}", "${docInfo.book_name}", "${query}", "${docInfo.rasmbly_id}");
         }
     }else if(functionName == 'setDownloadFileList'){
         setImgList(result);

     }else if(functionName == 'deleteDownloadFiles'){
         $('#current_page').val(1);
         var flag = $('#flag').val();
         if(flag == 0){
             setImgList(result);
         }else{
             setDataList(result);
         }
     }else if(functionName == 'download'){

         setTimeout(function() {
        	 hideDownloadPopup();
             alert(((isDownloaded == true || isDownloaded == 'true' || isDownloaded == 'YES') ? "다운로드가 완료되었습니다." : "다운로드중 오류가 발생하였습니다."));

             if((isDownloaded == true || isDownloaded == 'true' || isDownloaded == 'YES') && type == 2){
                 //location.href = '/mobile/myLibClik.do?type=1';
             }
         }, 1000);


         //목록 갱신
         /*
         $('#current_page').val(1);
         var flag = $('#flag').val();
         if(flag == 0){
             setImgList(result);
         }else{
             setDataList(result);
         }
         */
         //다운로드 프로그레스 팝업을 숨긴다.


     }else if(functionName == 'getDownloadFileList'){
    	 alert('getDownloadFileList');
         //로컬에서 받은 다운로드 목록이 없으면 서버에서 정보를 가져온다.
         if(result == null || result == ''){
             fileList = '';
         }else{
             var jsonData = JSON.parse(result);
             fileList = jsonData.filelist;
         }

         if(fileList.length <= 0){
             var url = "/mobile/myLibOnSvr.do?deco=non";
             var params = "db_code=" + db_code;

             $.ajax({
                 type: "POST",
                 data_type : "json",
                 url: url,
                 data: params,
                 async:false,
                 success:function(data){
                     if(data != null && data != ''){
                         setDownloadFileList("${user_id}", data, db_code);

                     }else{
                         setImgList(data);
                     }
                 },
                 beforeSend:function(){},
                 error:function(e){
                     alert(e.responseText);
                 }
             });
         }else{
             setImgList(result);
         }
     }
 }

//원문 다운로드
 var imgPdfYn = "";
 function mobileProccess(cn, vol, seq){

		var userSeq = "";
		$.ajax({
	        type: "GET",
	        dataType: "text",
	        url: "/ezpdfdrm/jsp/getUserInfo.jsp",
	        data: "",
	        async: false,
	        success:function(data){
	        	if(data != null && data != ''){
	        		var userInfo = data.split(",");
	        		//userId = userInfo[0];
	        		userSeq = userInfo[1];
	        		//userClass = userInfo[2];
	        		//userClass2 = userInfo[3];
	        	}
	        },
	        beforeSend:function(){},
	        error:function(e){}
	    });

		if(userSeq == null || userSeq == ""){
			//parent.hideDownloadPopup(); // INZENT
		    hideDownloadPopup();

			alert('다운로드 서비스에 장애가 발생하였습니다.\n관리자(02-788-4250)에게 문의하시기 바랍니다.');
			return;
		}

		var platform = getPlatform();
		if(platform.indexOf("android") > -1){
			platform = 'android';
		}else if(platform.indexOf("iphone") > -1 || platform.indexOf("ipad") > -1){
			platform = 'ios';
		}

		//다운로드 로그 등록 및 푸시발송
		/*
		var url = "/mobile/insertViewFreeLog.do";
		var params = "log_se_code=D&cn=" + log_cn + "&collection_id=dl&rasmbly_dta_se_code=" + log_docType + "&title=" + escape(encodeURIComponent(log_title))
		    + "&srchwrd=" + escape(encodeURIComponent(log_query)) + "&rasmbly_id=" + log_rasmbly_id + "&platform=" + platform + "&pushId=" + pushId
		    + "&deco=non"; // INZENT parent.pushId;

		$.ajax({
	        type: "POST",
	        data_type : "text",
	        url: url,
	        data: params,
	        async: false,
	        success:function(data){},
	        beforeSend:function(){},
	        error:function(e){},
	        complete : function(data){
	        	//로그용 변수 초기화
	        	log_cn = "";
	        	log_vol = "";
	        	log_db_code = "";
	        	log_docType = "";
	        	log_title = "";
	        	log_query = "";
	        	log_rasmbly_id = "";

	        	//다운로드를 요청한다.
	        	//if(platform == 'android' || platform == 'ios'){
	        		download(dldrm_serverUrl + "/ezpdfdrm/jsp/download.jsp?path=mobile/" + userSeq + "/" + seq, user_id, cn, vol, "E", imgPdfYn);
	        	//}

	        	imgPdfYn = "";
	        	// INZENT
				parent.setTextDownloadPopup("다운로드 중입니다.<br>잠시만 기다려 주시기 바랍니다.", "", "");
				//parent.showDownloadPopup();

				//setTextDownloadPopup("다운로드 중입니다.<br>잠시만 기다려 주시기 바랍니다.", "", "");
	        	showDownloadPopup();
	       	}
		});
		*/

		download(dldrm_serverUrl + "/ezpdfdrm/jsp/download.jsp?path=mobile/" + userSeq + "/" + seq, 'NO_LOGIN', cn, vol, "E", imgPdfYn);
		parent.setTextDownloadPopup("다운로드 중입니다.<br>잠시만 기다려 주시기 바랍니다.", "", "");
		showDownloadPopup();
	}

	//앱에서 원문을 다운로드하기 위해 요청한다.
	function download(path, user_id, cn, vol, db_code, img_pdf_yn){
		//현재 img pdf일경우 N으로 반환됨(Y:text pdf, N:img pdf)
		if(img_pdf_yn == null || img_pdf_yn == "" || img_pdf_yn == "Y")
			img_pdf_yn = "N";
		else
			img_pdf_yn = "Y";

		//del_yn, img_pdf_yn 상태 업데이트
		/*
		var url = "/mobile/updateDownloadInfo.do";
		var params = "user_id=" + user_id + "&del_yn=N&collection_id=dl&db_code=" + db_code + "&cn=" + cn + "&vol=" + vol + "&img_pdf_yn=" + img_pdf_yn + "&deco=non";

		$.ajax({
	        type: "POST",
	        data_type : "json",
	        url: url,
	        data: params,
	        async:false,
	        success:function(data){
	        	var jsonData = JSON.parse(data);
	        	if(jsonData.result == 'success'){
	        		var platform = getPlatform();
	            	if(platform == 'iphone' || platform == 'ipad'){
	            	    // DEPLOY-SERVER
	            	    location.href = 'https://https://dl20.nanet.go.kr:2443/jsCall?Function=download&path='+escape(encodeURIComponent(path))+'&user_id='+escape(encodeURIComponent(user_id))+'&cn='+escape(encodeURIComponent(cn))+'&vol='+escape(encodeURIComponent(vol))+'&db_code='+escape(encodeURIComponent(db_code))+'&img_pdf_yn='+escape(encodeURIComponent(img_pdf_yn));
	            	    // DEV-SERVER
	            	    //location.href = 'http://mdl2017.nanet.go.kr:7000/jsCall?Function=download&path='+escape(encodeURIComponent(path))+'&user_id='+escape(encodeURIComponent(user_id))+'&cn='+escape(encodeURIComponent(cn))+'&vol='+escape(encodeURIComponent(vol))+'&db_code='+escape(encodeURIComponent(db_code))+'&img_pdf_yn='+escape(encodeURIComponent(img_pdf_yn));
	            	}else if(platform == 'android' || platform == 'android_tablet'){
	            		window.MainActivity.download(path, escape(encodeURIComponent(user_id)), cn, vol, db_code, img_pdf_yn);
	            	}
				}else{
				    // INZENT
					hideDownloadPopup();

					alert('다운로드 서비스에 장애가 발생하였습니다.\n관리자(02-788-4250)에게 문의하시기 바랍니다.');
				}
	        },
	        beforeSend:function(){},
	        error:function(e){
	            // INZENT
	        	hideDownloadPopup();

	        	alert('다운로드 서비스에 장애가 발생하였습니다.\n관리자(02-788-4250)에게 문의하시기 바랍니다.');
	        }
		});
		*/


		var platform = getPlatform();
    	if(platform == 'iphone' || platform == 'ipad'){
    	    // DEPLOY-SERVER
    	    location.href = 'https://https://dl.nanet.go.kr/jsCall?Function=download&path='+escape(encodeURIComponent(path))+'&user_id='+escape(encodeURIComponent(user_id))+'&cn='+escape(encodeURIComponent(cn))+'&vol='+escape(encodeURIComponent(vol))+'&db_code='+escape(encodeURIComponent(db_code))+'&img_pdf_yn='+escape(encodeURIComponent(img_pdf_yn));
    	    // DEV-SERVER
    	    //location.href = 'http://mdl2017.nanet.go.kr:7000/jsCall?Function=download&path='+escape(encodeURIComponent(path))+'&user_id='+escape(encodeURIComponent(user_id))+'&cn='+escape(encodeURIComponent(cn))+'&vol='+escape(encodeURIComponent(vol))+'&db_code='+escape(encodeURIComponent(db_code))+'&img_pdf_yn='+escape(encodeURIComponent(img_pdf_yn));
    	}else if(platform == 'android' || platform == 'android_tablet'){
    		window.MainActivity.download(path, escape(encodeURIComponent(user_id)), cn, vol, db_code, img_pdf_yn);
    	}
	}

/*
 * 다운로드 팝업 텍스트 세팅
 */
function setTextDownloadPopup(text1, text2, text3){
    if(text1 == null || text1 == "null" || text1 == undefined || text1 == "undefined") text1 = "";
    if(text2 == null || text2 == "null" || text2 == undefined || text2 == "undefined") text2 = "";
    if(text3 == null || text3 == "null" || text3 == undefined || text3 == "undefined") text3 = "";

    $("#downloadText").html(text1);
    $("#sizeText").html(text2);
    $("#timeText").html(text3);
}

/**
 * 모바일앱 실행 로그
 */
function regAppLog (log_se_code, app_os, app_os_ver, app_ver) {
	var url = '/mobile/regAppLog.do';
	var params ='log_se_code=' + log_se_code + '&app_os=' + app_os + '&app_os_ver=' + app_os_ver + '&app_ver=' + app_ver;
	$.ajax({
        type: "POST",
        data_type : "text",
        url: url,
        data: params,
        async:false,
        success:function(data){
        	console.log("success");
        },
        error:function(request,status,error){
//			alert("error");
       }
	})
}

/**
 * 원문보기 로그(외부연계)
 */
function regAppViewLog (cn,vol,userId,userClass,userClass2,collection_id,rasmbly_dta_se_code,log_se_code) {
	var url = '/mobile/regAppViewLog.do';
	var params ='cn=' + cn + '&vol=' + vol + '&userId=' + userId + '&userClass=' + userClass + '&userClass2=' + userClass2
	 + '&collection_id=' + collection_id + '&rasmbly_dta_se_code=' + rasmbly_dta_se_code + '&log_se_code=' + log_se_code;
	$.ajax({
        type: "POST",
        data_type : "text",
        url: url,
        data: params,
        async:false,
        success:function(data){
        	console.log("success");
        },
        error:function(request,status,error){
//			alert("error");
       }
	})
}

$(document).on("click", ".bannerM .item", function(e){
	if($(this).find('div').attr("class") == 'membershipM') {
		//TODO 로그인 여부 체크하여 분기처리
		if($(this).find('div').attr('data-value') == 'Y'){
			$('.open').click();
		}else{
			location.href = "/login.do?retUrl=/m/main.do";
		}
	} else if($(this).find('div').attr("class") == 'ebook'){
		location.href = "/mobile/ebook.do";
	} else if($(this).find('div').attr("class") == 'ebook kyobo'){
//		var blankUrl = "https://nanet.dkyobobook.co.kr";
//		window.open(blankUrl, "_blank");
		
//		var url = "https://nanet.dkyobobook.co.kr/frontapi/mmbrLnkg.ink";
//		var url = "https://clik.nanet.go.kr/api/ebookKyobo.do";
//		var form = document.ebookKyoboForm;
//		url += "?user_id="+$(form).find('#user_id').val();
//		url += "&user_name="+$(form).find('#user_name').val();
//		url += "&user_type="+$(form).find('#user_type').val();
//		url += "&user_type_name="+$(form).find('#user_type_name').val();
//		url += "&libraryCode="+$(form).find('#libraryCode').val();
//		alert(url);
//		window.open(url, "_blank");
//		var url = "https://nanet.dkyobobook.co.kr/frontapi/mmbrLnkg.ink";
//		var form = document.ebookKyoboForm;
//		window.open("", "ebookKyoboForm");
//		form.action = url;
//		form.method = "post";
//		form.target ="ebookKyoboForm";
//		form.submit();
//		return false;
		
	} else if($(this).find('div').attr("class") == 'seat') {
		var seatUrl = "";
		
		if($(this).find('div').attr('data-value').replace('^#^','') == ''){
			location.href = "/login.do?retUrl=/m/main.do";
		} else {
			if($(this).find('div').attr('data-value').split('^#^')[2] != null && $(this).find('div').attr('data-value').split('^#^')[2] == "ULK") {
				alert("도서관 방문 당일 디지털정보센터 키오스크에서 예약 가능합니다.");
				return;
				
				seatUrl = "http://seat.nanet.go.kr:7700/login_library?id="+$(this).find('div').attr('data-value').split('^#^')[0]+"&password="+$(this).find('div').attr('data-value').split('^#^')[1];
				
			} else if($(this).find('div').attr('data-value').split('^#^')[2] != null && $(this).find('div').attr('data-value').split('^#^')[2] == "BNK") {
				seatUrl = "http://seat-busan.nanet.go.kr:7700/login_library?id="+$(this).find('div').attr('data-value').split('^#^')[0]+"&password="+$(this).find('div').attr('data-value').split('^#^')[1];
			}
			
			window.open(seatUrl, "_blank");
		}
		
		/*alert("도서관 방문 당일 디지털정보센터 키오스크에서 예약 가능합니다.");
		//alert('코로나19 경보단계가 격상됨에 따라 2020년11월24일부터 별도 공지시까지 임시 휴관합니다.');
		return;

		if($(this).find('div').attr('data-value').replace('^#^','') == ''){
			location.href = "/login.do?retUrl=/m/main.do";
		} else {
			var seatUrl = "http://seat.nanet.go.kr:7700/login_library?id="+$(this).find('div').attr('data-value').split('^#^')[0]+"&password="+$(this).find('div').attr('data-value').split('^#^')[1];
			window.open(seatUrl, "_blank");
		}*/

		// Post 방식 (앱에서 post 방식으로 전송안되서 위에 Get 방식으로 사용
		/*var seatUrl = "http://seat.nanet.go.kr:7700/login_library";
		var frmObj = $('<form>',{'id':'frmSeat','action':seatUrl,'method':'POST','target':'_blank'});
		var inputObj1 = $('<input>',{'name':'id','value':$(this).find('div').attr('data-value').split('^#^')[0]});
		var inputObj2 = $('<input>',{'name':'password','value':$(this).find('div').attr('data-value').split('^#^')[1]});

		frmObj.append(inputObj1);
		frmObj.append(inputObj2);

		$('#frmSeat').remove();
		$(document.body).append(frmObj);
		$('#frmSeat').submit();*/
	}
});

//검색어 호출
function returnSearchWord(keyword){
	if(keyword != null && keyword != '') {
	    $("#searchQuery").val(decodeURIComponent(keyword));
        $("#searchForm").submit();

		var platform = getPlatform();
		if(platform == 'android' || platform == 'android_tablet'){
			window.MainActivity.confirmSearchWord();
		}
	}
}