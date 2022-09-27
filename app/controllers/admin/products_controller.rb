class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"

  def new
        @product = Product.new
        @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "商品を登録しました"
      redirect_to admin_product_path(@product)
    else
      flash[:notice] = "商品の登録に失敗しました"
      @genres = Genre.all
      @product = Product.new
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品を更新しました"
      redirect_to admin_product_path(@product)
    else
      flash[:notice] = "商品の更新に失敗しました"
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image_id, :name, :introduction, :genre_id, :price, :is_active)
  end
end
