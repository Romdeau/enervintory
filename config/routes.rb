Rails.application.routes.draw do
  root to: "items#index"

  get '/items/export' => 'items#export', :as => :export_items
  get '/items/import' => 'items#import', :as => :import_items
  post '/items/import' => 'items#import_file'

  resources :items
  devise_for :users

end
