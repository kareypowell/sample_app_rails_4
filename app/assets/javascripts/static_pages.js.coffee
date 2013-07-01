# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# Count down characters for micropost from 140 indicating to the 
# user how many more characters are left.
update_chars_left = undefined
update_chars_left = (max_length, target_input, display_element) ->
  text_length = undefined
  text_length = target_input.value.length
  if text_length >= max_length
    target_input.value = target_input.value.substring(0, max_length)
    display_element.html "0"
  else
    display_element.html max_length - text_length

ready = ->
  $("#micropost_content").keyup ->
    update_chars_left 140, $("#micropost_content")[0], $("#chars_left")

  update_chars_left 140, $("#micropost_content")[0], $("#chars_left")

$(document).ready(ready)
$(document).on('page:load', ready)