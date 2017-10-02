Rails.application.routes.draw do
resources :drivers
resources :passengers
root  'welcome#index'
end
