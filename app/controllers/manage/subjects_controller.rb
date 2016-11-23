class Manage::SubjectsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end
  
  def show
  end

  # GET /exams/new
  def new
    @subject = Subject.new
  end

  def edit
  end

    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to manage_account_subjects_path(@current_account), notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: [@current_account, @subject] }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to manage_account_subjects_path(@current_account), notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: [:manage, @current_account, @subject] }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to manage_account_subjects_url(@current_account), notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name)
    end
end
