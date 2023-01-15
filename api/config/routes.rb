Rails.application.routes.draw do
  # 日報作成
  get '/daily_report', to: 'daily_reports#index'
  post '/daily_report', to: 'daily_reports#create'

  # ログイン処理
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users do
      get 'sections', on: :member
    end
  end

  # TODO
  root to: 'tasks#index'
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end

  # TODO: type
  resources :task_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
