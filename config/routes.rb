Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
