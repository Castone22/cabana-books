Rails.application.routes.draw do
  get 'about/index'
  get 'welcome/index'

  resources :books, only: [:index, :show] do
    get :next_page, on: :collection
    get :previous_page, on: :collection
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
