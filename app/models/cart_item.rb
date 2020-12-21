class CartItem < ApplicationRecord
    belongs_to :product
	belongs_to :customer

	validates :customer_id, :product_id, :item_quantity, presence: true
	validates :item_quantity, numericality: { only_integer: true }
end
