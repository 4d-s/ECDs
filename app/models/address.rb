class Address < ApplicationRecord
	belongs_to :user

	validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角文字のみが使用できます" }
  	validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角文字のみが使用できます" }
   	validates :street_address, presence: true
   	validates :postal_code, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみが使用できます" }
   	validates :phone_number, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみが使用できます" }

end
