class Student::ApplicationController < ApplicationController
  layout 'student/application'
  before_action :authenticate_student!

  helper_method :current_account
  before_action :set_current_account

  private

  def current_account
    @current_account
  end

  def set_current_account
    session[:current_account_id] = params[:id] if controller_name == "accounts" and params[:id]
    session[:current_account_id] = params[:account_id] if params[:account_id].present?
    @current_account = Account.where(:id => session[:current_account_id]).first if session[:current_account_id].present?
  end
end
