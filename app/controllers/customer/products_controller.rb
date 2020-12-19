class Customer::ProductsController < ApplicationController

    def top
        @products = Product.all.order(created_at: :asc)
        # @genres = Genre.all
    end

    def about
    end

    def index
        @genres = Genre.all
        @products = Product.where(sale_status: true)#.page(params[:page]).per(8)
    end

    def show
        @products = Product.all
        @product = Product.find(params[:id])
        @cart_item = CartItem.new
    end

	private
	def product_params
		parmas.require(:product).permit(:products_image_id,:name, :products_explanation, :non_taxed_price, :sale_status)
	end

end
