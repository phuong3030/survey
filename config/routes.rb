Rails.application.routes.draw do
  resources :respondents
  resources :questions
  resources :surveys do
    get :answer_scored_average, on: :collection
  end
end
