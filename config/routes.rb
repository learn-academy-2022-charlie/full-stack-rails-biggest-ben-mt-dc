Rails.application.routes.draw do
  root 'blog#index'
  get 'blog/:id' => 'blog#show', as: 'blog'
end
