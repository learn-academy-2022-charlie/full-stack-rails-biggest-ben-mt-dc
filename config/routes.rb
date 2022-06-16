Rails.application.routes.draw do
  root 'blog#index', as: 'home'
  get 'blog/new' => 'blog#new', as: 'new_blog'
  get 'blog/:id' => 'blog#show', as: 'blog'
  post 'blog' => 'blog#create'
  get 'blog/:id/update' => 'blog#update', as: 'blog_update'
  delete 'blog/:id' => 'blog#destroy'
end
