Rails.application.routes.draw do
  get 'db_worker/input'
  get 'db_worker/result'
  get 'palms/input'
  get 'palms/view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'palms#input'
  # Defines the root path route ("/")
  # root "articles#index"
end
