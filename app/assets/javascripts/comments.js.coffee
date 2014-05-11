# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#pin').imagesLoaded ->
    $('#pin').masonry
      itemSelector: '.boxtwo'


      $(document).ready ->
        $("textarea").autosize()


     

       $(document).on "page:load", ->
         window["rangy"].initialized = false

     $ ->
     $(".myButton").hide()
     $(".inputBody").keyup ->
       val = $(this).val()
       if val.length > 0
        $(this).parent().siblings(".myButton").show()
       else
        $(this).parent().siblings(".myButton").hide()
       return

      return




      




        