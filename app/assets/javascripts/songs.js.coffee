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

getParameterByName = (name) ->
    regex = new RegExp("[\\?&]" + name + "=([^&#]*)")
    results = regex.exec(location.search)
    return null if(!results)
    return decodeURIComponent(results[1].replace(/\+/g, " "))

transferOrderNumber = ->
  order_number = getParameterByName("order_number")
  $("input#song_order_number").val(order_number) if(order_number)

$(document).on('page:load', transferOrderNumber)
$ -> transferOrderNumber()
