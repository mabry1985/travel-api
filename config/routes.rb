Rails.application.routes.draw do

  get "destinations/random" => 'destinations#random' 

  resources :destinations do
    resources :reviews
  end


end
