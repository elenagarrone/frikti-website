// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui.min
//= require jquery_ujs
//= require picturefill
//= require fancybox
//= require twitter/bootstrap
//= require carousel
//= require sortable-thumb
//= require navigation
//= require alert
//= require fancybox-init
//= require set-header-color
//= require set-footer-visibility
//= require set-footer-position
//= require turbolinks
//= require_tree .
//= require('browserslist');
//= require browserslist

$("#nav-toggle").on( "click", function() {
  $(this).toggleClass( "active" );
  $('.nav-links-list').toggleClass( "active" );
});