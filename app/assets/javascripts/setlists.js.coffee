# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#setlist').sortable
    axis: 'y'
    #update: ->
    #  $.post($(this).data('update-url'), $(this).sortable('serialize'))
  
  $('ul.modal_songs > li').click ->
    $('#setlist').append this
