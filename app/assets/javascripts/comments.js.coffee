# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#pin').imagesLoaded ->
    $('#pin').masonry
      itemSelector: '.boxtwo'


      $(document).ready ->
        $("textarea").autosize()


      $(".wysihtml5").each (i, elem) ->
       editor = $(elem).wysihtml5(
        "font-styles": false #Font styling, e.g. h1, h2, etc. Default true
        emphasis: true #Italics, bold, etc. Default true
        lists: false #(Un)ordered lists, e.g. Bullets, Numbers. Default true
        html: false #Button which allows you to edit the generated HTML. Default false
        link: true #Button to insert a link. Default true
        image: true #Button to insert an image. Default true,
        color: false #Button to change color of font
       )
       editor.composer.element.addEventListener "keyup", myOnChange
       editor.on "aftercommand:composer", myOnChange

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


      




        