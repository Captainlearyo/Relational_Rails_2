class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update({
      name: params[:name],
      length: params[:length],
  in_theaters: (params[:in_theaters] || false)
    })
    movie.save

    redirect_to "/movies/#{movie.id}"
    
  end

end