Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'

  namespace :admin do
    resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy, :confirm]
    root "blogs#default_admin_page"

    resources :blogs do
      collection do
        get 'blogs/search', to: 'blogs#search'
        patch 'blogs/:id/confirm', to: "blogs#confirm"
        post :confirm
      end
    end

  end

end
