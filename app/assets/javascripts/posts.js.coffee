# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#pins').imagesLoaded ->
    $('#pins').masonry
      itemSelector: '.box'
      isResizable: true


      jQuery ->
        if $('.pagination').length
          $(window).scroll ->
            url = $('.pagination .next_page').attr('href')
            if url && $(window).scrollTop() > $(document).height() - $(window).height() - 800
              $('.pagination').text("Loading...")
              $.getScript(url)
          $(window).scroll()
 

      $("nav li ul").hide().removeClass "fallback"
      $("nav li").hover (->
       $("ul", this).stop().slideDown 100
       return
      ), ->
        $("ul", this).stop().slideUp 100
        return

 