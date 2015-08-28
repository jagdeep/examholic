class QuestionsController < ApplicationController
  before_action :find_paper
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @questions = @paper.questions.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.account_id = @paper.account_id

    respond_to do |format|
      if @question.save
        @paper.questions << @question
        format.html { redirect_to account_exam_paper_questions_path(@current_account, @paper.exam_id, @paper), notice: 'Paper was successfully added.' }
        format.json { render :show, status: :created, location: account_exam_paper_questions_path(@current_account, @paper.exam_id, @paper) }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to account_exam_paper_questions_path(@current_account, @paper.exam_id, @paper), notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to account_exam_paper_questions_path(@current_account, @paper.exam_id, @paper), notice: 'Paper was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_paper
      @exam = Exam.where(:account_id => @current_account.id, :id => params[:exam_id]).first
      @paper = Paper.where(:exam_id => @exam.id, :id => params[:paper_id]).first
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.where(:account_id => @current_account.id, :id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      hsh = params.require(:question).permit(:title,:topic_id,:marks,:negative_marks,:option1,:option2,:option3,:option4,:option5,:answers)
      hsh[:answer] = params[:answers].select{|k,v| v == '1' }.keys if params[:answers].present?
      return hsh
    end
end
