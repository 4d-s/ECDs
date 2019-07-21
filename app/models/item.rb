class Item < ApplicationRecord
	belongs_to :genre
	belongs_to :artist, foreign_key: :id
	belongs_to :label
	attachment :image
	has_many :discs, inverse_of: :item
  accepts_nested_attributes_for :discs
	has_many :item_selects, dependent: :destroy

  # ALLOWED_PARAMS = [:name, :description, :price]


  #検索用メソッド（空欄で検索した場合は、一覧を表示する）
	def self.Item_search(keyword)
		if keyword
       		where(['item_name LIKE ?', "%#{keyword}%"])
   		else
       		all
   		end
	end

  def self.Artist_search(keyword)
    if keyword
      joins(:artist).where(['artist_name LIKE ?', "%#{keyword}%"])
   	else
       all
   	end
	end
	def self.Song_search(keyword)
		if keyword
      where(['song_name LIKE ?', "%#{keyword}%"])
   	else
      all
   	end
	end
end
