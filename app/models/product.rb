class Product < ApplicationRecord

  attachment :products_image

  belongs_to :genre


  enum sale_status: { "販売中": true, "売り切れ": false}

end
