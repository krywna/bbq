Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :users, only: [:show, :edit, :update]
  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]

    post :show, on: :member
  end
end
