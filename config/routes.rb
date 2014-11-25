Rails.application.routes.draw do
  root to: "works#index"

  get "APPPATH/index.html", to: "works#index", as: :base
  get "APPPATH/make/:make_id.html", to: "makes#show", as: :make
  get "APPPATH/model/:make_id/:model_id.html", to: "models#show", as: :model
end
