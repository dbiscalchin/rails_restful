Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/errors/raise_error', to: 'errors#raise_error_action'
end
