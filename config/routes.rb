Eye::Application.routes.draw do
  devise_for :users

  resources :categories, :only => :index do
    resources :galleries, :only => [:index,:show], :path => "" do
      resources :comments, :only => :create
    end
  end

  resources :comments, :only => :index

  root :to => redirect('/categories')

  get '/images', :to => 'galleries#all_img', :as => :all_img
  get '/like/:id', :to => 'galleries#like', :as => :like
end
