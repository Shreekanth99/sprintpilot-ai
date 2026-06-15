Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root "dashboard#index", as: :authenticated_root
  end

  unauthenticated do
    root "pages#landing"
  end

  get "dashboard", to: "dashboard#index", as: :dashboard

  resources :organizations
  resources :projects
  resources :epics
  resources :sprints
  resources :stories
  resources :tasks
  resources :teams

  resource :settings, only: [] do
    patch :theme
  end
end
