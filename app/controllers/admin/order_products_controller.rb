class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order
    @order_product.update(order_params)

    # [:order][:status]→orderの中のstatus
    if @order.status == "confirm_payment"
      # making_statusを製作待ちに更新
      @order_product.update(order_status: 1)
    end

    redirect_to request.referer

  end

  private

  def order_params
    params.require(:order_product).permit(:order_status)
  end
end
