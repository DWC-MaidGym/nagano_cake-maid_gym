class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    @cart_producs = current_customer.cart_products.all

    @sum = 0
    @cart_products.each do |cart_product|
      @sum += cart_product.sum_price
    end
    @total = @sum + shopping_cost

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
      @order.post_code = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end
  
  def complete
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_products = current_customer.products

    if @order.save
      @cart_products.each do |cart|
      order_detail = OrderProduct.new
      order_detail.product_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.quantity
      order_detail.price = cart.item.price
      order_detail.save
    end
    
    @cart_items.destroy_all
    redirect_to orders_done_path
    else
    @order = Order.new(order_params)
    render :new
    end
  end
  
  def index
  end
  
  def show
  end
  
  
  def order_params
  	params.require(:order).permit(:name, :address, :post_code, :shopping_cost,:total_payment,:payment_method, :status,:customer_id)
  end
end
