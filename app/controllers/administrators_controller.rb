class AdministratorsController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

end
