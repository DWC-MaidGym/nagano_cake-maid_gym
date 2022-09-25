class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  #このコントローラーは使わなくてもよい
end
