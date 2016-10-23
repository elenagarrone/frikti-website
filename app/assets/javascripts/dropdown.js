(function(){
  //Burger
  $("#nav-toggle").on( "click", function() {
    $(this).toggleClass( "active" );
    $('.nav-links-list').toggleClass( "active" );
    $('.header').toggleClass( "active" );
  });

  //Regular
  var activeClass = 'is_active';
  var listClass = 'has-submenu';
  var dropdownBtnClass = 'dropdown_btn';
  var target = $('.' + listClass).find('a');
  var $instances = $(target);
  $instances.each(function(i, el){
    var index = i;
    var $el = $(el);
    var text = $el.text();
    var btnClass = $el.attr('class');
    var $listItem = $($el.closest('.' + listClass));
    $listItem.attr({'id': 'dropdown_menu_' + i, 'class': 'dropdown_menu'});
    $listItem.find('> a').remove();
    $listItem.prepend('<button role="button" id="ddbutton_' + i +'" class="' + dropdownBtnClass + ' ' + btnClass + '">' + text + '</button>');
    $listItem.on('click', '.' + dropdownBtnClass, function(){
      var $this = $(this);
      $this.closest('li').toggleClass(activeClass);
    });
  });
})();
