# frozen_string_literal: true

# 新規ユーザ
User.create(name: "みちや", email: "m.n.tennis.0509@icloud.com", password: "michiya0509", password_confirmation: "michiya0509")

# カテゴリーの値
Category.create(name: 'Ruby', search_category: 'ruby')
Category.create(name: 'Rails', search_category: 'rails')
Category.create(name: 'ColdFusion', search_category: 'coldfusion')
Category.create(name: 'SQL', search_category: 'sql')
Category.create(name: 'その他', search_category: 'others')

#テスト投稿
Article.create(title: "今日の反省の書簡", body: "test", tag_name: "テスト,ruby,Rails,sql,ColdFusion", category_id: 1, user_id: 1)
Article.create(title: "テンプレートテンプレートテンプレートColdFusionの関数でよく使うもの", body: "test", tag_name: "ColdFusion,coldfusion,コールドフィージョン,便利関数", category_id: 2, user_id: 1)
Article.create(title: "テンプレートテンプレートColdFusionの関数でよく使うもの", body: "test", tag_name: "テスト,ruby,Rails,sql,ColdFusion", category_id: 3, user_id: 1)
Article.create(title: "テンプレート", body: "test", tag_name: "テンプレート", category_id: 4, user_id: 1)
Article.create(title: "テスト", body: "test", tag_name: "テスト", category_id: 5, user_id: 1)
