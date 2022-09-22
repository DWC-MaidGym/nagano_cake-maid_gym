class Admin::HomesController < ApplicationController

  def top
    @order_products = OrderProduct.page(params[:page])
  end
end
