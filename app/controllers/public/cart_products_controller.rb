class Public::CartProductsController < ApplicationController
  
  def index
    @cart_products = current_customer.products
    redirect_to
  end
  
  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.amount = params[:amount]
    cart_product.update
    redirect_to
  end
  
  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to
  end
  
  def all_destroy
    cart_products = CartProduct.where(user_id: current_customer.id)
    cart_products.destroy
    redirect_to
  end
  
  def create
    cart_product = CartProduct.new
    cart_product.user_id = current_customer.id
    cart_product.product_id = params[:id]
    cart_product.amount = params[:amount]
    cart_product.save
    redirect_to
  end

end
