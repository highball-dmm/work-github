class Product < ApplicationRecord

  attachment :products_image
<<<<<<< HEAD
  has_many :cart_items
=======
  
  has_many :cart_items

  belongs_to :genre

>>>>>>> origin/develop

  enum sale_status: { "販売中": true, "売り切れ": false}

end
