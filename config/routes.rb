Rails.application.routes.draw do
  get 'dashboard/dashboard', to: 'dashboard#dashboard'
  get '/portfolio_assets', to: 'portfolio_assets#show', as: 'portfolio_assets'
  devise_for :users
  resources :assets
  root to: "pages#home"
  resources :portfolios do
    resources :portfolio_assets, only: [:create]
  end
end
