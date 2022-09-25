class Admin::ProductsController < ApplicationController
  layout "admin_application"

  def new
        @product = Product.new
        @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      @genres = Genre.all
      @product = Product.new
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end
<<<<<<< HEAD

=======
  
  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end
  
>>>>>>> origin/develop
  private

  def product_params
    params.require(:product).permit(:image_id, :name, :introduction, :genre_id, :price, :is_active)
  end
end
