Rails.application.routes.draw do
  root 'blog#index', as: 'home'

  get 'blog/:id' => 'blog#show', as: 'blog'
end
