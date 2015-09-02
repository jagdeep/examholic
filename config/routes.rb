Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :manage do
    resources :accounts do
      member do
        put :set_current
      end
      resources :teachers
      resources :batches do
        resources :students
      end
      resources :exams do
        resources :papers do
          resources :questions
        end
      end
    end
  end

  namespace :student do
    resources :accounts do
      member do
        put :set_current
      end
      resources :teachers
      resources :batches do
        resources :students
      end
      resources :exams do
        resources :papers do
          resources :questions
        end
      end
    end
  end

  devise_for :teachers
  devise_for :students

  devise_scope :manage do
    authenticated :teacher do
      root 'manage/accounts#index', as: :teacher_root
    end
  end

  devise_scope :student do
    authenticated :student do
      root 'student/accounts#index', as: :student_root
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'student/accounts#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
