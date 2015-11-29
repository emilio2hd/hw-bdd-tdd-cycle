Rottenpotatoes::Application.routes.draw do
  resources :movies
  get '/movies/search_directors/:id' => 'movies#search_directors', as: :search_directors

  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
