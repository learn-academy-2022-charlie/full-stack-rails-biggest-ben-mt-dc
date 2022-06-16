Rails.application.routes.draw do
  root 'blog#index', as: 'home'
  get 'blog/new' => 'blog#new', as: 'new_blog'
  get 'blog/:id' => 'blog#show', as: 'blog'
  post 'blog' => 'blog#create'
  delete 'blog/:id', to: 'blog#destroy'
end
