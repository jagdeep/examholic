Rails.application.routes.draw do
  get 'subjects/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :manage do
    resources :accounts do
      collection do
        get :dashboard
      end
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
      resources :subjects do
        resources :topics
      end
    end
  end

  resources :accounts do
    collection do
      get :dashboard
    end
  end
  resources :teachers
  resources :batches do
    resources :students
  end
  resources :exams do
    resources :papers do
      resources :exam_sessions, only: [:create]
    end
  end
  resources :exam_sessions, only: [:index, :show]
  resources :paper_sessions, only: [:index] do
    resources :answers, only: [:new, :create]
  end

  devise_for :teachers, path: :teacher
  devise_for :students, path: :student

  devise_scope :manage do
    authenticated :teacher do
      root 'manage/accounts#dashboard', as: :teacher_root
    end
  end

  root 'accounts#dashboard'
end
