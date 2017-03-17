// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require 'foundation/foundation' 
//= require foundation
//= require_directory .

$(function(){ $(document).foundation(); });

window.addEventListener("load", function(){

	var load_screen = document.getElementById("load_screen");

	document.body.removeChild(load_screen);

});

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

// (function() {
//   $(function() {
//     return $('.clickable').on('click', function() {
//     	window.location.href = 'https://refitme.com';
//       return console.log('element clicked');
//     });
//   });

// }).call(this);

