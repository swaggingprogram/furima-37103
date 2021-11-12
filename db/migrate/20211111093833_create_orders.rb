class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :port, null: false
      t.string :building, null: false
      t.string :tel, null: false
      t.integer :prefecture_id, null:false
      t.references :record, null: false, foreign_key: true
      t.timestamps
    end
  end
end