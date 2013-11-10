# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#setlist').sortable
    axis: 'y'
    #update: ->
    #  $.post($(this).data('update-url'), $(this).sortable('serialize'))
  
  $('ul#modal_songs > li').click ->
    addSongToSetlist this

  addSongToSetlist = (song) =>
    $('#setlist').append song
    $(song).append "<button class='close remove_song pull-right' type='button'>&times;</button>"
    $(song).unbind 'click'
    $('.remove_song').click ->
      removeSongFromSetlist(this.parentNode)

  removeSongFromSetlist = (song) =>
    $('this > .remove_song').unbind 'click'
    $('this > .remove_song').remove
    $('#modal_songs').append song
