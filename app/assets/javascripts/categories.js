//= require gmap
$(window).scroll(function(){

  var wScroll = $(this).scrollTop();

  $('.logo').css({
    'transform' : 'translate(0px, '+ wScroll /5 +'%)'
  });

  $('.back-bird').css({
    'transform' : 'translate(0px, '+ wScroll /4 +'%)'
  });

  $('.fore-bird').css({
    'transform' : 'translate(0px, -'+ wScroll /50 +'%)'
  });

  if(wScroll > $('.clothes-pics').offset().top - ($(window).height() / 1.2)) {

      $('.clothes-pics li').each(function(i){

        setTimeout(function(){
          $('.clothes-pics li').eq(i).addClass('is-showing');
          }, 150 * (i+1));
      });
   }

   if(wScroll > $('.clothes-pics').offset().top - ($(window).height() * 10)) {

      $('.clothes-pics li').each(function(i){

        setTimeout(function(){
          $('.clothes-pics li').eq(i).addClass('is-showing');
          }, 150 * (i+1));
      });
   }

});
