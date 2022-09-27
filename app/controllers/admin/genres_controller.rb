class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの作成に成功しました"
       redirect_to admin_genres_path
    else
      flash[:notice] = "ジャンルの作成に失敗しました"
      @genres = Genre.all
      @genre = Genre.new
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      flash[:notice] = "ジャンルの更新に失敗しました"
      render :edit
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
