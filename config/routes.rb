Rails.application.routes.draw do
  root to: "works#index"

  get "/make/:make_id.html", to: "makes#show", as: :make
  get "/model/:make_id/:model_id.html", to: "models#show", as: :model
end
