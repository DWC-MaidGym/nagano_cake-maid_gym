class Admin::ProductsController < ApplicationController
    def new
        @product = Product.new
        @genres = Genre.all
    end
    
    def create
        @product = Product.new(product_params)
        @product.admin_id = current_admin.id
        if product.save
            @product = Product.new
            render 'new'
            #仮設定
        else
            @product = Product.new
            render 'new'
        end
    end
    
     private

  def product_params
    params.require(:product).permit(:image_id, :name, :introduction, :genre, :price, :is_active)
  end
    
end
