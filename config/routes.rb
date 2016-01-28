Rails.application.routes.draw do
  #resources :users

  resources :users
  post 'tokens/verify', to:'tokens#verify'
  post 'tokens/verify_token', to:'tokens#verify_token'
end
