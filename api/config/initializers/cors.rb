Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "localhost:8000" # Nuxt側はポート番号3000で作るので「localhost:8000」を指定

      resource "*",
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        expose: ['X-CSRF-Token'],
        credentials: true
    end
  end