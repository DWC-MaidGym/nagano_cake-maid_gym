class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

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

  private

  def product_params
    params.require(:product).permit(:image_id, :name, :introduction, :genre_id, :price, :is_active)
  end
end
