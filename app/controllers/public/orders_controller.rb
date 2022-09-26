class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_products = current_customer.cart_products.all

    @sum = 0
    @cart_products.each do |cart_product|
      @sum += cart_product.sum_price
    end
    @shopping_cost = 800
    @total = @sum + @shopping_cost

    if params[:order][:selected_address] == "customer_address"
      @order.post_code = current_customer.post_code
      @order.name = current_customer.full_name
      @order.address = current_customer.address
    elsif params[:order][:selected_address] == "shopping_address"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:selected_address] == "new_address"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_products = CartProduct.where(customer_id: current_customer)
    @order.status = 0

    if @order.save
      @cart_products.each do |cart|
        order_product = OrderProduct.new
        order_product.product_id = cart.product_id
        order_product.order_id = @order.id
        order_product.amount = cart.amount
        order_product.price = cart.product.add_tax_price
        order_product.save
      end
      @cart_products.destroy_all
      redirect_to order_complete_path(@order.id)
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products

    @sum = 0
    @order_products.each do |order_product|
      @sum += order_product.sum_price
    end
    @shopping_cost = 800
    @total = @sum + @shopping_cost

  end


  def order_params
  	params.require(:order).permit(:name, :address, :post_code, :shopping_cost, :total_payment, :payment_method)
  end

end
