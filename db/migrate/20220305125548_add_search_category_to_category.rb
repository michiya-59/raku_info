class AddSearchCategoryToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :search_category, :string
  end
end
