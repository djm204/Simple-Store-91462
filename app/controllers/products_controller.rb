class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  # Loads up the view of the same name after the action has executed
  # app/views/products/index.html.erb
  # This view will have access to the @products variable.

  def show
    @product = Product.find(params[:id])
  end # Loads: app/views/products/show.html.erb

  def new
  end # Loads: app/views/products/new.html.erb

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
