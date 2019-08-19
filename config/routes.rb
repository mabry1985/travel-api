require "api_constraints"
Rails.application.routes.draw do

  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end
  devise_for :users
  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      devise_for :users, controllers: {
           registrations: 'api/v1/users/registrations',
       }, skip: [:sessions, :password]
    end
  end

  concern :api_base do
    get "destinations/random" => 'destinations#random'

    resources :destinations do
      resources :reviews
    end
  end

  namespace :v1 do
    concerns :api_base
  end

end
