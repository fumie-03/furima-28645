Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  devise_for :users
end
