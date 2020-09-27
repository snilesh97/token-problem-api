# frozen_string_literal: true

require 'sidekiq/web'
Sidekiq::Web.app_url = '/'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get "work" => "work#index"
  get "work/email" => "work#email"
  get "work/post" => "work#delayed_post"
  get "work/long" => "work#long"
  get "work/crash" => "work#crash"
  get "work/bulk" => "work#bulk"

  namespace :api do
    namespace :v1 do
      resources :tokens, only: %i[index create] do
        collection do
          patch :assign
          patch '/:value/refresh_token', action: :refresh_token
          patch '/:value/unallocate', action: :unallocate
          patch '/:value/allocate', action: :allocate
          delete '/:value', action: :destory
        end
      end
    end
  end
end
