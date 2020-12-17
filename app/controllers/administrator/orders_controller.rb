class Administrator::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to administrator_orders_path
  end

  private
  def  order_params
    params.require(:order).permit(:customer, :shipping, :billing, :payment_method, :name, :shipping_address, :order_status, :shipping_postal_code)
  end
end
