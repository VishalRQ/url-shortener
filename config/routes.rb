Rails.application.routes.draw do
  resources :urls, only: [ :create, :show, :new, :index ], param: :short_code
  get "/s/:short_code", to: "urls#redirect", as: :short

  get "up" => "rails/health#show", as: :rails_health_check
end
