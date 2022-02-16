function simple_tooltip(target_items, name){
  $(target_items).each(function(i){
    $("body").append("<div class='"+name+"' id='"+name+i+"'><p>"+$(this).attr('title')+"</p></div>");
    var my_tooltip = $("#"+name+i);
    if($(this).attr("title") != "" && $(this).attr("title") != "undefined" ){
    $(this).removeAttr("title").mouseover(function(){
          my_tooltip.css({opacity:1.0, display:"none"}).fadeIn(0);
    }).mousemove(function(kmouse){
        var window_w = window.innerWidth;
        var marginTop = 53;
        if(window_w <= 540){
          var marginLeft = -110;
        }else{
          var marginLeft = 0;
        }
        var size = 10;
        var speed = 200;

        var offsetTop = $(this).offset().top + marginTop;
        var offsetLeft = $(this).offset().left + marginLeft;

        my_tooltip.css({
          "top": offsetTop,
          "left": offsetLeft,
          "font-size": size + "px"
        }).show(speed);
    }).mouseout(function(){
        my_tooltip.css({left:"-9999px"});
    });
    }
  });
}

window.addEventListener('DOMContentLoaded', function(){
  simple_tooltip(".template_part button","template_pop");
});

window.addEventListener('DOMContentLoaded', function(){
  simple_tooltip(".template_part2 button","template_pop2");
});