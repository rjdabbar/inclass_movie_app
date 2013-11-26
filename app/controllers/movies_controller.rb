class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find params[:id]
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def new
    @movie = Movie.new
  end

  def create
    safe_movie = params.require(:movie).permit(:title, :description, :year_released, :rating)
    movie = Movie.create safe_movie
    redirect_to movie
  end

  def update
    @movie = Movie.find params[:id]
    safe_movie = params.require(:movie).permit(:title, :description, :year_released, :rating)
    movie = Movie.create safe_movie
    redirect_to @movie
  end

  def destroy
   @movie =  Movie.find params[:id]
   @movie.destroy
   redirect_to root_path
  end





end