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
end

