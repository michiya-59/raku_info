class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :tag_name, null: false
      t.integer :category_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
