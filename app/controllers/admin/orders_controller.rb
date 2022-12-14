class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @total = 0
  end

  def update
      @order = Order.find(params[:id])
      @order.update(order_params)
      redirect_to request.referer

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
