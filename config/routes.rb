Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'manage_rsos', to: 'manage_rsos#index'

  get 'email_results', to: 'email_results#index'

  get 'manage_survey', to: 'manage_survey#index'

  get 'admin_privileges', to: 'admin_privileges#index'

  root 'home#index'
  get '/survey', to: 'survey#index'
end
