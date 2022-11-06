Rails.application.routes.draw do
  root 'home#index'
  resources :articles do
    resources :comments
    resources :articles_categories
  end
  resources :categories
end