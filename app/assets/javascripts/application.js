// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .


// var update_chars_left;

// update_chars_left = function(max_length, target_input, display_element) {
//   var text_length;
//   text_length = target_input.value.length;
//   if (text_length >= max_length) {
//     target_input.value = target_input.value.substring(0, max_length);
//     return display_element.html("0");
//   } else {
//     return display_element.html(max_length - text_length);
//   }
// };

// $(document).ready(function() {
//   $("#micropost_content").keyup(function() {
//     return update_chars_left(140, $("#micropost_content")[0], $("#chars_left"));
//   });
//   return update_chars_left(140, $("#micropost_content")[0], $("#chars_left"));
// });