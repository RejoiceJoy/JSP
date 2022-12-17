//타이틀 셋팅
function titleSet(uri) {
	if(uri.indexOf('/searchInnerList.do') > -1){
		document.title="국회도서관 소장자료검색";
	} else if(uri.indexOf('/searchOuterList.do') > -1) {
		document.title="국회도서관 외부기관검색";
	} else if(uri.indexOf('/searchInnerDetail.do') > -1) {
		document.title="국회도서관 소장자료상세";
	} else if(uri.indexOf('/searchOuterDetail.do') > -1) {
		document.title="국회도서관 외부기관상세";
	} else if(uri.indexOf('/SearchCoopMap.do') > -1) {
		document.title="국회도서관 가까운 도서관 찾기";
	} else if(uri.indexOf('/nadlList.do') > -1) {
		document.title="국회도서관 공지사항";
	} else if(uri.indexOf('/nadlDetail.do') > -1) {
		document.title="국회도서관 공지사항 상세보기";
	} else if(uri.indexOf('/faq/list.do') > -1) {
		document.title="국회도서관 자주묻는질문";
	} else if(uri.indexOf('/collection.do') > -1) {
		document.title="국회도서관 테마컬렉션";
	} else if(uri.indexOf('/htmlView.do') > -1) {
		document.title="국회도서관 책방통신";
	} else if(uri.indexOf('/galleryView.do') > -1) {
		document.title="국회도서관 디지털수장고";
	} else if(uri.indexOf('/bookView.do') > -1) {
		document.title="국회도서관 북큐레이션";
	}
}

function searchTitleSet(){
	document.title="국회도서관 소장자료검색 "+$("ol.secondDepth > .on > a").attr("title");
}