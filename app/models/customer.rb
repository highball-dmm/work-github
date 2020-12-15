class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 退会機能       
  enum user_status: { '有効': true, '退会済': false }       
  def active_for_authentication?
  super && self.user_status == '有効'
  end     
         
end
