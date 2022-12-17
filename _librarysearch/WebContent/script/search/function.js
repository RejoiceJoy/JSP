$(document).ready(function(){

	//내서재 저장
	$('#myLibrary2 .save').click(function(){
		var formData = $("#myListForm").serialize();

		$.ajax({
			type: "POST",
			url: "/mylist/insertitem.do",
			data: formData,
			cache:false,
			success: function(data) {
				if(data != null){
					if(data.resultCode == 0){
						$.modal.close();
						$('#favoriteLib #itemInput').empty();
						$("#favoriteLib").modal();
						resetFavoriteLib();
						var inputVal = "";
						for(var i=0; i<data.items.length; i++){
							inputVal += "<input type=\"hidden\" name=\"item\" title=\""+data.items[i]+"\" value="+data.items[i]+">";
						}

						$('#favoriteLib #itemInput').append(inputVal);
					} else {
						$.modal.close();
						$("#alert").modal();
					}
				} else {
					console.log("book Save API FAIL");
				}
			},
			error: function() {
				console.log("book Save API FAIL");
			}
		});
	});

	$("#myLibrary2 .close").click(function() {
		$.modal.close();
	});

	$("#favoriteLib .reset").click(function() {
		resetFavoriteLib();
	});

	$('input[name=listPrivacy]').click(function() {
		if(this.value == '3') {
			$("#msg").hide();
		} else {
			$("#msg").show();
		}
	});

	//새로운 서재 저장
	$('#favoriteLib .newSave').click(function(){
		if($('input[name=chkOk]').val() !="1")
		{
			alert("중복체크를 해야 합니다.");
			$('input[name=chkOk]').focus();
			return false;
		}

		if($('input[name=listName]').val() == ""){
			alert("서재는 필수 항목입니다.");
			return false;
		}

		var formData = $("#myListNewForm").serialize();

		$.ajax({
			type: "POST",
			url: "/mylist/insert.do",
			data: formData,
			cache:false,
			success: function(data) {
				if(data != null){
					if(data.resultCode == 0){
						$('input[name=listName]').after("   <p class=\"red error\">내서재는 필수값 입니다.</p>");
					} else {
						$.modal.close();
						$("#alert").modal();
					}
				} else {
					console.log("book Save API FAIL");
				}
			},
			error: function() {
				console.log("book Save API FAIL");
			}
		});
	});

	//내보내기
	$('#exportPop .save').click(function(){
		var chkRadio = $('input[name="exportForm"]:checked').val();
		var frm = document.searchExportForm;
		var action = frm.action;
		if(chkRadio == "html"){
			$('input[name="contentHtml"]').val(getHtmlDiv());
			frm.action = "/result/search/createHtml.do";
			frm.submit();
			frm.action = action;
			$.modal.close();
		} else if(chkRadio == "email") {
			var email = $('input[name="email"]', frm).val();
			if(email == ""){
				alert("이메일은 필수 항목 입니다.");
				return false;
			}

			$('input[name="contentHtml"]').val(getHtmlDiv());

			frm.action = "/result/search/getMailBody.do";
			frm.submit();
			$.modal.close();

		} else if(chkRadio == "print") {
			$('input[name="contentHtml"]').val(getHtmlDiv());
		} else if(chkRadio == "view") {
			$('input[name="contentHtml"]').val(getHtmlDiv());
		} else if(chkRadio == "endNote") {
			return false;
		} else if(chkRadio == "riss") {
			$('input[name="cnArr"]').val(getCnDiv());
			frm.action = "/result/search/rissSave.do";
			frm.submit();
			frm.action = action;
			$.modal.close();
		} else if(chkRadio == "excel") {
			$('input[name="cnArr"]').val(getCnDiv());
			frm.action = "/result/search/excelSave.do";
			frm.submit();
			frm.action = action;
			$.modal.close();
		} else {
			alert("error");
			return false;
		}

		$('input[name="handlerType"]').val(chkRadio);

		if(chkRadio != 'html' && chkRadio != 'email' && chkRadio != 'excel' && chkRadio != 'riss'){
			var rWin = window.open("about:blank", "export");
			frm.target="export";
			frm.submit();
		}
		$.modal.close();
	});

	$("#btnChk").click(function() {

		if($('input[name=listName]').val() == ""){
			alert("서재는 필수 항목입니다.");
			return false;
		}

		var formData = "listName="+$('input[name=listName]').val();

		$.ajax({
			cache:false,
			type: "POST",
			url: "/mylist/check_dup_listname.do",
			data: formData,
			success: function(msg) {
				if(msg != null){
					if(msg.msg=='dup') { $("#resultMsg").html('<font color=red>중복된 이름입니다.</font>'); $('input[name=listName]').focus();return;}
					else {
						$("#resultMsg").html('<font color=blue>사용가능</font>');
						$('input[name=chkOk]').val('1');
					}
				}
			},
			error: function() {
				console.log("collection Save API FAIL");
			}
		});
	});

});

function resetFavoriteLib() {
	$('input[name=listName]').val("");
	$('input[name=description]').val("");
	$("#open2").prop("checked", true);
	$("#favoriteLib .error").remove();
	$("#msg").hide();
}

function removeMsg() {
	$("#favoriteLib .error").remove();
}

//내보내기 레이아웃 Open
function fn_export() {
	if($("input:checkbox[name=chk]:checked").length < 1){
		alert("선택한 항목이 없습니다");
		return false;
	}
	$("#email").val('');
	$(".title_init").val('');
	$(".exportPop .scope").hide();
	$(".exportPop .inputWrap").hide();
	$(".exportPop .txt").hide();
	$(".exportPop").removeClass("email");
	$(".exportPop").removeClass("info");
	$(".exportPop").removeClass("default");
	$("#ef1").click();

	$("#exportPop").modal();
}

function getCnDiv(){

	var cnArr = "";
	var cnLength = $("input:checkbox[name=chk]:checked").length;
	$("input:checkbox[name=chk]:checked").each(function(i) {
//		var parent = $(this).closest('li').clone();
		//추후 수정
		
//		var cn = $(parent).find('a').attr("href").substr(30,14);
		var cn = $(this).val();
		
		
		cnArr += cn;
		if(cnLength - 1 > i) { cnArr += ","; }
    });
	//console.log(cnArr);
	return cnArr;
}

function getHtmlDiv(){

	var reForm = "";

	var spanSt = {
			'float': 'left',
			'min-width': '20px',
			'margin-right': '5px',
			'line-height': '21px'
	};
	var aSt = {
			'display': 'block',
			'margin-left': '35px',
			'text-decoration': 'none',
			'color': '#292929',
			'font-size': '16px',
			'line-height': '21px'
	};
	var ulSt = {
			'margin': '10px 0 0 35px',
			'padding': '0',
			'list-style': 'none'
	};
	var liSt = {
			'display': 'inline-block',
			'margin-right': '5px',
			'padding-right': '6px',
			'color': '#a1a1a1',
			'font-size': '14px',
			'line-height': '21px',
			'background': 'url(bar.gif) no-repeat right center'
	};

	$("input:checkbox[name=chk]:checked").each(function(i) {
		var parent = $(this).closest('li').clone();
		$(parent).find('.dataInfo').remove();
		$(parent).find('a').attr("href", "https://dl.nanet.go.kr/search/searchInnerDetail.do?controlNo="+$(this).val());

		$(parent).find('a img').remove();
		$(parent).find('.cart').remove();
		$(parent).find('.dStyle1').remove();
		$(parent).find('.dStyle2').remove();
		//st 추가
		$(parent).find('span').css(spanSt);
		$(parent).find('a').css(aSt);
		$(parent).find('ul').css(ulSt);
		$(parent).find('li').css(liSt);
		reForm += "<li style=\"margin: 0; padding: 14px 10px 9px; border-bottom: 1px solid #d7d7d7; position: relative; clear: both;\">"+$(parent).html()+"</li>";
		//alert(reForm);
    });
	//console.log(reForm);
	return reForm;
}

/**
 * 검색 상세를 프린트한다.
 * @returns
 */
function printDetail() {
	var contentHtml = $(".printDetail").clone();

	$('input[name="contentHtml"]').val($(contentHtml).html());
	$('input[name="handlerType"]').val("detailPrint");

	var form = $("#exportForm");
	var printWin = window.open("about:blank", "export");

	form.attr("target", "export");
	form.submit();
}


//메일 body
function getMailBody(){

	var formData = $("#searchExportForm").serialize();

	$.ajax({
		type: "POST",
		url: "/result/search/getMailBody.do",
		data: formData,
		cache:false,
		success: function(data) {
			if(data != null){
				//메일 보내기
				sendMail(data.mail_query, data.subject, data.contents);
			} else {
				console.log("getMailBody FAIL");
			}
		},
		error: function() {
			console.log("getMailBody FAIL");
		}
	});
}

//메일 보내기 분리
function sendMail(query, subject, contents){

	var formData = {
					"from_name":"국회도서관",
					"from_email":"nalhome@nanet.go.kr",
					"userid":"nadl",
					"recv_name":"관리자",
					"recv_db":"12",
					"recv_qry":query,
					"categoryid":"My Library",
					"subject":subject,
					"body":contents
					};

	$.ajax({
		type: "POST",
		url: "http://ems.nanet.go.kr:8000/ex/send_ex_nanet_utf.jsp",
		data: formData,
		dataType : 'json',
		success: function(data) {
			if(data != null){
				alert(data);
			} else {
				console.log("send email suc noDATA");
			}
		},
		error: function() {
			console.log("send email FAIL");
		}
	});
}

//엑셀멀티 다운로드
// 내보내기 > 엑셀다운로드는 현재 페이징으로 조회 된 검색 결과만 다운로드 되고 있음.
// 아래 구현된 엑셀 다운로드는 페이징 여부 상관 없이 조회된 모든 검색 결과를 엑셀 파일로 다운로드 한다.
// 성능상 이슈로 검색결과 개수는 제한이 필요함 (현재 300건 미만일 경우 엑셀 다운로드 가능)
//function fn_export_excel() {
//	var frm = document.searchExportForm;
//	var action = frm.action;
//
//	var cnArr = "";
//	$("input[name=cnArrs]").each(function(i) {
//		cnArr += $(this).val() + ",";
//    });
//	cnArr = cnArr.substring(0, (cnArr.length-1));
//
//	$('input[name="cnArr"]').val(cnArr);
//	frm.action = "/result/search/excelSaveUserSet.do";
//	frm.submit();
//	frm.action = action;
//}


function fn_export_excel() {
	var frm = document.searchExportForm;
	var action = frm.action;

	frm.action = "/search/searchInnerExcel.do";
	frm.submit();
	frm.action = action;
}
