Rails.application.routes.draw do
  resources :polls do
    resources :poll_answers do
      resources :votes
    end
  end

  root "polls#index"
end
