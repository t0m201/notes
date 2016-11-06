Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :notes, path: ""
  resources :users do
    resources :notes
  end
end
