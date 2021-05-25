Rails.application.routes.draw do
  root 'chords#index'
  resources :chords
  # root 'static_pages#top'
end
