class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # 退会機能
  def active_for_authentication?
    super && (self.user_status == false)
  end

  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end

