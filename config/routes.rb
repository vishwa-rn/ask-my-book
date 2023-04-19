Rails.application.routes.draw do
  get 'pages/home'
  namespace :api do
    resources :questions, only: [:create]
  end

  root 'pages#home'
end
