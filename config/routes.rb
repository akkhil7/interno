# == Route Map
#
#               Prefix Verb   URI Pattern                    Controller#Action
#                users GET    /users(.:format)               users#index
#                      POST   /users(.:format)               users#create
#                 user PATCH  /users/:id(.:format)           users#update
#                      PUT    /users/:id(.:format)           users#update
#                      DELETE /users/:id(.:format)           users#destroy
#     new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#         user_session POST   /users/sign_in(.:format)       devise/sessions#create
# destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#        user_password POST   /users/password(.:format)      devise/passwords#create
#    new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#   edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                      PATCH  /users/password(.:format)      devise/passwords#update
#                      PUT    /users/password(.:format)      devise/passwords#update
#          internships GET    /internships(.:format)         internships#index
#                      POST   /internships(.:format)         internships#create
#           internship DELETE /internships/:id(.:format)     internships#destroy
#        tokens_verify POST   /tokens/verify(.:format)       tokens#verify
#  tokens_verify_token POST   /tokens/verify_token(.:format) tokens#verify_token
#

Rails.application.routes.draw do
  devise_for :companies, :controllers => {:registrations => :companies}
  resources :users, only: [:create,:update,:destroy,:index]
  resources :companies, only: [:create,:update,:destroy,:index]
  devise_for :users, :controllers => {:registrations => :users}

  get 'internizes/all_applications', to: 'internizes#all_applications'

  resources  :internships, only: [:create,:index,:destroy]
  resources :internizes, only: [:index,:create, :show]
  resources  :conversations, only: [:create,:index,:destroy]
  resources :messages, only: [:index,:create]


  get 'conversations/company_conversations', to: 'conversations#company_conversations'
  get 'internships/company_internships', to: 'internships#company_internships'
  post 'answers/', to:'answers#create'
  post 'tokens/verify', to:'tokens#verify'
  post 'tokens/verify_company', to:'tokens#verify_company'
  post 'tokens/verify_token', to:'tokens#verify_token'
  post 'internizes/upload_resume', to: 'internizes#upload_resume'
  put 'questions/', to: 'questions#update'
  get 'users/:id/check_resume', to: 'users#check_resume'
end
