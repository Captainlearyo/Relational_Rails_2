class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    
  end

  def create
    director = Director.new({
      name: params[:name],
      age: params[:age],
      alive: (params[:alive] || false)
    })
    director.save
    redirect_to "/directors"
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    director = Director.find(params[:id])
    director.update({
      name: params[:name],
      age: params[:age],
      alive: (params[:alive] || false)
    })
    director.save

    redirect_to "/directors/#{director.id}"
    
  end
end