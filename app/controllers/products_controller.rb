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
  end # We either redirect or render the new view.

  def edit
    @product = Product.find(params[:id])
  end # Lodas: app/views/products/edit.html.erb

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to @product
    else
      render :edit
    end
  end # We either redirect or render the edit view.

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end # We always redirect to the root after we have deleted.
  
private
  def product_params
    params.require(:product).permit(:title, :description, :price, :stock_quantity)
  end
end
