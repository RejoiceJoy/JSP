
$(function () {
	
	// 연관어 분포 데이타 확인하기
	getTopicCountSize = function() {
		var chartFlag = $('#chartFlag').val();
		$('#chartFlag').val('count');
		var chartListPage = $('#chartListPage').val();
		
		$.ajax({
			type:"POST",
			url:"/chartResult.do",
			data: $('#frmChartTopic').serialize(),
			dataType: "json",
			crossDomain: true,
			
			success:function( data ) {
				var chartStatus = $('#search_graph').css('display');
				if(data.totalSize <= 0) {
//					alert("연관검색어가 없습니다.");
//					$('#search_graph_box').hide();
				} 
				else {
					//alert("연관검색어 " + data.totalSize + "건");
					/*if(chartStatus == 'none') {
						$('.btn_viewmap').slideDown();
					}*/
				}
			},
			error:function( xhr, ajaxOption, thrownError ) {
				console.log( "getTopicCount : 사용중 오류가 발생 하였습니다.\n다시 시도해 주시기 바랍니다." );
				console.log(thrownError);
			}
		});
		$('#chartFlag').val(chartFlag);
		$('#chartListPage').val(chartListPage);
	};
	
	// 연관어 분포 데이타 가져오기
	getTopicCount = function() {
		var listPage = $('#chartListPage').val();
		$('#chartListPage').val(1);
		$('#chart').empty();
		$.ajax({
			type:"POST",
			url:"/chartResult.do",
			data: $('#frmChartTopic').serialize(),
			dataType: "json",

			success:function( data ) {
				if(data.totalSize > 0) {
					$("#search_graph_box").show();
					showTopicCountBubble(data);
				} else {
					alert("연관검색어가 없습니다.");
					$('#search_graph_box').hide();
				}
			},
			error:function( xhr, ajaxOption, thrownError ) {
				console.log( "getTopicCount : 사용중 오류가 발생 하였습니다.\n다시 시도해 주시기 바랍니다." );
				console.log(thrownError);
				$('#search_graph_box').hide();
			}
		});
		$('#chartListPage').val(listPage);
	};
	
	// 표의 연관어를 통한 검색
	searchTopicCount = function(term){
		var chartTerm = $('#chartTerm').val();
		if(term.indexOf('(') > 0) {
			term = term.substring(0, term.indexOf('('));
		}
		$('#search_input_text').val(chartTerm + ' ' + term);
        $('.m_search_bt').trigger('click');
        
        /*var chartTerm = $('#chartTerm').val();
		if(term.indexOf('(') > 0) {
			term = term.substring(0, term.indexOf('('));
		}
    	window_detailsearch_chart('list');
    	$('#SELECT_1').val('SU');
    	$('#inputKey_1').val(chartTerm + ' ' + term);
    	$('#oSELECT_1').val('OR');
    	$('#SELECT_2').val('TI');
    	$('#inputKey_2').val(chartTerm + ' ' + term);
    	$('#inputKey_3').val('');
    	goSearchDetail();*/
	};

});
