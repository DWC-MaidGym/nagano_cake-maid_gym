class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @total = 0
    @order_product = OrderProduct.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    # [:order][:status]→orderの中のstatus
    if params[:order][:status] == "confirm_payment"
      # making_statusを製作待ちに更新
      @order.order_products.update(order_status: 1)
    end

    redirect_to request.referer

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
