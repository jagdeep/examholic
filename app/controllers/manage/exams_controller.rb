class Manage::ExamsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.where(:account_id => @current_account.id).all
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)
    @exam.account_id = @current_account.id

    respond_to do |format|
      if @exam.save
        format.html { redirect_to manage_account_exams_path(@current_account), notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: [@current_account, @exam] }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to manage_account_exams_path(@current_account), notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: [:manage, @current_account, @exam] }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to manage_account_exams_url(@current_account), notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.where(:account_id => @current_account.id, :id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:name,:duration,:start_time,:end_time,:batch_id)
    end
end
