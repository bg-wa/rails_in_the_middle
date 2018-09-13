Rails.application.routes.draw do
  get '*path', to: 'catch_all#index'
  post '*path', to: 'catch_all#index'
  put '*path', to: 'catch_all#index'
  delete '*path', to: 'catch_all#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'catch_all#index'
end
