class Admin::HomesController < ApplicationController
  layout "admin_application"

  def top
    @order_products = OrderProduct.page(params[:page])
  end
end
