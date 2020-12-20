class Product < ApplicationRecord

  attachment :products_image

  has_many :cart_items

  belongs_to :genre


  enum sale_status: { "販売中": true, "売り切れ": false}

end
