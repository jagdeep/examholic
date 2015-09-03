class Student::BatchesController < Student::ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  def index
    @batches = current_student.batches.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = current_student.batches.where(:id => params[:id]).first
    end
end
