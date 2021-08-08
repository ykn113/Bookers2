Rails.application.routes.draw do

  get '/search' => 'searches#search'
  root to: 'homes#top'
  get 'home/about' =>'homes#about'
  get "book_search" => "homes#book_search"
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  
  devise_for :users
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
