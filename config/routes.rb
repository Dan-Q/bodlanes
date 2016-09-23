Rails.application.routes.draw do
  devise_for :users
  
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
