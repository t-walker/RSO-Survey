Rails.application.routes.draw do
  root 'home#index'
  get '/survey', to: 'survey#index'
end
