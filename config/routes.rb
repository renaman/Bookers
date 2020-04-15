Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about',to: 'homes#about'
  devise_for :users
  resources :books, only: [:index, :show, :create, :update, :edit, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
