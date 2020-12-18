class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new
  	@shipping_addresses = ShippingAddress.where(customer: current_customer)
  	end




end
