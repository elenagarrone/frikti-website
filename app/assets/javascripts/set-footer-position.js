$(function(){
  var pathname = window.location.pathname;
  var path = "/packages_and_prices";

  if(pathname === path) {
    $('.footer.visible').toggleClass('relative');
  } 
});