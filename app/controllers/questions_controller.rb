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
        format.html { redirect_to exam_paper_questions_path(@paper.exam_id, @paper), notice: 'Paper was successfully added.' }
        format.json { render :show, status: :created, location: exam_paper_questions_path(@paper.exam_id, @paper) }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(batch_params)
        format.html { redirect_to @question, notice: 'Paper was successfully updated.' }
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
      format.html { redirect_to exam_paper_questions_path(@paper.exam_id, @paper), notice: 'Paper was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_paper
      @paper = Paper.find(params[:paper_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title,:topic_id,:answer,:marks,:negative_marks)
    end
end
