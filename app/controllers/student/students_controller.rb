class Student::StudentsController < Student::ApplicationController
  before_action :find_batch
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = @batch.students.all
  end

  def show
  end

  private
    def find_batch
      @batch = current_student.batches.where(:id => params[:batch_id]).first
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = @batch.students.where(:id => params[:id]).first
    end
end
