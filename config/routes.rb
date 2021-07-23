Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' =>'homes#about'
  
  devise_for :users
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
