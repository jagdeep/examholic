class ExamSessionsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def index
    @exam_sessions = current_student.exam_sessions.all
  end

  def show
  end

  def new
    @exam = current_student.exams.live.where(id: params[:exam_id]).includes(:papers).first
  end

  def create
    @exam = current_student.exams.live.where(id: params[:exam_id]).first
    @paper = @exam.papers.where(id: params[:paper_id]).first
    @exam_session = ExamSession.where(student_id: current_student.id, finished_at: nil).first
    @exam_session = ExamSession.where(exam_id: @exam.id, student_id: current_student.id).first unless @exam_session
    unless @exam_session
      @exam_session = ExamSession.new
      @exam_session.exam_id = @exam.id
      @exam_session.account_id = @exam.account_id
      @exam_session.student_id = current_student.id
      @exam_session.save!
    end
    @paper_session = PaperSession.where(student_id: current_student.id, finished_at: nil).first
    @paper_session = PaperSession.where(paper_id: @paper.id, student_id: current_student.id).first unless @paper_session
    unless @paper_session
      @paper_session = PaperSession.new
      @paper_session.paper_id = @paper.id
      @paper_session.account_id = @exam.account_id
      @paper_session.student_id = current_student.id
      @paper_session.exam_session_id = @exam_session.id
      @paper_session.save!
    end
    redirect_to new_paper_session_answer_path(@paper_session)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = current_student.exam_sessions.where(:id => params[:id]).first
    end
end
