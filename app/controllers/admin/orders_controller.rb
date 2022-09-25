class OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"

  def show
    @order = Order.find(params[:id])
    @customer = @order.customers
    @order_products = @order.order_products
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    # [:order][:status]→orderの中のstatus
    if params[:order][:status] == "入金確認"
      # making_statusを製作待ちに更新
      @order.order_product.update(order_status: 1)
    end

    redirect_to request.referer

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
