class CreateItemSelects < ActiveRecord::Migration[5.2]
  def change
    create_table :item_selects do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :item_count

      t.timestamps
    end
  end
end
