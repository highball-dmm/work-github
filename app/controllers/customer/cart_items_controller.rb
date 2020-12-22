class Customer::CartItemsController < ApplicationController
     include ApplicationHelper

   before_action :set_cart_item, only: [:update, :destroy]
   before_action :authenticate_customer!

  def index
      @cart_items = CartItem.where(customer_id: current_customer.id)
  end
 
  def update
    @cart_item.update(item_quantity: params[:cart_item][:item_quantity].to_i)
    flash.now[:success] = "#{@cart_item.product.name}の数量を変更しました"
     redirect_to cart_items_path
  end

	def create
    @cart_item = current_customer.cart_items.new(params_cart_item)

      # カートの中に同じ商品が重複しないようにして古い商品と新しい商品の数量を合わせる
    @update_cart_item = CartItem.find_by(product_id: @cart_item.product)
    if @update_cart_item.present? && @cart_item.valid?
        @cart_item.item_quantity += @update_cart_item.item_quantity
        @update_cart_item.destroy
    end

    if @cart_item.save!
      flash[:notice] = "#{@cart_item.product.name}をカートに追加しました"
      redirect_to cart_items_path
    else
    #   @product = Product.find(params[:cart_item][:product_id])
    #   @cart_item = CartItem.new
    #   flash[:alert] = "個数を選択してください"
    #   render ("customer/products/show")
    
    end
	end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

	def destroy
   if @cart_item.destroy
    flash.now[:alert] = "#{@cart_item.product.name}を削除しました"
    @cart_items = CartItem.where(customer_id: current_customer.id)
    redirect_to cart_items_path
   end
	end

  private

  def params_cart_item
    params.require(:cart_item).permit(:item_quantity, :product_id)
  end
end
# end
