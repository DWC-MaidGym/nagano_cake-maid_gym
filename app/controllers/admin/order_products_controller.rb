class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order
    @order_product.update(order_params)
    
    
    redirect_to request.referer

  end

  private

  def order_params
    params.require(:order_product).permit(:order_status)
  end
end
