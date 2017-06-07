Rails.application.routes.draw do
  root 'static#home'

  #resources :portfolio, controller: :portfolio_items
  resources :portfolio_items, :path => "portfolio"

end
