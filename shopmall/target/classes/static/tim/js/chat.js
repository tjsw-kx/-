function onlsss(){
    setTimeout(()=>{
        $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight + 1000) ;
    },100)
}
//表情包的展现与隐藏
$('.ExP').on('click',function(){
    if($('.emjon').css('display')=='none'){
        $('.emjon').show();
    }else{
        $('.emjon').hide();
    }
})
//发送表情
$('.emjon li').on('click',function(){
    var imgSrc=$(this).children('img').attr('src');
    $('.emjon').hide();
    $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight );
})
