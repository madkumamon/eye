Eye::Application.routes.draw do
  devise_for :users
  resources :events, :only => [:index, :show]
  resources :comments, :only => :index

  resources :categories, :only => :index do
    resources :galleries, :only => [:index,:show], :path => "" do
      resources :comments, :only => :create
    end
  end


  root :to => redirect('/categories')

  get '/images', :to => 'galleries#all_img', :as => :all_img
  get '/like/:id', :to => 'galleries#like', :as => :like
end
