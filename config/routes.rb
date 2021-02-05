Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'mypage', to: 'users#show'
  get 'mypage/edit', to: 'users#edit'
  get 'mypage/outline/edit', to: 'users#editoutline'
  resources :users, only: [:create, :update, :destroy]
  
  resources :histories, only: [:create, :new, :edit, :update, :destroy] do
    member do
      get :holds
    end
  end
    
  resources :history_skills, only: [:create, :destroy]
  

end
