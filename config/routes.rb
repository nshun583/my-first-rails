Rails.application.routes.draw do
  get 'categories/index'
  root "articles#index"

  resources :articles do
    resources :comments
  end
end