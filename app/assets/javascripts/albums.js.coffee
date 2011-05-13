# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  preview = $("#preview-url")
  $('#url_url').keyup ->
    current_value = $.trim @value
    if current_value is ''
      preview.hide().attr 'src', ''
    else
      preview.show().attr 'src', current_value
