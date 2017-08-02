Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'

  namespace :admin do
    resources :blogs, only: [:index, :new ,:create, :edit, :update, :destroy, :search]
    root "blogs#default_admin_page"
    patch 'blogs/:id/confirm', to: 'blogs#confirm'

    resources :blogs do
      collection do
        get 'blogs/search', to: 'blogs#search'
        patch :confirm
        post :confirm
      end
      resources :comments, controller: "blogs/comments", only: [:index, :destroy]
    end

  end

end
