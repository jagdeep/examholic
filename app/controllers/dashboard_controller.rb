class DashboardController < ApplicationController

  def index
    if teacher_signed_in?
      redirect_to dashboard_manage_accounts_path
    elsif student_signed_in?
      redirect_to dashboard_student_accounts_path
    else
      redirect_to new_student_session_path
    end
  end
end
