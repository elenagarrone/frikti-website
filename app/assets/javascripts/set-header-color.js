$(function(){
  var pathname = window.location.pathname;
  var path = "/";
  var path2 = "/homepage";

  path == path2

  if(pathname !== path) {
    $('.header').toggleClass('add-color');
  }
});