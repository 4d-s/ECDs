class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :stock
      t.integer :price
      t.boolean :is_sold
      t.text :image_id
      t.integer :order_count, default: 0
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps
    end
  end
end
