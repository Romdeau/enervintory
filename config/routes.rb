Rails.application.routes.draw do
  root to: "items#index"

  get '/items/export' => 'items#export', :as => :export_items
  get '/items/import' => 'items#import', :as => :import_items

  post '/items/:id/softwares' => 'softwares#create'

  resources :items do
    resources :softwares, only: [:new, :create]
  end

  resources :softwares, only: [:index, :show, :edit, :update, :destroy]

  devise_for :users

end
