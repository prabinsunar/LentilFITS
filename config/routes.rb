Rails.application.routes.draw do
  resources :categories
  resources :sizes
  resources :donators
  resources :items
  devise_for :users
  resources :transfers
  resources :sites
  resources :users
  resources :stocks
  resources :consumptions

  root 'transfers#index'
  get 'receive/:id' => 'transfers#receive'
  get 'past_transfers' => 'transfers#old'
  get 'allold' => 'transfers#allold'
  get 'consumptions_list' => 'consumptions#list'
  get 'allstock' => 'stocks#allstock'
  get 'allview' => 'consumptions#allview'
  get 'list_transfer' => 'transfers#list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
