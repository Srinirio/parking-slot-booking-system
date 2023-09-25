Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => "/sidekiq"
  ##########-----------------routes---------------------------#######################
  root 'welcome#index'

  resources :entry_points, only: [:index] do
     resources :slot_bookings,only: [:new,:create]
  end

end
