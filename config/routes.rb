Rails.application.routes.draw do

  devise_for :authors
  root 'blog/posts#index'

  # /authors/posts
  namespace :authors do
    get '/account/edit_profile' => 'accounts#edit', as: :edit_profile
    put '/info' => 'accounts#update_info', as: :info
    get '/account/change_password' => 'accounts#get_password', as: :edit_password
    put '/change_password' => 'accounts#change_password', as: :change_password
    resources :posts do
      put 'published' => 'posts#publish', on: :member
      put 'unpublished' => 'posts#unpublish', on: :member

    end
  end


  scope module: 'blog' do
    get 'about' => 'pages#about', as: :about
    get 'contact' => 'pages#contact', as: :contact
    get 'posts' => 'posts#index', as: :posts
    get 'posts/:id' => 'posts#show', as: :post
  end
end
