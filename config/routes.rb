Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/spices", to: "spices#show"

  post "/spices", to: "spices#create"

  delete "/spices/:id", to: "spices#delete"

  patch "/spices/:id", to: "spices#update"
end
