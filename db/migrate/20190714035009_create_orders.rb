class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :order_last_name
      t.string :order_first_name
      t.string :order_postal_code
      t.string :order_address
      t.string :order_phone_number
      t.integer :payment
      t.integer :total
      t.integer :delivery_status

      t.timestamps
    end
  end
end
