Rails.application.routes.draw do

  get 'feed', to: 'feed#show'

  get 'users/:username', to: 'users#show'
  
  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: "follows#destroy"
    end
  end  

   
  resources :experiences do 
    resources :comments
  end

  resources :experiences do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end

  resources :comments do 
    resources :comments
  end
  
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get "signin" => 'devise/sessions#new'
  	delete "signout" => 'devise/sessions#destroy'
  	get "signup" => 'devise/registrations#new'
  end
  
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contactus' => 'pages#contactus'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
