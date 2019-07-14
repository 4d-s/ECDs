class Item < ApplicationRecord
	belongs_to :genre
	belongs_to :artist
	belongs_to :label
	attachment :image
	has_many :discs, dependent: :destroy
	has_many :select_items, dependent: :destroy
end
