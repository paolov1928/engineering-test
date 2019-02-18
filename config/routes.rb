Rails.application.routes.draw do
  root "experiences#index"
  resources :experiences
end
