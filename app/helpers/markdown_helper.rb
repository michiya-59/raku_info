# frozen_string_literal: true

module MarkdownHelper
  REDCARPET_OPTIONS = {
    autolink: true, # <>で囲まれてなくてもリンクを認識
    no_intra_emphasis: true, # 単語中の強調を認識しない
    fenced_code_blocks: true, # フェンスのあるコードブロックを認識
    strikethrough: true, # ~ 2つで取り消し線
    superscript: true, # ^ の後ろが上付き文字
    tables: true, # テーブルを認識
    underline: true,  # 斜線(* *)
    highlight: true,  # ハイライト(== ==)
    quote: true, # 引用符(" ")
    footnotes: true, # 脚注( ^[1] )

    xhtml: true,               # xhtml タグ出力(Render::XHTMLでは常に有効)
    lax_html_blocks: true,     # HTMLブロックの上下の空行を不要にする
    lax_spacing: true,         # HTMLブロックの空行を不要にする
    no_images: true,           # img 要素を無効化
    no_links: true,            # a 要素を無効化
    no_styles: true,           # style 要素を無効化
    safe_links_only: true,     # 安全なリンクだけ出力
    disable_indented_code_blocks: true, # 通常のマークダウンを認識しない。(行の先頭にある4つのスペースを持つテキストのコードブロックへの変換を無効化
    escape_html: true,         # HTMLタグをエスケープ。最優先され、:no_styles、:no_links、:no_images、:filter_html などは、削除ではなく、エスケープされる。
    with_toc_data: true,       # リンクの許可のため、出力HTMLのヘッダーにHTMLアンカー追加する
    prettify: true,            # prettyprintクラスを<code>google-code-prettifyタグに追加。
    link_attributes: true # リンクに追加する追加属性のハッシュ。
  }.freeze

  def markdown(body)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(html_render, REDCARPET_OPTIONS)
    markdown.render(body).html_safe
  end

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = 'md' if language == '言語名'
      CodeRay.scan(code, language || 'md').div
    end
  end
end
