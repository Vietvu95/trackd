Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :portfolios
  get 'pages/assets_search', to: 'pages#assets_search'
end
