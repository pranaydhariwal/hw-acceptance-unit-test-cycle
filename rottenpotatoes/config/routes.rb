Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  #root 'movies_controller#index'
  
  get 'movies/director/:id', to: 'movies#director', as: 'movies_director'
end
