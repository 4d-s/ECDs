class Disc < ApplicationRecord
	belongs_to :item, inverse_of: :discs
	has_many :songs, inverse_of: :disc
	accepts_nested_attributes_for :songs
end
