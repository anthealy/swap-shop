Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  resources :articles  #paths to articles
  
  get 'signup', to: 'users#new' #send new users to signup page
  #post 'users', to: 'users#create'
  resources :users, except:[:new]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :types, except: [:destroy]
  
end
