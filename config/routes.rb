Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/officer', to: 'officer#index'
  get '/officer/manage', to: 'officer#manage'
  post '/officer/create_officer', to: 'officer#create_officer'
  post '/officer/delete_officer', to: 'officer#delete_officer'

  get '/rso', to: 'rso#index'
  get '/rso/manage', to: 'rso#manage'
  post '/rso/create_rso', to: 'rso#create_rso'
  post '/rso/delete_rso', to: 'rso#delete_rso'
  post '/rso/add_keyword', to: 'rso#add_keyword'
  post '/rso/delete_keyword', to: 'rso#delete_keyword'
  post '/rso/add_officer', to: 'rso#add_officer'
  post '/rso/delete_officer', to: 'rso#delete_officer'

  get '/admin/manage', to: 'admin#manage'
  get '/admin', to: 'admin#index'
  get '/survey', to: 'survey#index'
  get '/survey/manage', to: 'survey#manage'
  post '/survey/manage', to: 'survey#create_question'
  post '/survey/submit', to: 'survey#submit'
  post '/survey/add_keyword', to: 'survey#add_keyword'
  post '/survey/delete_keyword', to: 'survey#delete_keyword'

  root 'home#index'

end
