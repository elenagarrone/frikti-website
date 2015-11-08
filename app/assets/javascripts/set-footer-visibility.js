$(function(){
  var pathname = window.location.pathname;
  var path = "/";
  var path2 = "/homepage";

  if((pathname !== path) && (pathname !== path2)) {
    $('footer').toggleClass('visible');
  } 
});