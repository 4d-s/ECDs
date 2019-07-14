class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :item_id
      t.string :gunre_name

      t.timestamps
    end
  end
end
