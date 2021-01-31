Rails.application.routes.draw do
  root to: 'users#count'

  namespace :api do
    namespace :front_component_v1 do
      get 'forms/default_value', to: 'forms#default_value'
    end
  end
end
