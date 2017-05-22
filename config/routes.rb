Rails.application.routes.draw do
  root 'home#index'
  get '/survey', to: 'survey#index'
  get '/landing_page', to: 'landing_page#index'
end
