class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.where(customer_id: current_customer)
    @sum = 0
    @cart_products.each do |cart_product|
      @sum += cart_product.sum_price
    end
    @total = @sum
  end

  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to cart_products_path
  end

  def all_destroy
    cart_products = CartProduct.where(customer_id: current_customer.id)
    cart_products.destroy_all
    redirect_to cart_products_path
  end

  def create

    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    @cart_products = CartProduct.where(customer_id: current_customer.id)

    @cart_products.each do |cart_product|
      if cart_product.product_id == @cart_product.product_id
        new_amount = cart_product.amount + @cart_product.amount
        cart_product.update_attribute(:amount, new_amount)
        @cart_product.destroy
      end
    end
    @cart_product.save
    redirect_to cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :amount)
  end

end
