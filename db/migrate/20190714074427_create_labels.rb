class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.integer :item_id
      t.string :label_name

      t.timestamps
    end
  end
end
