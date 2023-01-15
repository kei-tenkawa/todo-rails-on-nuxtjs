Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      # admin
      namespace :admin do
        resources :users do
          get 'sections', on: :member
        end
      end
      # ログイン処理
      get '/login', to: 'sessions#new'
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      # TODO
      root to: 'tasks#index'
      resources :tasks do
        post :confirm, action: :confirm_new, on: :new
        post :import, on: :collection
      end
      # task_type
      resources :task_types

      # 日報作成
      resources :daily_report, only: :create
    end
  end
end
