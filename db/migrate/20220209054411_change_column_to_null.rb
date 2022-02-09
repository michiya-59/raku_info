class ChangeColumnToNull < ActiveRecord::Migration[7.0]
  def up
    # Not Null制約を外す場合　not nullを外したいカラム横にtrueを記載
    change_column_null :tags, :count, true
  end

  def down
    change_column_null :tags, :count, false
  end
end
