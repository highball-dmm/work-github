class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new
  	@shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def log
    #orderのテーブルにあるカラムに情報を入れている
    @cart_items = CartItem.where(customer_id: current_customer.id)
    # binding.pry
    # @order = Order.new(customer_id: current_customer.id, payment_method: params[:order][:payment_method])
		@order = Order.new
		@order.payment_method = params[:order][:payment_method].to_i

    @order.billing =  0
    @order.shipping = 800
    @order.order_status = 0

    # addressにresidenceの値がはいっていれば
    if params[:order][:addresses] == "residence"
      @order.shipping_postal_code = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    # addressにshipping_addressesの値がはいっていれば
    elsif params[:order][:addresses] == "shipping_addresses"
      ship = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.postcode = ship.postcode
      @order.address = ship.address
      @order.name = ship.name

    # addressにnew_addressの値がはいっていれば
    elsif params[:order][:addresses] == "new_address"
      @order.shipping_postal_code = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @ship = "1"

      # バリデーションがあるならエラーメッセージを表示
      unless @order.valid? == true
        @shipping_addresses = ShippingAddress.where(customer: current_customer)
        render :new
      end
    end
  end

	def create
	  @order = Order.new
	  @order.customer_id = current_customer.id
    @order.save

    # もし情報入力でnew_addressの場合ShippingAddressに保存
    if params[:order][:ship] == "1"
      current_customer.shipping_address.create(address_params)
    end

    # カート商品の情報を注文商品に移動
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.each do |cart_item|
      #orderitemテーブルのカラムに代入
    OrderItem.create(
      procuct_id:  cart_item.product.id,
      customer_id: current_customer.id,
      item_quantity: cart_item.item_quantity,
      purchase_price_intax: (cart_item.product.non_taxed_price) *1.1
    )
    end



    # current_customer.cart_items.each do |cart_item|
    #   @order_item = OrderItem.new
    #   @order_item.procuct_id = cart_item.procuct.id
    #   @order_item.item_quantity = cart_item.item_quantity
    #   @order_item.purchase_price_intax = cart_item.procucts.non_taxed_price * 1.1
    #   @order_item.order_id = @order.id
    #   @order_item.save
    # end
    # 注文完了後、カート商品を空にする
    @cart_items.destroy_all

    redirect_to thanx_customer_orders_path
    flash[:notice] = "ご注文が確定しました。"
	end

	def thanx
	end

	def index
    @orders = current_customer.orders
	end

	def show
	  @order = Order.find(params[:id])
    @order_details = @order.order_details
	end

  private

  def order_params
    params.require(:order).permit(:shipping_postal_code, :address, :name, :payment_method, :total_price)
  end

  def address_params
    params.require(:order).permit(:shipping_postal_code, :address, :name)
  end

  def to_log
    redirect_to customers_cart_items_path if params[:id] == "log"
  end





end
