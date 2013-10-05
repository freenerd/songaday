# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

load_datepicker = ->
  $('div.datepicker').datepicker({
      startDate: "12/01/2013",
      endDate: "12/25/2013"
  }).on('changeDate', (e) ->
    $('input#song_publish_at').val(e.date.toString())
  )

$(document).on('page:load', load_datepicker)
$ -> load_datepicker()
