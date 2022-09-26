class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def edit
    @customer = current_customer
  end  
  
  def show
    @customer = current_customer
  end
  
  def confirm
    @customer = current_customer
  end
  
  def create
    @customer = current_customer
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :telephone_number])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end
  
  
  
  
  def after_sign_up_path_for(resource)
    customers_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :telephone_number, :email, :password)
  end
  
end
