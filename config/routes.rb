Rails.application.routes.draw do
  get 'note/index'
  get 'note/show'
  get 'note/new'
  post 'note/create'

  devise_for :users
  root 'pages#index'
  get 'pages/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
