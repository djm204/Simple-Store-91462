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
    @product = Product.new
  end # Loads: app/views/products/new.html.erb

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
private
  def product_params
    params.require(:product).permit(:title, :description, :price, :stock_quantity)
  end
end
