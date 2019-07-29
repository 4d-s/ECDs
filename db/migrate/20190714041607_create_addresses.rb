class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :postal_code
      t.string :street_address
      t.string :phone_number

      t.timestamps
    end
  end
end
