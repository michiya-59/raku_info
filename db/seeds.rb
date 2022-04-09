# frozen_string_literal: true

# 新規ユーザ
User.create(name: 'みちや', email: 'm.n.tennis.0509@icloud.com', password: 'michiya0509',
            password_confirmation: 'michiya0509')

# カテゴリーの値
Category.create(name: 'Ruby', search_category: 'ruby')
Category.create(name: 'Rails', search_category: 'rails')
Category.create(name: 'ColdFusion', search_category: 'coldfusion')
Category.create(name: 'SQL', search_category: 'sql')
Category.create(name: 'その他', search_category: 'others')
