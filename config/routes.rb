Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :blogs
    root "blogs#index"
    get 'blogs/search', to: 'blogs#search'
    post 'blogs/:id/unPublic', to: 'blogs#unPublic'
    post 'blogs/:id/changeDate', to: 'blogs#changeDate'
  end

end
