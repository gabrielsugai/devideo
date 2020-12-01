Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'videos#index'
  resources :videos, only: [:index, :show, :new, :create, :edit, :update]
  resources :video_views, only: [:create]
end
