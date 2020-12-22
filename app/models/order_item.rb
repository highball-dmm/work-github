class OrderItem < ApplicationRecord

  enum production_status: {"着手不可": 0, "制作待ち": 1, "製作中": 2, "製作完了": 3}

  belongs_to :order
  belongs_to :product

end
