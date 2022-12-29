function fnCurrentMenuCheck(){

    var currentUrl = window.location.pathname;
    var href = '';
    var li = '';

    $('.side-menu li').each(function(){
        li = $(this);
        href = li.attr('data-url');

        if(href == undefined || href == ''){
            href = '';
        }

        if(href.indexOf(currentUrl) > -1){
            li.addClass('on');

            if(li.parent().hasClass('depth3')){
                li.parent().children().attr('style', 'display: block;');
            }
        }

    });

}


function fnEnglishMenuCheck(){

    var currentUrl = window.location.pathname;
    var href = '';
    var li = '';

    $('.leftMenu li').each(function(){
        li = $(this);
        href = li.attr('data-url');

        if(href == undefined || href == ''){
            href = '';
        }

        if(href.indexOf(currentUrl) > -1){
            li.addClass('on');

            if(li.parent().hasClass('depth3')){
                li.parent().children().attr('style', 'display: block;');
            }
        }
    });

}




