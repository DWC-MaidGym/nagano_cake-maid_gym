class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre_new = Genre.new(genre_params)
    @genre_new.save
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
