class Song < ApplicationRecord
	ALLOWED_PARAMS = [:id, :disc_id, :song_number, :song_name]
	belongs_to :disc, inverse_of: :songs
end
