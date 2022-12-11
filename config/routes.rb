Rails.application.routes.draw do
  devise_for :users
  resources :polls do
    resources :results
    resources :poll_answers do
      resources :votes
    end
  end

  root "polls#index"
end
