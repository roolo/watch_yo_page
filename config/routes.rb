Rails.application.routes.draw do
  resources :watchings, path: '/watchings/user/:user_handle/:user_token'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
