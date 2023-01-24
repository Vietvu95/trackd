Rails.application.routes.draw do
  get 'dashboard/dashboard', to: 'dashboard#dashboard'
  get "/dashboard-data", to: "dashboard#dashboard_data"
  devise_for :users
  resources :assets
  root to: "pages#home"
  resources :portfolios do
    resources :portfolio_assets, only: [:create]
  end
end
