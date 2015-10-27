class PapersController < ApplicationController
  before_action :authenticate_student!
  before_action :find_exam
  before_action :set_paper, only: [:show]

  def index
    @papers = @exam.papers.all
    @finished_paper_ids = PaperSession.where.not(finished_at: nil).where(exam_id: @exam.id, student_id: current_student.id).pluck(:paper_id)
  end

  def show
  end

  private
    def find_exam
      @exam = current_student.exams.where(:id => params[:exam_id]).first
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = @exam.papers.where(:id => params[:id]).first
    end
end
