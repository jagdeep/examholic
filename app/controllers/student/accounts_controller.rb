class Student::AccountsController < Student::ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def set_current
    session[:current_account_id] = params[:id]
    redirect_to dashboard_student_accounts_path
  end

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  def dashboard
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end
end
