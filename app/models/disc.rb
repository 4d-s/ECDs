class Disc < ApplicationRecord
	belongs_to :item
	has_many :song, dependent: :destroy
end
