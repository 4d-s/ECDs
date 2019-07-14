class CreateOrderItemHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_item_histories do |t|
      t.integer :order_id
      t.string :item_name
      t.integer :item_price
      t.text :image_id
      t.integer :order_item_count

      t.timestamps
    end
  end
end
