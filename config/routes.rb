Rails.application.routes.draw do
  resources :posts
  # skip: [:registrations] removes devise's registration functionality
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
