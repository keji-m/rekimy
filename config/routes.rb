Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  get 'mypage', to: 'users#show'
  get 'mypage/edit', to: 'users#edit'
  resources :users, only: [:create, :update, :destroy]

end
