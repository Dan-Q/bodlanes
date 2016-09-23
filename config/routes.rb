Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]                                          
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    put 'users' => 'devise/registrations#update', :as => 'user_registration'            
  end
  
  resources :screen_types do
    resources :templates do
      resources :content_areas
    end
  end

  resources :presentations do
    resources :content_blocks
    resources :media_files

    get 'preview', 'download', on: :member
  end

  root to: redirect('/presentations')
end
