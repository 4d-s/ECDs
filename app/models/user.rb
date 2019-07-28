class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :orders, dependent: :destroy
   has_many :addresses, dependent: :destroy
   has_many :item_selects, dependent: :destroy

   validates :name, presence: true
   validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角文字のみが使用できます" }
   validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角文字のみが使用できます" }
   validates :last_name_katakana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/, message: "全角カタカナのみが使用できます" }
   validates :first_name_katakana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/, message: "全角カタカナのみが使用できます" }
   validates :street_address, presence: true
   validates :postal_code, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみが使用できます" }
   validates :phone_number, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみが使用できます" }

   def active_for_authentication?
      super && self.is_deleted?
   end
   def inactive_message
    self.is_deleted? ? super : :special_condition_is_not_valid
   end
end
