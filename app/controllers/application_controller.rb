class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   def after_sign_in_path_for(resource)
      case resource
      when Administrator
        administrator_customer_top_path
      when Customer
        root_path(current_customer)
      end
   end


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone_number, :email, :encrypted_password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end



end
