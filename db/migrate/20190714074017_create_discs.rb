class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :item_id
      t.integer :disc_number

      t.timestamps
    end
  end
end
