Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

  get '/users/sign_out' => 'devise/sessions#destroy'
    get '/log_in' => 'devise/sessions#new'
    get '/log_out' => 'devise/sessions#destroy'
    get '/sign_up' => 'devise/registrations#new'
    get '/edit_profile' => 'devise/registrations#edit'

  resources :chat_rooms, only: [:new, :create, :show, :index, :update]

  get 'chat_rooms/new' => 'chat_rooms#new'
  get 'chat_rooms/show' => 'chat_rooms#show'
  post 'chat_rooms/' => 'chat_rooms#create'
  post 'chat_rooms/:first_name' => 'chat_rooms#show'

  root 'chat_rooms#index'
  mount ActionCable.server => '/cable'
end
