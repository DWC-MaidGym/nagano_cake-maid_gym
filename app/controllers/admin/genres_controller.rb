class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def create
    @genre_new = Genres.new
    @genre.save
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  #private

  #def (genre_params)
   # params.require(:genre).permit(:name)
  #end
end
