class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :building, :string, null: true
  end
end
