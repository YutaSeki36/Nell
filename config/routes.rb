Rails.application.routes.draw do

  devise_for :users

  # rootにindexページを設定 
  root 'note#index'
  get 'note/index/:id', to: 'note#show'
  get 'note/new'
  post 'note/create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
