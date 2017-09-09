Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/officers', to: 'officer#index'
  get '/officers/manage', to: 'officer#manage'
  post '/officers/create_officer', to: 'officer#create_officer'
  post '/officers/delete_officer', to: 'officer#delete_officer'

  get '/rsos', to: 'rso#index'
  get '/rsos/manage', to: 'rso#manage'
  get '/rsos/new', to: 'rso#new'
  get '/rsos/bulk', to: 'rso#bulk_upload'

  get '/rsos/edit/:id', to: 'rso#edit', as: "edit_rso"
  post '/rsos/create_rso', to: 'rso#create_rso'
  post '/rsos/modify_rso', to: 'rso#modify_rso'
  post '/rsos/delete_rso', to: 'rso#delete_rso'
  post '/rsos/add_keyword', to: 'rso#add_keyword'
  post '/rsos/delete_keyword', to: 'rso#delete_keyword'
  post '/rsos/add_officer', to: 'rso#add_officer'
  post '/rsos/delete_officer', to: 'rso#delete_officer'

  get '/admin/manage', to: 'admin#manage'
  get '/admin', to: 'admin#index'
  get '/survey', to: 'survey#index'
  get '/survey/manage', to: 'survey#manage'
  get '/survey/question/:id', to: 'survey#edit_question', as: "edit_question"
  put '/survey/modify_question/:id', to: 'survey#modify_question'
  post '/survey/manage', to: 'survey#create_question'
  post '/survey/delete_question', to: 'survey#delete_question'
  post '/survey/delete_answer', to: 'survey#delete_answer'
  get '/survey/edit_answer/:id', to: 'survey#edit_answer', as: "edit_answer"
  post '/survey/modify_answer', to: 'survey#modify_answer'
  post '/survey/submit', to: 'survey#submit'
  post '/survey/add_keyword', to: 'survey#add_keyword'
  post '/survey/edit_keyword', to: 'survey#edit_keyword'
  post '/survey/delete_keyword', to: 'survey#delete_keyword'

  root 'home#index'

end
