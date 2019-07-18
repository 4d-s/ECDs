class RemoveItemNameFromLabeles < ActiveRecord::Migration[5.2]
  def change
    remove_column :labels, :item_id, :integer
  end
end
