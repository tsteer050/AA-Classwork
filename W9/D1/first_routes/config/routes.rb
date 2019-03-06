Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :destroy, :show, :update] do
    resources :artworks, only: :index 
    resources :comments, only: :index
    resources :likes, only: [:index, :create]
    get 'favorites', :on => :member
    resources :artwork_collections, only: [:index, :create]
  end

  resources :artworks, only: [:create, :destroy, :show, :update] do
    resources :comments, only: :index
    resources :likes, only: :index
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy] do 
    resources :likes, only: :index
  end

  resources :likes, only: :destroy

  resources :artwork_collections, only: :destroy

  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'  
  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'



end

#     Users 
#     Likes 
#    /     \
#   Artmork
#    Comments
  
#   likes table
#   type (comments, artwork)





# class likes
#   belongs_to :likeable, polymorphic: true
# end

# comment
#   has_one: :likeable
# end

# class CreateLikes < ActiveRecord::Migration[5.0]
#   def change
#     create_table :likes do |t|
#       t.string :name
#       t.references :likeable, polymorphic: true, index: true
#       t.timestamps
#     end
#   end
# end

# likeable_id  ----foreign key related to type
# likeable_type --- comment, user, artwork