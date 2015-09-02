class Manage::PapersController < Manage::ApplicationController
  before_action :find_exam
  before_action :set_paper, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @papers = @exam.papers.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @paper = Paper.new
  end

  def edit
  end

  def create
    @paper = Paper.new(paper_params)
    @paper.exam = @exam
    @paper.account_id = @exam.account_id

    respond_to do |format|
      if @paper.save
        format.html { redirect_to manage_account_exam_papers_path(@current_account, @exam), notice: 'Paper was successfully added.' }
        format.json { render :show, status: :created, location: manage_account_exam_papers_path(@current_account, @exam) }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to manage_account_exam_papers_path(@current_account, @exam), notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to manage_account_exam_papers_path(@current_account, @exam), notice: 'Paper was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_exam
      @exam = Exam.where(:account_id => @current_account.id, :id => params[:exam_id]).first
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.where(:account_id => @current_account.id, :id => params[:id], :exam_id => params[:exam_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      params.require(:paper).permit(:name,:status,:duration,:marks_per_question,:negative_marks_per_question)
    end
end
