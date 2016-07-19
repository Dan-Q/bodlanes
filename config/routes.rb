Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
