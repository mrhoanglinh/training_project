Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "blogs#index"
  
  resources :blogs
  #get "blogs/new", to: "blogs#new"
  #get "blogs/edit", to: "blogs#edit"
  #get 'blogs/:id/edit', to: "blogs#edit"
  post 'blogs/search' => "blogs#search"
  post 'blogs/:id/unPublic', to: "blogs#unPublic"
  post 'blogs/:id/changeDate', to: "blogs#changeDate"
end
