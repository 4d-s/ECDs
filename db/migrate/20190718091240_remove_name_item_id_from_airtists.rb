class RemoveNameItemIdFromAirtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :airtists, :artist_name, :integer
  end
end
