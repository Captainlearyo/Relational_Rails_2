class Directors::MoviesController < ApplicationController
  def index
      @director = Director.find(params[:director_id])
      if params.keys.include?("sort")
      @movies = @director.movies.order(:name)
    else
      @movies = @director.movies
    end
  end

  def new
    @director = Director.find(params[:director_id])
  end

  def create
    director = Director.find(params[:director_id])
    movie = director.movies.create!({
      name: params[:name],
      length: params[:length],
      in_theaters: (params[:alive] || false)
    })
    director.save
    redirect_to "/directors/#{director.id}/movies"
  end


  
end