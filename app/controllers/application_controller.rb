class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :auth_user!

  helper_method :current_account
  before_action :set_current_account

  private

  def current_account
    @current_account
  end

  def set_current_account
    session[:current_account_id] = params[:account_id] if params[:account_id].present?
    @current_account = Account.find(session[:current_account_id]) if session[:current_account_id].present?
  end

  def auth_user!
    if !student_signed_in? and !teacher_signed_in? and controller_name != "sessions" and controller_name != "registrations" and controller_name != "passwords"
      # render :text => controller_name and return
      redirect_to new_student_session_path
    end
  end

  def configure_devise_permitted_parameters
    registration_params = [:name, :phone, :address, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end
end
