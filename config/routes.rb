Rails.application.routes.draw do
  root 'discussions#index'
  resources :channels
  resources :discussions do
    resources :replies
  end
  devise_for :users, controllers: { registrations: 'registrations' }
end