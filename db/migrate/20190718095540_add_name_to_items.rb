class AddNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :genre_id, :integer
    add_column :items, :artist_id, :integer
    add_column :items, :label_id, :integer
  end
end
