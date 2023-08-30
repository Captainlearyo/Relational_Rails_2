Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #Directors Routes

  get 'directors/new', to: 'directors#new'
  post '/directors', to: 'directors#create'

  delete '/directors/:id', to:'directors#destroy'

  get '/directors', to:'directors#index'
  get '/directors/:id', to:'directors#show'
  
  get "/directors/:id/edit", to: "directors#edit"
  patch "/directors/:id", to: "directors#update"

  #Directors Movies Routes

  get '/directors/:director_id/movies/new', to: 'directors/movies#new'
  post '/directors/:director_id/movies', to: 'directors/movies#create'

  get '/directors/:director_id/movies', to: 'directors/movies#index'

  #Movies Route
  
  get '/movies', to:'movies#index'
  get '/movies/:id', to:'movies#show'
  
  get "/movies/:id/edit", to: "movies#edit"
  patch "/movies/:id", to: "movies#update"

  delete '/movies/:id', to:'movies#destroy'

end
