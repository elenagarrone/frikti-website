$(document).ready(function() {
  $("a.fancybox").fancybox();

  $("a[href='/portfolio']").on('click', function(){
    location.href = location.origin + '/portfolio'
  });
});