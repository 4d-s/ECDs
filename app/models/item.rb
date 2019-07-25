class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :artist
  belongs_to :label
  attachment :image
  has_many :discs, inverse_of: :item
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
  has_many :item_selects, dependent: :destroy

  validates :item_name, presence: true
  validates :stock, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみが使用できます" }
  validates :price, presence: true, numericality: { only_integer: true }

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
    search_artist = joins(:artist)
    search_result = search_artist.select("items.*").where(['artist_name LIKE ?', "%#{keyword}%"])
  else
   all
 end
end

def self.Song_search(keyword)
  if keyword
    search_song = joins(discs: :songs)
    search_result = search_song.select("items.*").where(['song_name LIKE ?', "%#{keyword}%"])
  else
    all
  end
end
end