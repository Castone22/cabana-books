Rails.application.routes.draw do
  get 'about/index'
  get 'welcome/index'

  resources :books, only: :index do
    get :save_to_shelf, on: :collection

  end

  root 'welcome#index'

  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
