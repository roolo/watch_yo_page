Rails.application.routes.draw do


  constraints username: /^\w+$/i do
    constraints token: /^[\w\d\-]+$/i do
      resources :watchings do
        member do
          get :stop_watching_query
          get :stop_watching
        end
      end
    end

    namespace 'yo_receiver' do
      get 'prepare'
      get 'subscribed'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
