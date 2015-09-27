$(function() {
  var user_signed_in = $('#user_signed_in').length;
  if (user_signed_in != 0) {
    $('#thumbnails').sortable({
      update: function( event, ui ) { 
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
      }
    });
  }
}); 