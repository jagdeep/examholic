class Student::ExamsController < Student::ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    @exams = current_student.exams.all
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = current_student.exams.where(:id => params[:id]).first
    end
end
