class Administrator::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    order = Order.find(params[:id])
    order.update!(order_params)
    redirect_to request.referer
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to administrator_orders_path
  end

  private
  def  order_params
    params.require(:order).permit(:order_status)
  end
end
