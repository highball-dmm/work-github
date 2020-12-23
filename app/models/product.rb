class Product < ApplicationRecord

  attachment :products_image

  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :order_items
  has_many :order_items


  enum sale_status: {"販売中": true, "売り切れ": false }

end
