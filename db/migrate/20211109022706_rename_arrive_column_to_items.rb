class RenameArriveColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :arrive, :arrive_id
  end
end
