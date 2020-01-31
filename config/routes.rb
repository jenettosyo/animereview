Rails.application.routes.draw do
  devise_for :users
  get 'homes/top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :tweets do
    resources :searches, only: :index
  end
  
  root to: "homes#top"
  resources :users, only: [:show, :edit, :update]
  resources :tweets, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    # collection do
    #   get 'search'
    # end
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
