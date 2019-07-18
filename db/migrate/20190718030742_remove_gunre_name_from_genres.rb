class RemoveGunreNameFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :gunre_name, :string
  end
end
