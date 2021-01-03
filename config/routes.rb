Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chats do
    get 'retreive_keys', to: 'chats#retreive_keys'
  end
  resources :messages
end
