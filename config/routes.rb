Rails.application.routes.draw do
  get 'dashboard/dashboard', to: 'dashboard#dashboard'
  devise_for :users
  resources :assets
  # get 'assets/index', to: 'assets#index'
  root to: "pages#home"
  resources :portfolios do
    resources :portfolio_assets, only: [:create]
  end
  get 'pages/assets_search', to: 'pages#assets_search'
  get 'pages/assets', to: 'pages#assets'
  post 'portfolios/add_asset', to: 'portfolios#add_asset'
end
