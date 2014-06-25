Rails.application.routes.draw do
  
  resources :users, :only => 
                  [:create, :destroy, :index, :show, :update, :destroy] do     
    resources :contacts, :only => [:index]
  end
  resources :contacts, :only => [:create, :destroy, :show, :update, :destroy] do
    member do
      get 'favorite'
    end
  end
  resources :contact_shares, :only => [:create, :destroy, :show, :update, :destroy] do
    member do
      get 'favorite'
    end
  end
end
