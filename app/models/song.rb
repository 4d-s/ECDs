class Song < ApplicationRecord
	belongs_to :disc, inverse_of: :songs
	validates :song_number, presence: true
	validates :song_name, presence: true
end
