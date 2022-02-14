window.addEventListener('load', () =>{
  const template_btn = document.getElementById('template');
  
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
});