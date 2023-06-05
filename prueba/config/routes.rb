Rails.application.routes.draw do
  root "people#index"
  resources :people do 
    resources :documents
    resources :roles
  end

end
