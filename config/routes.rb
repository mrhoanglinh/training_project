Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'

  namespace :admin do
    resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy]
    root "blogs#default_admin_page"
    resources :blogs do
      collection do
        get 'blogs/search', to: 'blogs#search'
        post 'blogs/:id/unPublic', to: 'blogs#unPublic'
        post 'blogs/:id/changeDate', to: 'blogs#changeDate'
        post :confirm
      end
    end

  end

end
