class Disc < ApplicationRecord
	belongs_to :item, inverse_of: :discs
	has_many :songs, inverse_of: :disc
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
	validates :disc_number, presence: true, length: { maximum: 25 }, numericality: { only_integer: true }
end
