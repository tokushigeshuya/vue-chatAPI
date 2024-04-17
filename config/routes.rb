Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # API設定
  get '/api/test', to: 'application#test'
  # 特定のアクションへマッピング
  resources :rooms, only: [:index, :create] do
    # チャットルームごとにメッセージを取得できるよう設定
    resources :messages, only: [:index,:create]
  end
end
