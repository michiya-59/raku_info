$(function(){
  $(".popup_help").mouseover(function() {
    var window_w = window.innerWidth;
    var marginTop = 0;
    if(window_w <= 540){
      var marginLeft = -110;
    }else{
      var marginLeft = 76;
    }
    var size = 10;
    var padding = 5;
    var marginBottom = 0;
    var height = 45;
    var speed = 130;
    var popupObj = $(".popup_help_window");

    if (!popupObj.length) {
      popupObj = $("<p/>").addClass("popup_help_window").appendTo($("body"));
    }

    popupObj.html($(this).attr("data-message"));

    var offsetTop = $(this).offset().top + marginTop;

    var offsetLeft = $(this).offset().left + marginLeft;

    popupObj.css({
      "top": offsetTop,
      "left": offsetLeft,
      "font-size": size + "px",
      "padding": padding + "px",
      "margin": marginBottom,
      "height": height + "px"
    }).show(speed);

  }).mouseout(function() {
    $(".popup_help_window").text("").hide("fast");
  });
});

$(function(){
  $(".popup_help").mouseover(function() {
    var window_w = window.innerWidth;
    var marginTop = 0;
    if(window_w <= 540){
      var marginLeft = -110;
    }else{
      var marginLeft = 76;
    }
    var padding = 5;
    var marginBottom = 0;
    var height = 45;
    var size = 10;
    var speed = 130;
    var popupObj = $(".popup_help_window");

    if (!popupObj.length) {
      popupObj = $("<p/>").addClass("popup_help_window").appendTo($("body"));
    }

    popupObj.html($(this).attr("data-message"));

    var offsetTop = $(this).offset().top + marginTop;
    var offsetLeft = $(this).offset().left + marginLeft;

    popupObj.css({
      "top": offsetTop,
      "left": offsetLeft,
      "font-size": size + "px",
      "padding": padding + "px",
      "margin": marginBottom,
      "height": height + "px"
    }).show(speed);
  }).mouseout(function() {
    $(".popup_help_window").text("").hide("fast");
  });
});