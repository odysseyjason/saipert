Rails.application.routes.draw do
  resources :users do
    member do
      get 'edit_name'
      patch 'edit_name'
      post 'edit_name'
    end
  end

  # Defines the root path route ("/")
  root "application#index"
end
