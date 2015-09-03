class Student::PapersController < Student::ApplicationController
  before_action :find_exam
  before_action :set_paper, only: [:show]

  def index
    @papers = @exam.papers.all
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
