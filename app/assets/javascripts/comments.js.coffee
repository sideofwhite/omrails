# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 800
        $('.pagination').text("Loading...")
        $.getScript(url)
    $(window).scroll()


$(document).ready ->
  $("textarea").autosize()
  $(".modal").autosize()
  $("#myModal").autosize()
  


     
$(document).on "page:load", ->
  window["rangy"].initialized = false




      
    


      




        