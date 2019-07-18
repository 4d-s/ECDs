class Disc < ApplicationRecord
	belongs_to :item, inverse_of: :discs
	has_many :song, inverse_of: :discs
	accepts_nested_attributes_for :songs
end
