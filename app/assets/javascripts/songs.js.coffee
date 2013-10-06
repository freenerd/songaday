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

SC.initialize({
  client_id: "88ef6bd7ee19fb167b24bb5102695586"
})

setupSoundCloudCallback = ->
  $("#song_soundcloud_url").blur( ->
    SC.oEmbed($("#song_soundcloud_url").val(), {"maxheight": 166, "show_comments": false, "color": "000000"}, (oembed) ->
      if(oembed)
        console.log(oembed)
        $("div#soundcloud-widget").html(oembed['html'])
        $("input#song_artist").val(oembed['author_name'])
        $("input#song_title").val(oembed['title'].split(" by ")[0])
      else
        $("div#soundcloud-widget").html("<p>There is an error with this track, please check url</p>")
    )
  )

$(document).on('page:load', setupSoundCloudCallback)
$ -> setupSoundCloudCallback()

setupSoundCloudWidget = ->
  if($("#song_soundcloud_url"))
    SC.oEmbed($("#song_soundcloud_url").val(), {"maxheight": 166, "show_comments": false, "color": "000000"}, (oembed) ->
      if(oembed)
        $("div#soundcloud-widget").html(oembed['html'])
    )

$(document).on('page:load', setupSoundCloudWidget)
$ -> setupSoundCloudWidget()

setupSoundCloudListWidgets = ->
  $("p.sc-url").each( (index, element) ->
    SC.oEmbed($(element).text(), (oembed) ->
      if(oembed)
        $(element).siblings("div.sc-widget").html(oembed['html'])
        $(element).parents("li").css("background", "url(" + oembed['thumbnail_url'] + ")")
    )
  )

$(document).on('page:load', setupSoundCloudListWidgets)
$ -> setupSoundCloudListWidgets()

