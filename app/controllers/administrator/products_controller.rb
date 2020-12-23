class Administrator::ProductsController < ApplicationController
  def top
    now = Time.current
    @orders = Order.where(created_at: now.all_day)
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to administrator_product_path(product)
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to administrator_products_path
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to administrator_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :products_explanation, :non_taxed_price, :sale_status, :products_image, :genre_id)
    # permitに記述している内容しか変更できない様にするため
  end
end
