class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_katakana, :string
    add_column :users, :first_name_katakana, :string
    add_column :users, :street_address, :string
    add_column :users, :postal_code, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_deleted, :boolean
  end
end
