Rails.application.routes.draw do
  resources :lecturers
  resources :students do
    member do
      get :profile
    end
  end
  resources :courses, only: [:index, :show, :create] do
    member do
      get :report
    end
  end
  resources :course_groups
  resources :sessions, param: :token, only: [:index, :show, :create] do
    member do
      post :attend
      post :interactive_quiz
      post :end
      get :report
      post :add_attendance
      post :invalidate_attendance
    end
  end
  resources :users, only: [] do
    collection do
      post :add_device_token
    end
  end
  resources :answers, only: [:create]
  # post :create_session, to: "sessions#create"
  mount_devise_token_auth_for 'User', at: 'auth'
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
