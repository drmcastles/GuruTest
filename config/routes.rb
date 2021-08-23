Rails.application.routes.draw do

  resources :answers
  root 'test#index'

  resources :tests do
    resources :questions, shallow: true
  end

end
