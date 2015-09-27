$(function() {
  var currentHref = window.location.href;
  var $link = $('.nav-links-list li a');

  $link.each(function(){
    if($(this).prop('href') === currentHref) {
      $(this).toggleClass('current');
    }
  })
});  