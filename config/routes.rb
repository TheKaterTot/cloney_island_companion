Rails.application.routes.draw do
  root to: "home#index"

  post 'questions', to: 'questions#create', as: 'new_question'
end
