class ShippingAddress < ApplicationRecord
    belongs_to :customer
    
    validates :customer_id, :name, :address, presence: true
	validates :postcode, length: {is: 7}, numericality: { only_integer: true }

	# order/newで使用
	def order_address
			self.postcode + self.address + self.name
	end
    
end
