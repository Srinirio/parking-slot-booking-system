Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => "/sidekiq"
  ##########-----------------routes---------------------------############################
  root 'welcome#index'

  resources :entry_points, only: [:index] do
     resources :slot_bookings,only: [:new,:create]
  end

  get 'slot_bookings/select_date'
  get 'slot_bookings/vehicle_history'
  get 'slot_bookings/first_entry_times'


end
