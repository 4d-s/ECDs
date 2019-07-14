class CreateSelectItems < ActiveRecord::Migration[5.2]
  def change
    create_table :select_items do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :item_count

      t.timestamps
    end
  end
end
