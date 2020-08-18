Rails.application.routes.draw do
  resources :currency

  get '/calculate', to: "currency#calculate"
  get '/create', to: "currency#create"
  get '/show', to: "currency#show"

end
