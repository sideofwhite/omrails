# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

if ("users" is window.location.pathname.split('/')[1]) and ("notifications" == window.location.pathname.split('/')[3])
  window.setTimeout ->
    $.ajax '/users/read_all_notifications' ,
        type: "post"
        dataType: "json"
        beforeSend: (xhr) ->
          xhr.setRequestHeader "X-CSRF-Token", $("meta[name=\"csrf-token\"]").attr("content")
        cache: false
  , 1


jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Loading...")
        $.getScript(url)
    $(window).scroll()