class Public::ProductsController < ApplicationController

  def index
      @products = Product.all
  end

  def show
      @product = Product.find(params[:id])
      @cart_product =CartProduct
  end
  private
  def product_params
      params.require(:product).permit(:genre_id,:name,:description,:image_id,:price)
  end

end
