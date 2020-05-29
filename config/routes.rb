Rails.application.routes.draw do
  resources :lecturers
  resources :students
  mount_devise_token_auth_for 'User', at: 'auth'
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
