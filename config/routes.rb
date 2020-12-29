Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items do
    resources :buyers, only: [:index, :create]
  end
end
