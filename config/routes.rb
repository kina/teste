Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"

  get "tweets", to: "tweets#index"
end
