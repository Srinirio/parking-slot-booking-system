Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => "/sidekiq"
  ##########-----------------routes---------------------------############################
  root 'welcome#index'

  resources :entry_points, only: [:index] do
     resources :slot_bookings,only: [:new,:create] do
       collection do
         get 'select_date'
         get 'vehicle_history'
         get 'first_entry_times'
       end
     end
  end

  get 'slot_bookings/select_date'
  get 'slot_bookings/vehicle_history'
  get 'slot_bookings/first_entry_times'


end
