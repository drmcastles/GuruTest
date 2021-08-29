
Rails.application.routes.draw do

  get 'authentication/new'
  root 'tests#index'

  get 'sessions/new'
  get :signup, to: 'users#new'

  resources :users, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers
    end

    post :start, on: :member

  end

  resources :test_passages, only: %i[show update] do

    get :result, on: :member

  end

end
