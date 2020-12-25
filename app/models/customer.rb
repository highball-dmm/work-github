class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :orders
  has_many :cart_items, dependent: :destroy


  # 退会機能
  def active_for_authentication?
    super && (self.user_status == false)
  end

  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :address, :phone_number, presence: true
  validates :postcode, length: {is: 7}, numericality: { only_integer: true }
  validates :phone_number, numericality: { only_integer: true }
  validates :first_name_kana, :last_name_kana, format: { with: /\p{katakana}/, message: "カタカナで入力してください" }

end
