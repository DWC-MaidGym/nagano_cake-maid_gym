class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.where(customer_id: current_customer)
  end

  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.amount = params[:amount]
    cart_product.update
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to cart_products_path
  end

  def all_destroy
    cart_products = CartProduct.where(customer_id: current_customer.id)
    cart_products.destroy
    redirect_to cart_products_path
  end

  def create
    cart_product = CartProduct.new(cart_product_params)
    cart_product.customer_id = current_customer.id
    cart_product.product_id = params[:id]
    cart_product.amount = params[:amount]
    cart_product.save
    redirect_to cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :amount, :customer_id)
  end

end
