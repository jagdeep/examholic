class Student::StudentsController < Student::ApplicationController
  before_action :find_batch
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @students = @batch.students.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @student = Student.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    # ActiveRecord::Base.transaction do
    # end
    @student = Student.where(:email => student_params[:email]).first
    unless @student
      @student = Student.new(student_params)
      @student.password = '123456789'
      @student.password_confirmation = '123456789'
    end

    respond_to do |format|
      if @student.save and @subscription = Subscription.where(:batch_id => @batch.id, :student_id => @student.id, :account_id => @batch.account_id).first_or_create
        format.html { redirect_to manage_account_batch_students_path(@current_account, @batch), notice: 'Student was successfully added.' }
        format.json { render :show, status: :created, location: manage_account_batch_students_path(@current_account, @batch) }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @batch.subscriptions.where(:student_id => @student.id).first.try(:destroy)
    respond_to do |format|
      format.html { redirect_to manage_account_batch_students_path(@current_account, @batch), notice: 'Student was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_batch
      @batch = Batch.where(:account_id => @current_account.id, :id => params[:batch_id]).first
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = @batch.students.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name,:email,:phone)
    end
end
