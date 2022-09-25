class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"

  def top
    @order_products = OrderProduct.page(params[:page])
  end
end
