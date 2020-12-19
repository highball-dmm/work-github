class CustomersController < ApplicationController

  def show
    # @customer = current_customer
    @customer = Customer.find(params[:id])
  end

  def quit
  end


  def out
    @customer = current_customer
    @customer.update(user_status: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end


  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone_number, :email,)
  end
end
