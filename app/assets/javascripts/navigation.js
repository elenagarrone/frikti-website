$(function() {
  var currentHref = window.location.href;
  var navUlSelector = 'nav-links-list';
  var $nav = $('.' + navUlSelector);
  var $links = $($nav.find('a'));
  $links.each(function(i, el){
    var $el = $(el);
    var linkHref = $el.prop('href');
    if(linkHref === currentHref) {
      var $li = $($el.closest('li:not(".curtain_li")'));
      $li.toggleClass('current');
    }
  });
});
