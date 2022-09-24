class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  before_action :authenticate_customer!, except: [:top, :about]
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
      root_path
    end
  end
end