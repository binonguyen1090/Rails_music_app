Rails.application.routes.draw do
  root 'users#index'
  resources :users

  resource :session

  resources :bands do   
    resources :albums, only: [:new]
  end

  resources :albums, except: [:new] do    
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:new]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
