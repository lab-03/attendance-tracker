Rails.application.routes.draw do
  resources :lecturers
  resources :students
  resources :courses
  resources :course_groups
  resources :sessions, param: :token, only: [:index, :show, :create] do
    member do
      post :attend
    end
  end
  resources :users, only: [] do
    collection do
      post :add_device_token
    end
  end
  # post :create_session, to: "sessions#create"
  mount_devise_token_auth_for 'User', at: 'auth'
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
