class Customer::ShippingAddressesController < ApplicationController
    before_action :authenticate_customer!

  def index
		@shipping_addresses = ShippingAddress.all
  	@shipping_address = ShippingAddress.new
  end

 def create
	  @shipping_address = ShippingAddress.new(shipping_address_params)
	  @shipping_address.customer_id = current_customer.id
	  if @shipping_address.save
	  	 flash.now[:notice] = "新規配送先を登録しました"
	      redirect_to customer_shipping_addresses_path
	  else
	   	# @shipping_addresses = current_customer.shipping_address
	      render 'index'
	  end
 end

 def edit
     @shipping_address = ShippingAddress.find(params[:id])
 end

 def update
	  @shipping_address = ShippingAddress.find(params[:id])
	  if @shipping_address.update(shipping_address_params)
  	   flash[:success] = "配送先を変更しました"
       redirect_to customer_shipping_addresses_path
	  else
	   render "edit"
	  end
 end

 def destroy
	  @shipping_address = ShippingAddress.find(params[:id])
	  if @shipping_address.destroy
      #@shipping_addresses = current_customer.shipping_address
      flash.now[:alert] = "配送先を削除しました"
	  redirect_to customer_shipping_addresses_path
	  end
 end


private

    def shipping_address_params
  	params.require(:shipping_address).permit(:postcode, :address, :name)
    end
end
