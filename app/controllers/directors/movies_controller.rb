class Directors::MoviesController < ApplicationController
  def index
      @director = Director.find(params[:director_id])
  end
end