class OrderItem < ApplicationRecord

  enum production_status: {"着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3}

  belongs_to :order
  belongs_to :product

  validates :product_id, :order_id, :item_quantity, presence: true
  validates :item_quantity, numericality: { only_integer: true }

end
