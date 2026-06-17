Rails.application.routes.draw do
  get "ai_stories/create"
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

  resources :ai_assistant do
    collection do
      post :generate
      post :save_story
      post :save_tasks
      post :save_epic
      post :save_sprint
    end
  end
end
