$(document).ready ->
  
  $("header li").hover -> 
  
    # in, see if we can fit the highlight under it
    # if not, get it close, and animate it please
    center_point_this = this.offsetLeft + ($(this).width() / 2)
    highlight = $("#highlight")
        
    $("#highlight p").html( $(this).data("album-name") )
    $("#highlight a").attr( "href", $(this).parent().attr("href") )
                
    $("#highlight article").css("background", "url(" + $(this).data("album-flickbook") + ") no-repeat")
    
    highlight.data("active", true)
    highlight.fadeIn()
    
    # align left edge
    if ( center_point_this - 146)  < 0
      highlight.animate({ left: this.offsetLeft }, {duration : 300, queue:false, easing:"linear" }  );
      return
    
    # align right
    if  (center_point_this + 146)  > $(document).width()
      highlight.animate({ left: this.offsetLeft + ( $(this).width() / 2 )- highlight.width() }, { duration : 300, queue:false, easing:"linear" }  );
      return
    
    # center under
    highlight.animate({ left: center_point_this - ( highlight.width() / 2 ) }, { duration : 300, queue:false, easing:"linear" }  );

  , ->
    # out, make a timeout and then fade out the hightlighter
    highlight = $("#highlight")
    highlight.data("active", false)
    
    setTimeout ->
      if highlight.data("active") == false 
        highlight.fadeOut()
    , 3000
    
      
  $("#highlight").hover ->
    # make hightlight stay active
    highlight = $(this)
    highlight.data("active", true)
    
  , ->
    # make hightlight dissapear
    highlight = $(this)
    highlight.data("active", false)
    setTimeout ->
      if highlight.data("active") == false 
        highlight.fadeOut()
    , 3000
    
  $("#highlight article").mousemove -> 
    # get mousex, turn it into relative locations
    # then get a number between 1-10 to represent
    # how far along it is
    
    mouse_x = event.pageX - (document.getElementById("highlight").offsetLeft + 12)
    index = Math.round( ( mouse_x / 260) * 9 )
    $(this).css("background-position-y", index   * -146)