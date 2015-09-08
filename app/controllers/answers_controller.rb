class AnswersController < ApplicationController
  before_action :authenticate_student!

  def new
    @paper_sessions = PaperSession.where(student_id: current_student.id, finished_at: nil).all
    if @paper_sessions.length > 1
      redirect_to(exams_path, alert: "Another paper is still in progress.") and return
    elsif @paper_sessions.blank?
      redirect_to(exams_path, alert: "Paper was not found.") and return
    end
    @paper_session = @paper_sessions.first
    @question = @paper_session.new_question
  end

  def create
  end
end
