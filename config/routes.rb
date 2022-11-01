Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resources :reservations

  resources :rooms do
    collection do
      get :posts
    end
  end

  resources :users do
    collection do
      get :account
      get :profile
    end
  end

  root "home#top"

end
