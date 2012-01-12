Eye::Application.routes.draw do
  devise_for :users

  resources :categories, :only => :index do

  end

  root :to => redirect('/categories')
end
