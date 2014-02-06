# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#cart').show('blind', 1000) if $('#cart tr').length > 1
  $('.store .entry > img').click ->
    $(this).parent().find(':submit').click()
