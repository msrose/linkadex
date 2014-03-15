Linkadex::Application.routes.draw do
  namespace :about do
    root :to => 'static_pages#index'
    namespace :tutorials do
      root :to => 'static_pages#index'
      get '/getting-started' => 'static_pages#getting_started', :as => 'getting_started'
      get '/creating-links' => 'static_pages#creating_links', :as => 'creating_links'
      get '/features' => 'static_pages#features', :as => 'features'
    end
  end

  namespace :api do
    namespace :v1 do
      get '/users/:username' => 'users#groups_with_links'
    end
  end

  root :to => 'dashboard#home'

  resources :sessions, :only => [:new, :create, :destroy]
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  resources :groups, :except => :show do
    resources :links, :except => :show
  end

  resources :colors, :except => :show do
    delete 'clean-up' => 'colors#clean_up', :as => 'clean_up', :on => :collection
  end

  resources :users do
    collection do
      get 'verify' => 'users#verify'
      get 'forgotten' => 'users#forgotten'
      put 'reset' => 'users#reset'
    end
  end

  scope '/:username', :as => 'friendly' do
    root :to => 'users#show', :as => 'user'
    get '/account' => 'users#edit', :as => 'edit_user'
  end
end
