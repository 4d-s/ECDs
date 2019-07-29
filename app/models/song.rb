class Song < ApplicationRecord
	belongs_to :disc, inverse_of: :songs
	validates :song_number, presence: true, length: { maximum: 3 }, numericality: { only_integer: true }
	validates :song_name, presence: true, length: { maximum: 50 }
end
