class RemoveItemNameFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :item_id, :integer
  end
end
