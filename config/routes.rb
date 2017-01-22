Rails.application.routes.draw do
  namespace :admin do
    resources :users
resources :posts
resources :admin_users

    root to: "users#index"
  end

  resources :posts
  # skip: [:registrations] removes devise's registration functionality
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
