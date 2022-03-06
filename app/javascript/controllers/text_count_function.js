$(function(){
  //カウントするフィールドを監視
  $("#note_explanation").keyup(function(){
    //現在入力されている文字
    var text = $(this).val();
    //正確にカウントするため改行コード削除
    text = text.replace((new RegExp("\r\n","g")),"");
    text = text.replace((new RegExp("\n","g")),"");
    //現在の文字数
    var count = text.length;
    //管理者が設定した上限文字数
    var moji_limit = $(this).attr("limit");
    //文字数をリアルタイムの表示
    $("#moji_suu").text(count);
    //処理分け
    if(count == 0){
      //字を消して0文字となった場合。
      $("#moji_suu").text("0");
    } else if(count > moji_limit) {
      //上限文字数を超えたら赤色表示
      $("#moji_suu").css("color", "red");
      $('#article_btn').prop('disabled',true);
      $('#back_btn').prop('disabled',true);
      $("#article_btn").css("opacity", "0.4");
      $("#back_btn").css("opacity", "0.4");
      $("#validates_error").css("display", "flex");
    } else {
      //文字数が範囲内なら色を戻す
      $("#moji_suu").css("color", "");
      $('#article_btn').prop('disabled',false);
      $("#article_btn").css("opacity", "1");
      $('#back_btn').prop('disabled',false);
      $("#back_btn").css("opacity", "1");
      $("#validates_error").css("display", "none");
    }
  });
});

$(function(){
  //カウントするフィールドを監視
  $("#tag_name").keyup(function(){
    //現在入力されている文字
    var text = $(this).val();
    console.log(text);
    //,をカウントしている
    var tags_count =  (text.match(new RegExp(',', "g")) || []).length;
    //処理分け
    if(tags_count >= 5){
      $('#article_btn').prop('disabled',true);
      $("#article_btn").css("opacity", "0.4");
      $("#validates_tags_error").css("display", "flex");
    } else {
      $('#article_btn').prop('disabled',false);
      $("#article_btn").css("opacity", "1");
      $("#validates_tags_error").css("display", "none");
    }
  });
});
