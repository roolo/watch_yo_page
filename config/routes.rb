Rails.application.routes.draw do


  constraints username: /^\w+$/i do
    constraints token: /^[\w\d\-]+$/i do
      resources :watchings
    end

    namespace 'yo_receiver' do
      get 'prepare'
      get 'subscribed'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
