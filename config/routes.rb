Rails.application.routes.draw do

  root 'slot_bookings#new'
  resources :slot_bookings,only: [:new,:create]
end
