class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.integer :count, null: false

      t.timestamps
    end
    add_index :tags, :name
  end
end
