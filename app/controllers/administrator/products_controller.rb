class Administrator::ProductsController < ApplicationController
  def top
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to administrator_products_path
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to administrator_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :products_explanation, :non_taxed_price, :sale_status, :products_image, :genre_id)
  end
end
