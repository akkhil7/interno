Rails.application.routes.draw do
  resources :users, only: [:create,:update,:destroy,:index] 
  devise_for :users, :controllers => {:registrations => :users}

  post 'tokens/verify', to:'tokens#verify'
  post 'tokens/verify_token', to:'tokens#verify_token'
end
