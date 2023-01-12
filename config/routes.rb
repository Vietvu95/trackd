Rails.application.routes.draw do
  get 'dashboard/dashboard', to: 'dashboard#dashboard'
  devise_for :users
  root to: "pages#home"
  resources :portfolios
  get 'pages/assets_search', to: 'pages#assets_search'
end
