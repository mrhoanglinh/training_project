Rails.application.routes.draw do
  devise_for :admins, skip: [:sessions, :passwords]
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, path: "users", skip: [:sessions]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'blogs#index'

  resources :blogs, only: [:index, :show]
  get "author", to: "authors#index"
  post "blogusers/create"
  resources :comments, only: [:create]
  #get "talk", to: "talks#show"

  authenticated do
    devise_scope :admin do
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
        #root to: "sessions#new", as: :unauthenticated
        root 'admin#blogs#index'
      end
    end
  end

  devise_scope :admin do
    get "admin", to: "admin/sessions#new", as: :admin_session
    post "admin", to:  "admin/sessions#create", as: :admin_create
    delete "admin/sign_out", to: "admin/sessions#destroy", as: :admin_destroy
  end

  devise_scope :user do
    get "users/sign_in", to: "devise/sessions#new", as: :user_session
    post "users/sign_in", to: "devise/sessions#create", as: :user_create
    get "users/sign_out", to: "devise/sessions#destroy", as: :user_destroy
    get "users/:id/edit", to: "devise/registrations#edit", as: :user_edit

    root "talks#index"
  end

end
