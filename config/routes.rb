Rails.application.routes.draw do

  root 'welcome#index'

  resources :entry_points, only: [:index] do
     resources :slot_bookings,only: [:new,:create]
  end

end
