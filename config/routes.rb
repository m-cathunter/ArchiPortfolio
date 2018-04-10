Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :reviews
  end

  root 'projects#index'
end
