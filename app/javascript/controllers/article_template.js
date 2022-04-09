window.addEventListener('load', () =>{
  const font_bold_btn = document.getElementById('font_bold'); // テキスをト太文字にする
  const italics_btn = document.getElementById('italics'); // テキストを斜体にする
  const strikethrough_btn = document.getElementById('strikethrough'); // テキストを打ち消し線にする
  const heading_btn = document.getElementById('heading'); // テキストを見出しにする
  const quote_btn = document.getElementById('quote'); // 引用テキストを挿入
  const code_btn = document.getElementById('code'); // コードを挿入
  const link_btn = document.getElementById('link'); // リンクを挿入
  const list_btn = document.getElementById('list'); // リストの挿入
  const number_list_btn = document.getElementById('number_list'); // 番号リストの挿入
  const dash_btn = document.getElementById('dash'); // 水平線を挿入
  const template_btn = document.getElementById('template'); // テンプレートの挿入
  const markdown_show_preview = document.getElementById('markdown_show_preview'); // プレビューボタン
  var select = "" ;

  // テキストを太文字にする
  font_bold_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "**ボールドテキスト**"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = "**" + edit_text + "**" // 選択している文字に太文字になる**を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });

  // テキストを斜体にする
  italics_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "_イタリックテキスト_"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = "_" + edit_text + "_" // 選択している文字に斜体になる_を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });

  // テキストを打ち消し線にする
  strikethrough_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "~~打ち消し線~~"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = "~~" + edit_text + "~~" // 選択している文字に打ち消し線になる~~を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });

  // テキストを見出しにする
  heading_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "### ヘディングのテキスト"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = "### " + edit_text // 選択している文字に見出しになる###を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });

  // 引用テキストを挿入
  quote_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "> 引用テキスト"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = "> " + edit_text // 選択している文字に引用テキストになる> を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });

  // コードを挿入
  code_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "```言語名\nソースコードを入力\n```"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = "```言語名\n" + edit_text + "\n" + "```" // 選択している文字がコードになる```を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });

  // リンクを挿入
  link_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "[リンク内容](url)"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = "[" + edit_text + "]" + "(url)" // 選択している文字にリンクになる[]()を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });

  // リストの挿入
  list_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "- リスト"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = "- " + edit_text // 選択している文字に太文字になる- を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });

  // 番号リストの挿入
  number_list_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "0. 番号リスト"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = "0. " + edit_text // 選択している文字に番号リストになる0. を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });

  // 水平線を挿入
  dash_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    select = window.getSelection().toString().length;
    if(select == "0"){
      textarea.value += "---"
    }else{
      var pos      = textarea.selectionStart; // 選択している文字の先頭の位置取得
      var before   = textarea.value.substr(0, pos); //⓵ テキストエリアにある全体の文字の先頭から選択している文字よりも前を取得
      var after    = textarea.value.substr(pos); // テキストエリアにある全体の文字の先頭から選択している文字の後を取得
      var edit_text = after.substr(0, select); //⓶ 選択している文字を取得
      edit_text = edit_text + "\n" + '---' // 選択している文字に水平線になる---を文字列結合している
      var after_new = after.substr(select); //⓷ afterの文字列から選択した文字より後を取得している
      console.log(pos)
      textarea.value = before + edit_text + after_new // ⓵ + ⓶ + ⓷をしている
    }
  });
  
  template_btn.addEventListener('click', () =>{
    const textarea = document.getElementById('note_explanation');
    console.log(textarea)
    textarea.value = "\
### 解決したいこと \n\
ここに解決したい内容を記載してください。\n\
\n\
例）\n\
Ruby on RailsでQiitaのようなWebアプリをつくっています。\n\
記事を投稿する機能の実装中にエラーが発生しました。\n\
解決方法を教えて下さい。\n\
\n\
### 発生している問題・エラー \n\
``` \n\
出ているエラーメッセージを入力 \n\
``` \n\
\n\
例） \n\
\n\
``` \n\
NameError (uninitialized constant World) \n\
``` \n\
\n\
または、問題・エラーが起きている画像をここにドラッグアンドドロップ \n\
\n\
### 該当するソースコード \n\
```言語名 \n\
ソースコードを入力 \n\
``` \n\
\n\
例） \n\
\n\
```ruby \n\
def greet \n\
  puts Hello World \n\
end \n\
``` \n\
\n\
### 自分で試したこと \n\
ここに問題・エラーに対して試したことを記載してください。\
";

  });
  markdown_show_preview.addEventListener('click', () => {
    var text_area = document.getElementById('note_explanation');
    var text_area_markdown_preview = document.getElementById('template2');

    if(markdown_show_preview.innerText == "プレビュー"){
      text_area.style.display = 'none';
      text_area_markdown_preview.style.display = 'inline-block';
      markdown_show_preview.innerText = '記事を見る'
    }else if(markdown_show_preview.innerText == "記事を見る"){
      text_area.style.display = 'inline-block';
      text_area_markdown_preview.style.display = 'none';
      markdown_show_preview.innerText = 'プレビュー'
    }
  });

});

function test(){
  var obj = document.getSelection();
  alert(obj);
}