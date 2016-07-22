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

  get '/', to: redirect('/presentations')
end
