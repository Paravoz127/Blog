Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  resources :companies, only: %i[index show]

  namespace :v1 do
    defaults format: :json do
      resources :companies, only: :authors do
        get :authors, on: :member
      end

      resources :authors, only: :articles do
        get :articles, on: :member
      end

      resources :articles, only: :comments do
        get :comments, on: :member
      end
    end
  end

  resources :articles, only: :show do
    resources :comments, except: %i[index new]
  end

  namespace :admin_scope do
    resources :articles
    resources :companies, except: %i[index destroy]
    resource :article_status, only: :update
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "companies#index"
end
