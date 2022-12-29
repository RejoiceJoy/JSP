var currentKeywordSeq = -1;
$(function(){
    $('#query').on('keydown', function(e){


        if($('#autoLayer').is(':visible') && (e.keyCode == 40 || e.keyCode == 38)){

            var resultLength = $('#autoLayer').find('li').length;
            if(e.keyCode == 40){
                if(currentKeywordSeq < resultLength-1){
                    currentKeywordSeq = currentKeywordSeq + 1;
                }else {
                    return false;
                }
            }else if(e.keyCode == 38){
                if(currentKeywordSeq > 0){
                    currentKeywordSeq = currentKeywordSeq - 1;
                }else{
                    return false;
                }
            }


            console.log(currentKeywordSeq);
            $('#autoLayer').find('li>a').css('background', '#fff');
            var _li = $('#autoLayer').find('li').eq(currentKeywordSeq);
            _li.find('a').css('background', '#f0f0f0');
            $('#query').val(_li.text());
        }

    });
});

